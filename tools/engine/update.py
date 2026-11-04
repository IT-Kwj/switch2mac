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

A game's build is: for nxnative, the commits that change its profile (dm/games/<title ID>; game.json "watch" lists other paths); for pokopia-native, every commit
of that repository. The newest such commit on the default branch is the one taken. Uses gh (signed in) or GitHub's public API.
"""
import json, os, re, shutil, subprocess, sys, urllib.request
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


def games():
    out = []
    for p in sorted((ROOT / 'games').glob('*/game.json')):
        g = json.loads(p.read_text())
        if g.get('engine'): g.update(dir=p.parent, json=p); out.append(g)
    return out


def newest(g):   # (sha, date, subject) of the newest commit of the game's build
    e = g['engine']; slug = re.search(r'github\.com/([\w.-]+/[\w.-]+?)(?:\.git)?$', e['repo'])[1]
    paths = g.get('watch') or ([f'dm/games/{g["title_id"]}'] if e['kind'] == 'nxnative' else [''])
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
    elif e['kind'] == 'pokopia-native':
        t = (d / 'nxs2.py').read_text()   # the two lines switch2mac.py build edits
        if t.count("DM_NVN_SHDUMP=shdump\\n'\n") != 1 or t.count("'shader_facts.seed.tsv'):") != 1: raise RuntimeError('nxs2.py changed where switch2mac.py build edits it (APP_ENV, the profile step)')
        nx = d / 'nxnative'; env = dict(env, NXNATIVE=str(nx))
        run([py(), d / 'nxs2.py', 'setup', '--no-ios'], env=env, cwd=d)
        say(run([py(), ROOT / 'tools/engine/patch.py', nx]).rstrip())
        host = nx / 'dm/host'; prof = d / 'profile'
        genv = dict(env, DM_GAMES_DIR=str(prof), DM_GAMES_FIRST='1', DM_GAME=g['title_id'])
    else: raise RuntimeError(f'engine kind {e["kind"]} unknown')
    if compile_host:
        v = subprocess.run(['sw_vers', '-productVersion'], capture_output=True, text=True).stdout.strip().split('.')
        run(['make', '-C', host, f'GAME={g["title_id"]}', f'MACOS_MIN={v[0]}.{v[1] if len(v) > 1 else 0}', 'dmhost'], env=genv)
        (host / 'dmhost').unlink(missing_ok=True)
        say('  host compiles with the overlay, key-2 settings and the shared shader list')


def bump(g, sha):   # the repository's files name the new commit
    old = g['engine']['commit']; kind = g['engine']['kind']
    j = g['json']; j.write_text(j.read_text().replace(old, sha))
    sl = g['dir'] / 'shader_list.tsv'
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


def main():
    apply_, compile_host = '--apply' in sys.argv, '--compile' in sys.argv
    if apply_ and git('-C', str(ROOT), 'branch', '--show-current') != 'dev': sys.exit('--apply works on the dev branch only (git switch dev)')
    if apply_ and git('-C', str(ROOT), 'status', '--porcelain', '--untracked-files=no'): sys.exit('--apply needs a clean dev branch: commit or put away the changes first')
    changed = 0
    for g in games():
        e = g['engine']; sha, date, subj = newest(g)
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
        msg = f'{g["name"]}: {e["kind"]} {sha[:12]} ({subj})\n\nThe build moved from {e["commit"][:12]}; switch2mac\'s overlay, key-2 settings and shared shader list re-applied (tools/engine/update.py).\n\nCo-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>\n'
        subprocess.run(['git', '-C', str(ROOT), 'commit', '-q', '-m', msg], env=dict(os.environ, TZ='UTC'), check=True)
        say(f'  updated on dev: {git("-C", str(ROOT), "log", "--oneline", "-1")}')
    if not changed: say('all builds up to date')


if __name__ == '__main__':
    main()
