#!/usr/bin/env python3
"""The shared shader lists: one per game, games/<game>/shader_list.tsv, holding the shaders and Metal pipelines players have met, so a new install builds them
before its first frame instead of stuttering while it plays. Each list belongs to one game AND the engine its app is built with (its header says which):
a key from another game or engine version is refused, so lists never mix. Rows are identifiers only, never game data:
S<TAB>shader key<TAB>stage / C<TAB>compute shader key / R<TAB>render pipeline key (hex). Row order is first-use order and is kept (rows are only appended).

How rows arrive (the way MacNativeGames does it for Tears of the Kingdom): the app compares what it built (pso_user.tsv beside its save folder) with the list it
shipped, and keeps the rest in shader-list-contribution.txt in ~/Library/Application Support/nxnative/<title ID>/. Each time 100 new rows have built up, it asks
when the game closes: Send opens the "Shader list" issue form on GitHub and shows the file in Finder to drag in; nothing is sent by the app itself.

  tools/shader_list.py stats                                every game's list: rows by kind, its engine
  tools/shader_list.py new <game>                           your own app's rows the list lacks → shader-list-<title ID>.txt (to send, or to merge)
  tools/shader_list.py merge <game> <file> [...] [--drop-unknown]   add contributed rows to a game's list (checked as collect checks them)
  tools/shader_list.py collect [--apply] [--close] [--drop-unknown]  the open "shader list" issues on GitHub (gh): read each file, check it, report;
                                                            --apply adds the rows to the lists, --close then thanks and closes each issue it took
  tools/shader_list.py ship <game> <out pso_manifest.tsv> [--base <engine's own list>]   the list a build ships (switch2mac.py build runs it)

<game> is a games/ folder name (mario-kart-world) or a title ID. A contribution's header names its game and engine; rows whose shader keys are not the game's
(checked where the game's shader table is at hand: Mario Kart World and Donkey Kong Bananza once their engine is fetched) refuse the file unless --drop-unknown.
"""
import json, re, subprocess, sys, urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ROW = re.compile(r'^(S\t[0-9a-f]{16}_[a-z0-9]+\t\d+|C\t[0-9a-f]{16}_[a-z0-9]+|R\t[0-9a-f]+)$')   # keys, stages and render state as hex: nothing else is accepted
HEAD = re.compile(r'^# switch2mac shader list.*\bgame=([0-9A-Fa-f]{16})\b.*\bengine=([\w.-]+)')   # a list's or a contribution's first line
ATTACH = re.compile(r'https://github\.com/(?:user-attachments/files|[\w.-]+/[\w.-]+/files)/[^\s)\]>"]+')
LABEL = 'shader-list'


def games():
    out = {}
    for p in sorted((ROOT / 'games').glob('*/game.json')):
        g = json.loads(p.read_text()); e = g.get('engine')
        # engine_id: what a list and a contribution name. switch2mac's own engine keeps "switch2mac" across its commits (its shader keys change only with its translator,
        # which switch2mac controls); another engine is named with its commit. engine_dir: where switch2mac.py build fetched it (engines/<kind>-<commit>)
        g.update(dir=p.parent, list=p.parent / 'shader_list.tsv', engine_dir=ROOT / f'engines/{e["kind"]}-{e["commit"][:12]}',
                 engine_id='switch2mac' if e['kind'] == 'switch2mac' else f'{e["kind"]}-{e["commit"][:12]}')
        out[g['title_id']] = g
    return out


def game(name):
    gs = games()
    for t, g in gs.items():
        if name.upper() == t or name == g['dir'].name: return g
    sys.exit(f'{name}: not a game here ({", ".join(g["dir"].name for g in gs.values())})')


def rows(text):
    return [l for l in text.replace('\r', '').splitlines() if ROW.match(l)]


def header(text):   # (title ID, engine) from the first header line, or None
    for l in text.replace('\r', '').splitlines()[:5]:
        m = HEAD.match(l)
        if m: return m[1].upper(), m[2]
    return None


def known_keys(g):   # the game's shader keys, or None when its table is not at hand (its rows are then checked by form only)
    m = g['engine_dir'] / f'dm/games/{g["title_id"]}/shader_map.tsv'   # switch2mac's and nxnative's engines carry the game's shader map
    if not m.exists(): return None
    keys = set(re.findall(r'^\S+\t\d+\t\w+\t([0-9a-f]{16})\b', m.read_text(), re.M))
    rt = g['dir'] / 'runtime_shaders.tsv'
    if rt.exists(): keys |= set(re.findall(r'^([0-9a-f]{16})\t', rt.read_text(), re.M))
    return keys


def check(g, text, drop_unknown):   # (rows to add, problems): problems refuse the file
    h = header(text); bad = []
    if h and h[0] != g['title_id']: bad.append(f'it is for title {h[0]}, not {g["name"]} ({g["title_id"]})')
    if h and h[1] != g['engine_id']: bad.append(f'it was recorded with engine {h[1]}; {g["name"]}\'s list is for {g["engine_id"]}: keys differ between engines')
    got = rows(text); keys = known_keys(g); unknown = []
    if keys is not None:
        unknown = [r for r in got if r[0] in 'SC' and r.split('\t')[1][:16] not in keys]
        if unknown and not drop_unknown: bad.append(f'{len(unknown)} of its {len(got)} rows name shaders {g["name"]} does not have (another game or version?): --drop-unknown drops them')
        got = [r for r in got if r not in unknown]
    return got, bad, unknown


def append(g, new):   # rows the list lacks, appended in their order; the count added
    have = set(rows(g['list'].read_text())); add = [r for r in dict.fromkeys(new) if r not in have]
    if add:
        t = g['list'].read_text(); g['list'].write_text(t + ('' if t.endswith('\n') else '\n') + ''.join(r + '\n' for r in add))
    return len(add)


def gh(*a):
    r = subprocess.run(['gh', *a], capture_output=True, text=True)
    if r.returncode: sys.exit(f'gh {" ".join(a[:3])}: {r.stderr.strip()}')
    return r.stdout


def repo():
    url = subprocess.run(['git', '-C', ROOT, 'remote', 'get-url', 'origin'], capture_output=True, text=True).stdout.strip()
    m = re.search(r'github\.com[:/]([\w.-]+/[\w.-]+?)(?:\.git)?$', url)
    if not m: sys.exit(f'origin is not a GitHub repository: {url}')
    return m[1]


def fetch(url):   # an issue attachment: text only, 2 MB at most
    with urllib.request.urlopen(urllib.request.Request(url, headers={'User-Agent': 'switch2mac'}), timeout=30) as r:
        return r.read(2 << 20).decode('utf-8', 'replace')


def main():
    argv = sys.argv[1:]; base = argv[argv.index('--base') + 1] if '--base' in argv[:-1] else None
    a = [x for i, x in enumerate(argv) if not x.startswith('--') and not (i and argv[i - 1] == '--base')]; flags = {x for x in argv if x.startswith('--')}
    drop = '--drop-unknown' in flags
    if not a: sys.exit(__doc__)
    if a[0] == 'stats':
        for t, g in games().items():
            r = rows(g['list'].read_text()) if g['list'].exists() else []
            print(f'{g["name"]} ({t}), engine {g["engine_id"]}: {len(r)} rows (S {sum(x[0] == "S" for x in r)}, C {sum(x[0] == "C" for x in r)}, R {sum(x[0] == "R" for x in r)}) in {g["list"].relative_to(ROOT)}')
    elif a[0] == 'new' and len(a) == 2:
        g = game(a[1]); user = Path.home() / f'Library/Application Support/nxnative/{g["title_id"]}/pso_user.tsv'
        if not user.exists(): sys.exit(f'{user} does not exist yet: play the game first')
        have = set(rows(g['list'].read_text())); new = [r for r in dict.fromkeys(rows(user.read_text())) if r not in have]
        out = Path(f'shader-list-{g["title_id"]}.txt')
        out.write_text(f'# switch2mac shader list contribution\tgame={g["title_id"]}\tengine={g["engine_id"]}\n' + ''.join(r + '\n' for r in new))
        print(f'{len(new)} new rows → {out.resolve()}' + ('' if new else ' (nothing to send)'))
    elif a[0] == 'merge' and len(a) >= 3:
        g = game(a[1]); n = 0
        for f in a[2:]:
            got, bad, unknown = check(g, Path(f).read_text(errors='replace'), drop)
            if bad: print(f'{f}: refused: ' + '; '.join(bad)); continue
            k = append(g, got); n += k
            print(f'{f}: {len(got)} rows, {k} new' + (f', {len(unknown)} of other shaders dropped' if unknown else ''))
        print(f'{g["list"].relative_to(ROOT)}: {n} rows added')
    elif a[0] == 'collect':
        gs = games(); byname = {g['name'].lower(): g for g in gs.values()}
        issues = json.loads(gh('issue', 'list', '--repo', repo(), '--label', LABEL, '--state', 'open', '--limit', '200', '--json', 'number,title,body,url'))
        if not issues: print('no open shader list issues'); return
        added = {}
        for i in issues:
            texts = [i['body'] or ''] + [fetch(u) for u in dict.fromkeys(ATTACH.findall(i['body'] or ''))]
            blob = '\n'.join(texts); h = header(blob)
            tid = h[0] if h else next((t for t in gs if t in blob.upper()), None) or next((g['title_id'] for n, g in byname.items() if n in (i['title'] or '').lower()), None)
            if tid not in gs: print(f'#{i["number"]}: no game this repository has (left open)'); continue
            g = gs[tid]; got, bad, unknown = check(g, blob, drop)
            if bad: print(f'#{i["number"]} {g["name"]}: refused (left open): ' + '; '.join(bad)); continue
            if not got: print(f'#{i["number"]} {g["name"]}: no rows found (left open: no file attached?)'); continue
            k = append(g, got) if '--apply' in flags else len([r for r in dict.fromkeys(got) if r not in set(rows(g['list'].read_text()))])
            print(f'#{i["number"]} {g["name"]}: {len(got)} rows, {k} new' + (f', {len(unknown)} of other shaders dropped' if unknown else '') + ('' if '--apply' in flags else ' (dry run: --apply adds them)'))
            added[i['number']] = k
            if '--apply' in flags and '--close' in flags:
                gh('issue', 'close', str(i['number']), '--repo', repo(), '--comment', f'Thank you! {k} new rows were added to {g["name"]}\'s shared shader list; the next build carries them.' if k else f'Thank you! {g["name"]}\'s shared shader list already had all of these rows.')
        if '--apply' in flags: print('lists updated: check `git diff games/*/shader_list.tsv`, then commit')
    elif a[0] == 'ship' and len(a) == 3:
        g = game(a[1])
        bt = Path(base).read_text() if base and Path(base).exists() else ''
        have = rows(bt); seen = set(have); mine = [r for r in rows(g['list'].read_text()) if r not in seen]
        Path(a[2]).write_text(f'# Prewarm seed list (shipped in the app, next to shader_map.tsv): switch2mac\'s shared shader list for {g["name"]} ({g["engine_id"]})'
                              + (', after the engine\'s own' if have else '') + '\n' + ''.join(r + '\n' for r in have + mine))
        print(f'{g["name"]}: {len(have) + len(mine)} rows shipped ({len(mine)} from games/{g["dir"].name}/shader_list.tsv)')
    else: sys.exit(__doc__)


if __name__ == '__main__':
    main()
