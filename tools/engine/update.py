#!/usr/bin/env python3
"""Keeps the games built with another engine on the newest version of their build, the way switch2mac builds them (overlay, key-2 settings, shared shader list).

  tools/engine/update.py                    which games' builds have changed since the commit game.json pins (nothing is changed)
  tools/engine/update.py --apply [--compile]   move each changed game to its build's new commit, on the dev branch:

    1. fetch the new commit into engines/ and add switch2mac's front end to it (tools/engine/patch.py); pokopia-native: its setup first, and its two lines
       switch2mac.py build edits (the app's switches, the profile step) must still be there. Anything that no longer fits stops that game: it stays where it was.
    2. --compile: build the game's host (dmhost) with the front end, as a check (a minute or two each).
    3. game.json takes the new commit; the game's shader_list.tsv keeps its rows and names the new engine in its header (keys can change with an engine version:
       old rows a build does not have are skipped quietly, and contributions recorded with the old engine are refused by tools/shader_list.py from then on);
       the game's README and NOTICE.md name the new commit. One commit on dev per game; the old version's download in engines/ is deleted. Nothing is pushed.

  tools/engine/update.py --new-games        also add the Switch 2 games nxnative has a profile for and switch2mac has no folder for yet (with --apply: a folder each,
                                            made from nxnative's profile: game.json, a page that links its notes, an empty shader list and reports table, a README row)
  --check   only say whether anything is due (for the GitHub workflow: writes changed=true/false to $GITHUB_OUTPUT)
  --ci      on GitHub: commit on the branch checked out (main) instead of requiring dev

A game's build is: for switch2mac-engine, every commit; for nxnative, the commits that change its profile (dm/games/<title ID>; game.json "watch" lists other paths); for pokopia-native, every commit
of that repository. The newest such commit on the default branch is the one taken. Uses gh (signed in) or GitHub's public API.
"""
import time, json, os, re, shutil, subprocess, sys, urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ENGINES = ROOT / 'engines'


def say(m): print(m, flush=True)


def api(path):   # GitHub REST, through gh when it is signed in (higher rate limit), else anonymously
    if shutil.which('gh'):
        r = subprocess.run(['gh', 'api', path], capture_output=True, text=True)
        if r.returncode == 0: return json.loads(r.stdout)
    with urllib.request.urlopen(urllib.request.Request(f'https://api.github.com/{path}', headers={'User-Agent': 'switch2mac', 'Accept': 'application/vnd.github+json'}), timeout=30) as f:
        return json.load(f)


def games():   # one entry a game and build (Mario Kart World has two: switch2mac's engine and nxnative's), each with its engine and shader list
    out = []
    for p in sorted((ROOT / 'games').glob('*/game.json')):
        g = json.loads(p.read_text())
        bs = g.get('builds') or ([{'id': g['engine']['kind'], 'engine': g['engine'], 'shader_list': 'shader_list.tsv'}] if g.get('engine') else [])
        for b in bs:
            out.append(dict(g, **({'watch': b['watch']} if 'watch' in b else {}), engine=b['engine'], dir=p.parent, json=p, list=p.parent / b.get('shader_list', 'shader_list.tsv'),
                            name=g['name'] + (f' ({b["id"]} build)' if len(bs) > 1 else '')))
    return out


def newest(g):   # (sha, date, subject) of the newest commit of the game's build
    e = g['engine']; slug = re.search(r'github\.com/([\w.-]+/[\w.-]+?)(?:\.git)?$', e['repo'])[1]
    paths = g.get('watch') or ([f'dm/games/{g["title_id"]}'] if e['kind'] == 'nxnative' else [''])   # switch2mac, pokopia-native: the whole repository
    best = None
    for p in paths:
        c = api(f'repos/{slug}/commits?per_page=1' + (f'&path={p}' if p else ''))[0]
        x = (c['sha'], c['commit']['committer']['date'], c['commit']['message'].split('\n')[0])
        if not best or x[1] > best[1]: best = x
    return best


def git(*a, cwd=None, check=True):
    r = subprocess.run(['git', *a], cwd=cwd, capture_output=True, text=True)
    if check and r.returncode: raise RuntimeError(f'git {" ".join(a[:2])}: {r.stderr.strip()}')
    return r.stdout.strip()


def fetch(repo, sha, kind):   # the engine at that commit in engines/<kind>-<sha12> (as switch2mac.py build fetches it)
    d = ENGINES / f'{kind}-{sha[:12]}'
    if (d / '.git').is_dir(): return d
    tmp = d.with_name(d.name + '.part'); shutil.rmtree(tmp, ignore_errors=True); tmp.mkdir(parents=True)
    for c in (['init', '-q'], ['remote', 'add', 'origin', repo], ['fetch', '-q', '--depth', '1', 'origin', sha], ['checkout', '-q', 'FETCH_HEAD']): git('-C', str(tmp), *c)
    tmp.rename(d); return d


def py():
    v = ROOT / '.venv/bin/python'
    return str(v) if v.exists() else sys.executable


def run(cmd, env=None, cwd=None):
    r = subprocess.run([str(c) for c in cmd], env=env, cwd=cwd, capture_output=True, text=True)
    if r.returncode: raise RuntimeError(f'{Path(str(cmd[1] if len(cmd) > 1 else cmd[0])).name}: ' + (r.stdout + r.stderr).strip()[-1500:])
    return r.stdout


def prepare(g, sha, compile_host):   # the new engine with the front end added, checked; raises on anything that does not fit
    e = g['engine']; d = fetch(e['repo'], sha, e['kind']); env = dict(os.environ)
    if e['kind'] == 'nxnative':
        say(run([py(), ROOT / 'tools/engine/patch.py', d]).rstrip())
        if not (d / f'dm/games/{g["title_id"]}/game.tsv').is_file(): raise RuntimeError(f'the new commit has no profile for {g["title_id"]}')
        host, genv = d / 'dm/host', env
    elif e['kind'] == 'switch2mac':   # switch2mac's own engine carries its front end already
        if not (d / f'dm/games/{g["title_id"]}/game.tsv').is_file(): raise RuntimeError(f'the new commit has no profile for {g["title_id"]}')
        host, genv = d / 'dm/host', env
    elif e['kind'] == 'pokopia-native':
        t = (d / 'nxs2.py').read_text()   # the two lines switch2mac.py build edits
        if t.count("DM_NVN_SHDUMP=shdump\\n'\n") != 1 or t.count("'shader_facts.seed.tsv'):") != 1: raise RuntimeError('nxs2.py changed where switch2mac.py build edits it (APP_ENV, the profile step)')
        nx = d / 'nxnative'; env = dict(env, NXNATIVE=str(nx))
        run([py(), d / 'nxs2.py', 'setup', '--no-ios'], env=env, cwd=d)
        say(run([py(), ROOT / 'tools/engine/patch.py', nx]).rstrip())
        host = nx / 'dm/host'; prof = d / 'profile'
        genv = dict(env, DM_GAMES_DIR=str(prof), DM_GAMES_FIRST='1', DM_GAME=g['title_id'])
    elif e['kind'] == 'macnativegames':   # its own runtime and builder (build_app.py), no switch2mac front end: the new commit must still have the builder and the game's runtime
        for f in ([e['builder']['script']] if e.get('builder') else ['build_app.py', 'games/totk']):   # a community port: its own builder script
            if not (d / f).exists(): raise RuntimeError(f'the new commit has no {f}')
        return
    else: raise RuntimeError(f'engine kind {e["kind"]} unknown')
    if compile_host:
        v = subprocess.run(['sw_vers', '-productVersion'], capture_output=True, text=True).stdout.strip().split('.')
        run(['make', '-C', host, f'GAME={g["title_id"]}', f'MACOS_MIN={v[0]}.{v[1] if len(v) > 1 else 0}', 'dmhost'], env=genv)
        (host / 'dmhost').unlink(missing_ok=True)
        say('  host compiles with the overlay, key-2 settings and the shared shader list')


def bump(g, sha):   # the repository's files name the new commit
    old = g['engine']['commit']; kind = g['engine']['kind']
    j = g['json']; j.write_text(j.read_text().replace(old, sha))
    sl = g['list']
    if sl.exists():
        lines = sl.read_text().split('\n')
        for i in range(min(5, len(lines))):
            if lines[i].startswith('#'): lines[i] = lines[i].replace(f'{kind}-{old[:12]}', f'{kind}-{sha[:12]}').replace(f'at {old[:12]}', f'at {sha[:12]}')
        sl.write_text('\n'.join(lines))
    rd = g['dir'] / 'README.md'
    if rd.exists(): rd.write_text(rd.read_text().replace(old, sha))
    n = ROOT / 'NOTICE.md'; t = n.read_text().split('\n')
    for i, l in enumerate(t):
        if g['engine']['repo'] in l or f'games/{g["dir"].name}/' in l:
            for k in (12, 8, 7): l = l.replace(f'`{old[:k]}`', f'`{sha[:k]}`')
            t[i] = l
    n.write_text('\n'.join(t))


NX_REPO = 'https://github.com/seedds/nxnative'


def slug(name):   # a folder name: letters and digits, accents dropped ("Pokémon" → pokemon), words joined by -
    import unicodedata
    return re.sub(r'[^a-z0-9]+', '-', unicodedata.normalize('NFKD', name).encode('ascii', 'ignore').decode().lower()).strip('-')


def new_games():   # [(title ID, name, version, newest commit of its profile)]: nxnative's Switch 2 profiles switch2mac has no folder for
    have = {g['title_id'] for g in games()} | {json.loads(p.read_text())['title_id'] for p in (ROOT / 'games').glob('*/game.json')}
    out = []
    for item in api('repos/seedds/nxnative/contents/dm/games?ref=main'):
        tid = item['name']
        if item['type'] != 'dir' or not re.fullmatch(r'0[14][0-9A-F]{14}', tid) or tid in have: continue   # Switch 2 (04...) and Switch (01...) games
        import base64
        tsv = base64.b64decode(api(f'repos/seedds/nxnative/contents/dm/games/{tid}/game.tsv?ref=main')['content']).decode('utf-8', 'replace')
        name = next((l.split('\t', 1)[1].strip() for l in tsv.splitlines() if l.startswith('name\t')), tid)
        build = next((l.split('\t') for l in tsv.splitlines() if l.startswith('build\t')), ['build', 'v0'])
        c = api(f'repos/seedds/nxnative/commits?per_page=1&path=dm/games/{tid}')[0]
        out.append((tid, name, build[1] if tid.startswith('04') else versions_of(tsv), c['sha'], c['commit']['message'].split('\n')[0]))
    return out


def add_game(tid, name, version, sha):
    """A game nxnative has a profile for, as a folder like Donkey Kong Bananza's: game.json, a page pointing at nxnative's notes (nothing is
    copied from them), an empty shared shader list and reports table, and its rows in the README's two tables."""
    d = ROOT / 'games' / slug(name); d.mkdir(parents=True, exist_ok=True)
    ver = f'update {version}' if version not in ('v0', '') else 'base game'
    upd = f'`base/` and `updates/{version[1:]}/`' if version[1:].isdigit() and version != 'v0' else '`base/` (exefs and romfs)'
    (d / 'game.json').write_text(json.dumps({'title_id': tid, 'name': name, 'version': ver, 'engine': {'kind': 'nxnative', 'repo': NX_REPO, 'commit': sha}, 'disk_gb': 50}, indent=1, ensure_ascii=False) + '\n')
    (d / 'shader_list.tsv').write_text(f'# switch2mac shared shader list\tgame={tid}\tengine=nxnative-{sha[:12]}\n# {name}, built with nxnative at {sha[:12]}. Added to nxnative\'s own seed list '
                                       '(its profile\'s pso_manifest.tsv) at build time; shipped in the app as pso_manifest.tsv.\n# Rows: S<TAB>shader key<TAB>stage / C<TAB>compute shader key / '
                                       'R<TAB>render pipeline key (hex): identifiers and render state only, no game data. Row order = first-use order; do not sort.\n')
    (d / 'reports.tsv').write_text(f"# How {name} ran on players' Macs, by build. Only reports that name the Mac are kept.\n"
                                   '# Columns: Mac, chip, memory (GB), macOS, build (game.json build id, with its commit when known), fps, peak memory (GB), notes, source, date (when known; tools/reports.py adds it)\n')
    notes = f'{NX_REPO}/tree/{sha}/dm/games/{tid}'
    (d / 'README.md').write_text(f"""# {name}

Title ID `{tid}`, {ver}. Added automatically when [nxnative]({NX_REPO}) added its profile: see [nxnative's notes on it]({notes}) for how far it plays and on which Mac.

Built with nxnative's own builder at the commit `game.json` names (fetched once into `./engines`), with switch2mac's front end added (`tools/engine/patch.py`): the game starts at once, **key 1** is the performance overlay and **key 2** the settings.

| What | |
|---|---|
| Profile and notes | [nxnative `dm/games/{tid}`]({notes}) |
| Dump folder | {upd} |

## Shared shader list

[`shader_list.tsv`](shader_list.tsv): this game's own list of shaders and pipelines players have met, for this engine version only. It starts empty: when you close the game, the app offers to send what it built.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac. Tell others how it ran with the [How it ran](https://github.com/azmasm/switch2mac/issues/new?template=how-it-ran.yml) form.

## Build

In the switch2mac app: choose your dump folder on the **Builds** page and press **Build**. In Terminal:

```bash
./switch2mac.py build "<your dump folder>"
```
""")
    r = ROOT / 'README.md'; t = r.read_text()
    row = f"| {name} | {ver} | [nxnative]({NX_REPO}) | Added from nxnative's profile: see [its notes]({notes}). | [games/{slug(name)}](games/{slug(name)}) |\n"
    t = t.replace('| Your game? |', row + '| Your game? |', 1)
    lines = t.split('\n'); i = next(k for k, l in enumerate(lines) if l.startswith('| Game | The folder you choose holds |'))
    j = i + 2
    while j < len(lines) and lines[j].startswith('|'): j += 1
    lines.insert(j, f'| {name} | {upd} |')
    r.write_text('\n'.join(lines))
    return d


def versions_of(tsv):   # a Switch profile's versions: [(version id, display version)] from its "build" lines ("build  v262144  1.2.2  main=..."), in order
    return [(l.split('\t')[1], l.split('\t')[2] if len(l.split('\t')) > 2 else '') for l in tsv.splitlines() if l.startswith('build\t')]


def add_switch1_game(tid, name, versions, sha):
    """A Switch game nxnative has a profile for: game.json (checked once a day: Switch games are many and their profiles move rarely), a page pointing at nxnative's
    notes (nothing copied from them), an empty shared shader list and reports table. Built from the player's own .nsp / .xci with their own prod.keys"""
    d = ROOT / 'games' / slug(name)
    if d.exists(): d = ROOT / 'games' / f'{slug(name)}-{tid.lower()}'
    d.mkdir(parents=True)
    shown = ', '.join(v or vid for vid, v in versions) or 'see its profile'
    (d / 'game.json').write_text(json.dumps({'title_id': tid, 'name': name, 'version': shown, 'console': 'switch', 'check': 'daily',
        'builds': [{'id': 'nxnative', 'name': 'nxnative', 'versions': [vid for vid, _ in versions], 'version_names': {vid: v for vid, v in versions if re.fullmatch(r'\d+(\.\d+)+', v or '')}, 'engine': {'kind': 'nxnative', 'repo': NX_REPO, 'commit': sha},
                    'shader_list': 'shader_list.tsv', 'about': f"nxnative's profile ({shown}) with switch2mac's overlay and key-2 settings: see its notes for how far it plays."}],
        'disk_gb': 30}, indent=1, ensure_ascii=False) + '\n')
    (d / 'shader_list.tsv').write_text(f'# switch2mac shared shader list\tgame={tid}\tengine=nxnative-{sha[:12]}\n# {name}, built with nxnative at {sha[:12]}. Added to nxnative\'s own seed list '
                                       '(its profile\'s pso_manifest.tsv) at build time.\n# Rows: S<TAB>shader key<TAB>stage / C<TAB>compute shader key / '
                                       'R<TAB>render pipeline key (hex): identifiers and render state only, no game data. Row order = first-use order; do not sort.\n')
    (d / 'reports.tsv').write_text(f"# How {name} ran on players' Macs, by build. Only reports that name the Mac are kept.\n"
                                   '# Columns: Mac, chip, memory (GB), macOS, build (game.json build id, with its commit when known), fps, peak memory (GB), notes, source, date (when known; tools/reports.py adds it)\n')
    notes = f'{NX_REPO}/tree/{sha}/dm/games/{tid}'
    (d / 'README.md').write_text(f"""# {name}

Title ID `{tid}`. A **Switch** game: built from your own copy's `.xci` / `.nsp` files with your own `prod.keys` (see [LEGAL.md](../../LEGAL.md)). Versions: {shown}.

Added automatically from [nxnative]({NX_REPO})'s profile: see [its notes]({notes}) for how far it plays and on which Mac. Built with nxnative's builder at the commit `game.json` names, with switch2mac's front end: the game starts at once, **key 1** is the performance overlay and **key 2** the settings.

## Shared shader list

[`shader_list.tsv`](shader_list.tsv): shaders and pipelines players have met. When you close the game, the app offers to send what it built.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac. Tell others how it ran with the [How it ran](https://github.com/azmasm/switch2mac/issues/new?template=how-it-ran.yml) form.

## Build

In the switch2mac app: **+ Build game**, choose the game's file (or the folder with its base game, update and DLC), then your `prod.keys`. In Terminal:

```bash
./switch2mac.py build "<the game's .xci or .nsp, or its folder>" --keys <path of prod.keys>
```
""")
    return d


def main():
    apply_, compile_host, ci, check = '--apply' in sys.argv, '--compile' in sys.argv, '--ci' in sys.argv, '--check' in sys.argv
    if apply_ and not ci and git('-C', str(ROOT), 'branch', '--show-current') != 'dev': sys.exit('--apply works on the dev branch only (git switch dev)')
    if apply_ and git('-C', str(ROOT), 'status', '--porcelain', '--untracked-files=no'): sys.exit('--apply needs a clean branch: commit or put away the changes first')
    if check: apply_ = False
    sign = '' if ci else '\nCo-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>\n'   # a commit made on GitHub is the workflow's own
    changed = 0
    hour = time.gmtime().tm_hour
    for g in games():
        e = g['engine']
        if g.get('check') == 'daily' and os.environ.get('GITHUB_ACTIONS') and int(g['title_id'][2:12], 16) % 24 != hour: continue   # checked in its own hour of the day on GitHub (the rate limit), every run here
        try: sha, date, subj = newest(g)
        except Exception as x: say(f'{g["name"]}: could not check {e["repo"]} ({x})'); continue
        if sha == e['commit']: say(f'{g["name"]}: up to date ({e["kind"]} {sha[:12]})'); continue
        changed += 1
        say(f'{g["name"]}: {e["kind"]} has a newer build: {sha[:12]} ({date[:10]}: {subj}); pinned {e["commit"][:12]}')
        if not apply_: continue
        try:
            prepare(g, sha, compile_host)
        except RuntimeError as x:
            say(f'  NOT updated: {x}'); continue
        bump(g, sha)
        old = ENGINES / f'{e["kind"]}-{e["commit"][:12]}'   # the replaced version's download (hundreds of MB): no game pins it any more
        if old.is_dir() and not any(x['engine']['commit'][:12] == e['commit'][:12] for x in games() if x['engine']['kind'] == e['kind']): shutil.rmtree(old)
        git('-C', str(ROOT), 'add', '-A', 'games', 'NOTICE.md')
        msg = f'{g["name"]}: {e["kind"]} {sha[:12]} ({subj})\n\nThe build moved from {e["commit"][:12]}; switch2mac\'s overlay, key-2 settings and shared shader list re-applied (tools/engine/update.py).\n{sign}'
        subprocess.run(['git', '-C', str(ROOT), 'commit', '-q', '-m', msg], env=dict(os.environ, TZ='UTC'), check=True)
        say(f'  updated: {git("-C", str(ROOT), "log", "--oneline", "-1")}')
    if '--new-games' in sys.argv:
        try: found = new_games()
        except Exception as x: say(f'new games: could not check nxnative ({x})'); found = []
        for tid, name, version, sha, subj in found:
            changed += 1; say(f'new game in nxnative: {name} ({tid}, {version}) at {sha[:12]} ({subj})')
            if not apply_: continue
            g = {'name': name, 'title_id': tid, 'engine': {'kind': 'nxnative', 'repo': NX_REPO, 'commit': sha}}
            try: prepare(g, sha, compile_host)
            except RuntimeError as x: say(f'  NOT added: {x}'); continue
            d = add_switch1_game(tid, name, version, sha) if tid.startswith('01') else add_game(tid, name, version, sha)
            git('-C', str(ROOT), 'add', '-A', str(d), 'README.md')
            subprocess.run(['git', '-C', str(ROOT), 'commit', '-q', '-m', f'New game: {name} (nxnative {sha[:12]})\n\nnxnative added its profile ({subj}); switch2mac builds it with nxnative\'s builder and its front end (tools/engine/update.py --new-games).\n{sign}'],
                           env=dict(os.environ, TZ='UTC'), check=True)
            say(f'  added: {git("-C", str(ROOT), "log", "--oneline", "-1")}')
    if not changed: say('all builds up to date, no new games')
    if os.environ.get('GITHUB_OUTPUT'):
        with open(os.environ['GITHUB_OUTPUT'], 'a') as f: f.write(f'changed={"true" if changed else "false"}\n')


if __name__ == '__main__':
    main()
