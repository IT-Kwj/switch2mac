#!/usr/bin/env python3
"""The shared shader lists: one per game and build, games/<game>/shader_list.tsv (a second build's: the file game.json "builds" names, e.g. shader_list-nxnative.tsv), holding the shaders and Metal pipelines players have met, so a new install builds them
before its first frame instead of stuttering while it plays. Each list belongs to one game AND the engine its app is built with (its header says which):
a key from another game or engine version is refused, so lists never mix. Rows are identifiers only, never game data:
S<TAB>shader key<TAB>stage / C<TAB>compute shader key / R<TAB>render pipeline key (hex). Row order is first-use order and is kept (rows are only appended).

How rows arrive (the way MacNativeGames does it for Tears of the Kingdom): the app compares what it built (pso_user.tsv beside its save folder) with the list it
shipped, and keeps the rest in shader-list-contribution.txt in ~/Library/Application Support/nxnative/<title ID>/. Each time 100 new rows have built up, it asks
when the game closes: Send opens the "Shader list" issue form on GitHub and shows the file in Finder to drag in; nothing is sent by the app itself.
Each new form is read by .github/workflows/shader-lists.yml (collect --issue <n> --apply --json), which commits the rows to main and closes the issue.

  tools/shader_list.py stats                                every game's list: rows by kind, its engine
  tools/shader_list.py new <game>                           your own app's rows the list lacks → shader-list-<title ID>.txt (to send, or to merge)
  tools/shader_list.py merge <game> <file> [...] [--drop-unknown]   add contributed rows to a game's list (checked as collect checks them)
  tools/shader_list.py collect [--issue <n>] [--apply] [--close] [--drop-unknown] [--json]  the open "shader list" issues on GitHub (gh), or one: read each
                                                            file (attached to the issue or to a comment), check it, report; --apply adds the rows to the lists,
                                                            --close then thanks and closes each issue it took; --json ends with one JSON line for the workflow
  tools/shader_list.py ship <game> <out pso_manifest.tsv> [--base <engine's own list>]   the list a build ships (switch2mac.py build runs it)

--build <id> picks one of a game's builds (Mario Kart World: switch2mac, nxnative) for new, merge and ship; new takes the installed one by default (s2m_build.txt
in the game's data folder), the others the first. collect sends each contribution to the build whose engine its header names.

<game> is a games/ folder name (mario-kart-world) or a title ID. A contribution's header names its game and engine; rows whose shader keys are not the game's
(checked where the game's shader table is at hand: Mario Kart World and Donkey Kong Bananza once their engine is fetched) refuse the file unless --drop-unknown.
"""
import time, json, re, subprocess, sys, urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ROW = re.compile(r'^(S\t[0-9a-f]{16}_[a-z0-9]+\t\d+|C\t[0-9a-f]{16}_[a-z0-9]+|R\t[0-9a-f]+)$')   # keys, stages and render state as hex: nothing else is accepted
HEAD = re.compile(r'^# switch2mac shader list.*\bgame=([0-9A-Fa-f]{16})\b.*\bengine=([\w.-]+)')   # a list's or a contribution's first line
ATTACH = re.compile(r'https://github\.com/(?:user-attachments/files|[\w.-]+/[\w.-]+/files)/[^\s)\]>"]+')
LABEL = 'shader-list'


def lists():   # one entry a game and build (a game with one "engine" has one build, its list shader_list.tsv)
    out = []
    for p in sorted((ROOT / 'games').glob('*/game.json')):
        g = json.loads(p.read_text())
        bs = g.get('builds') or [{'id': g['engine']['kind'], 'engine': g['engine'], 'shader_list': 'shader_list.tsv'}]
        wip = [{'id': f'{k}-untested', 'engine': e, 'shader_list': f'shader_list-{k}.tsv'} for k, e in g.get('wip', {}).items()]   # a port still in progress (switch2mac.py untested_builds)
        for b in bs + wip:
            e = b['engine']
            # engine_id: what a list and a contribution name. Hermit's own engine keeps "switch2mac" across its commits (its shader keys change only with its translator,
            # which Hermit controls); another engine is named with its commit. engine_dir: where switch2mac.py build fetched it (engines/<kind>-<commit>)
            out.append(dict(g, engine=e, build=b['id'], multi=len(bs + wip) > 1, dir=p.parent, list=p.parent / b.get('shader_list', 'shader_list.tsv'),
                            engine_dir=ROOT / f'engines/{e["kind"]}-{e["commit"][:12]}', engine_id='switch2mac' if e['kind'] == 'switch2mac' else f'{e["kind"]}-{e["commit"][:12]}'))
    return out


def games():   # title ID → the game's entries, one a build
    out = {}
    for g in lists(): out.setdefault(g['title_id'], []).append(g)
    return out


def label(g): return g['name'] + (f' ({g["build"]} build)' if g['multi'] else '')


def game(name, build=None, installed=False):   # installed: no --build means the build the player has, not the first
    for t, gs in games().items():
        if name.upper() == t or name == gs[0]['dir'].name:
            note = Path.home() / f'Library/Application Support/nxnative/{t}/s2m_build.txt'   # the build the player has (switch2mac.py install notes it)
            if not build: build = note.read_text().strip() if installed and note.exists() else gs[0]['build']
            for g in gs:
                if g['build'] == build: return g
            sys.exit(f'{gs[0]["name"]} has no build {build!r} ({", ".join(g["build"] for g in gs)})')
    sys.exit(f'{name}: not a game here ({", ".join(gs[0]["dir"].name for gs in games().values())})')


def rows(text):
    return [l for l in text.replace('\r', '').splitlines() if ROW.match(l)]


def header(text):   # (title ID, engine) from the first header line, or None. Any line: an issue's form text comes before its attached file's header
    for l in text.replace('\r', '').splitlines():
        m = HEAD.match(l)
        if m: return m[1].upper(), m[2]
    return None


def known_keys(g):   # the game's shader keys, or None when its table is not at hand (its rows are then checked by form only)
    m = g['engine_dir'] / f'dm/games/{g["title_id"]}/shader_map.tsv'   # Hermit's and nxnative's engines carry the game's shader map
    text = m.read_text() if m.exists() else remote_map(g)   # no engine fetched here (GitHub's runner): the map from the engine's repository at its pinned commit
    if text is None: return None
    keys = set(re.findall(r'^\S+\t\d+\t\w+\t([0-9a-f]{16})\b', text, re.M))
    rt = g['dir'] / 'runtime_shaders.tsv'
    if rt.exists(): keys |= set(re.findall(r'^([0-9a-f]{16})\t', rt.read_text(), re.M))
    return keys


_MAPS = {}
def remote_map(g):   # dm/games/<title ID>/shader_map.tsv of the build's engine repository at its pinned commit (GitHub raw), or None
    e = g['engine']; m = re.search(r'github\.com/([\w.-]+/[\w.-]+?)(?:\.git)?$', e.get('repo', ''))
    if not m: return None
    url = f'https://raw.githubusercontent.com/{m[1]}/{e["commit"]}/dm/games/{g["title_id"]}/shader_map.tsv'
    if url not in _MAPS:
        try:
            with urllib.request.urlopen(urllib.request.Request(url, headers={'User-Agent': 'switch2mac'}), timeout=60) as r: _MAPS[url] = r.read(64 << 20).decode('utf-8', 'replace')
        except Exception: _MAPS[url] = None
    return _MAPS[url]


def check(g, text, drop_unknown):   # (rows to add, problems): problems refuse the file
    h = header(text); bad = []
    if h and h[0] != g['title_id']: bad.append(f'it is for title {h[0]}, not {g["name"]} ({g["title_id"]})')
    got = rows(text); keys = known_keys(g); unknown = []
    if keys is not None:
        unknown = [r for r in got if any(k not in keys for k in row_keys(r))]
    # Another commit of the same engine kind: nxnative keys a shader by the game's own code, so the keys hold across its commits; the file is taken when every shader it names
    # (pipeline rows included) is in this build's map. Another kind (or no map to check against) is refused: Hermit's engine and nxnative key shaders differently
    other = h and h[1] != g['engine_id']
    same_kind = other and g['engine_id'] != 'switch2mac' and h[1].rsplit('-', 1)[0] == g['engine_id'].rsplit('-', 1)[0]
    if other and not (same_kind and keys is not None):
        bad.append(f'it was recorded with engine {h[1]}; {label(g)}\'s list is for {g["engine_id"]}: keys differ between engines')
    # A list recorded on an older (or newer) commit of the same engine names a few shaders that commit's map has and this one's lacks: those rows are dropped, the rest taken
    # (players' engines always lag the newest pin a little). Unknown rows from the build's own commit still refuse the file: another game or version
    if keys is not None:
        if unknown and not drop_unknown and not same_kind: bad.append(f'{len(unknown)} of its {len(got)} rows name shaders {g["name"]} does not have (another game or version?): --drop-unknown drops them')
        got = [r for r in got if r not in unknown]
    return got, bad, unknown


def row_keys(r):   # the shader keys a row names: S / C its key; R the keys inside its render pipeline key (hex of ASCII '<16 hex>_<variant>' fields)
    t, v = r.split('\t')[:2]
    if t in 'SC': return [v[:16]]
    try: return [k.decode() for k in re.findall(rb'([0-9a-f]{16})_', bytes.fromhex(v))]
    except ValueError: return []


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


def fetch(url):   # an issue attachment: text only, 32 MB at most (#20's list was 2.7 MB: a 2 MB cap cut it mid-row)
    cap = 32 << 20
    for attempt in range(4):   # GitHub's attachment host sometimes answers 502/503/504 for a moment (#28's comment run): try again before giving up
        try:
            with urllib.request.urlopen(urllib.request.Request(url, headers={'User-Agent': 'switch2mac'}), timeout=60) as r:
                data = r.read(cap + 1)
            break
        except (urllib.error.HTTPError, urllib.error.URLError, TimeoutError) as e:
            if attempt == 3 or (isinstance(e, urllib.error.HTTPError) and e.code < 500): raise
            time.sleep(5 * (attempt + 1))
    if len(data) > cap: data = data[:data.rfind(b'\n', 0, cap) + 1]   # cut at the cap: never keep a half-read last row
    return data.decode('utf-8', 'replace')


def main():
    argv = sys.argv[1:]; opt = lambda k: argv[argv.index(k) + 1] if k in argv[:-1] else None
    base, build = opt('--base'), opt('--build')
    a = [x for i, x in enumerate(argv) if not x.startswith('--') and not (i and argv[i - 1] in ('--base', '--build', '--issue'))]; flags = {x for x in argv if x.startswith('--')}
    drop = '--drop-unknown' in flags
    if not a: sys.exit(__doc__)
    if a[0] == 'stats':
        for g in lists():
            r = rows(g['list'].read_text()) if g['list'].exists() else []
            print(f'{label(g)} ({g["title_id"]}), engine {g["engine_id"]}: {len(r)} rows (S {sum(x[0] == "S" for x in r)}, C {sum(x[0] == "C" for x in r)}, R {sum(x[0] == "R" for x in r)}) in {g["list"].relative_to(ROOT)}')
    elif a[0] == 'new' and len(a) == 2:
        g = game(a[1], build, installed=True); user = Path.home() / f'Library/Application Support/nxnative/{g["title_id"]}/pso_user.tsv'
        if not user.exists(): sys.exit(f'{user} does not exist yet: play the game first')
        have = set(rows(g['list'].read_text())); new = [r for r in dict.fromkeys(rows(user.read_text())) if r not in have]
        out = Path(f'shader-list-{g["title_id"]}.txt')
        out.write_text(f'# switch2mac shader list contribution\tgame={g["title_id"]}\tengine={g["engine_id"]}\n' + ''.join(r + '\n' for r in new))
        print(f'{len(new)} new rows → {out.resolve()}' + ('' if new else ' (nothing to send)'))
    elif a[0] == 'merge' and len(a) >= 3:
        g = game(a[1], build); n = 0
        for f in a[2:]:
            got, bad, unknown = check(g, Path(f).read_text(errors='replace'), drop)
            if bad: print(f'{f}: refused: ' + '; '.join(bad)); continue
            k = append(g, got); n += k
            print(f'{f}: {len(got)} rows, {k} new' + (f', {len(unknown)} of other shaders dropped' if unknown else ''))
        print(f'{g["list"].relative_to(ROOT)}: {n} rows added')
    elif a[0] == 'collect':
        gs = games(); byname = {g[0]['name'].lower(): g[0] for g in gs.values()}
        one = opt('--issue'); res = []
        if one: issues = [json.loads(gh('issue', 'view', one, '--repo', repo(), '--json', 'number,title,body,url,comments'))]
        else: issues = json.loads(gh('issue', 'list', '--repo', repo(), '--label', LABEL, '--state', 'open', '--limit', '200', '--json', 'number,title,body,url,comments'))
        if not issues: print('no open shader list issues'); return
        added = {}
        def out(i, ok, **kw):   # --json: one line a issue, for the workflow (.github/workflows/shader-lists.yml)
            res.append(dict(number=i['number'], ok=ok, **kw))
        for i in issues:
            posts = [i['body'] or ''] + [c.get('body') or '' for c in i.get('comments', []) if c.get('author', {}).get('login') != 'github-actions']   # a file dragged into a comment counts too
            texts = posts + [fetch(u) for u in dict.fromkeys(u for t in posts for u in ATTACH.findall(t))]
            blob = '\n'.join(texts); h = header(blob)
            tid = h[0] if h else next((t for t in gs if t in blob.upper()), None) or next((g['title_id'] for n, g in byname.items() if n in (i['title'] or '').lower()), None)
            if tid not in gs: print(f'#{i["number"]}: no game this repository has (left open)'); out(i, False, problem='It names no game Hermit has.'); continue
            kind = lambda e: e.rsplit('-', 1)[0] if e != 'switch2mac' else e
            g = next((x for x in gs[tid] if h and x['engine_id'] == h[1]), None) or next((x for x in gs[tid] if h and kind(x['engine_id']) == kind(h[1])), gs[tid][0])   # the build whose engine the file names, else one of its kind (none: the first, and check refuses it)
            got, bad, unknown = check(g, blob, drop)
            if bad: print(f'#{i["number"]} {label(g)}: refused (left open): ' + '; '.join(bad)); out(i, False, game=g['name'], problem='The file could not be used: ' + '; '.join(bad) + '.'); continue
            if not got: print(f'#{i["number"]} {g["name"]}: no rows found (left open: no file attached?)'); out(i, False, game=g['name'], problem='No shader rows came through: the file is missing or empty. Please drag the newest `shader-list-<title ID>-<date>.txt` from the folder Finder showed into a comment here.'); continue
            k = append(g, got) if '--apply' in flags else len([r for r in dict.fromkeys(got) if r not in set(rows(g['list'].read_text()))])
            print(f'#{i["number"]} {label(g)}: {len(got)} rows, {k} new' + (f', {len(unknown)} of other shaders dropped' if unknown else '') + ('' if '--apply' in flags else ' (dry run: --apply adds them)'))
            added[i['number']] = k; out(i, True, game=g['name'], build=g['build'], label=label(g), rows=len(got), new=k, list=str(g['list'].relative_to(ROOT)))
            if '--apply' in flags and '--close' in flags:
                gh('issue', 'close', str(i['number']), '--repo', repo(), '--comment', f'Thank you! {k} new rows were added to {g["name"]}\'s shared shader list; the next build carries them.' if k else f'Thank you! {g["name"]}\'s shared shader list already had all of these rows.')
        if '--apply' in flags and not one: print('lists updated: check `git diff games/*/shader_list.tsv`, then commit')
        if '--json' in flags: print('JSON ' + json.dumps(res))
    elif a[0] == 'ship' and len(a) == 3:
        g = game(a[1], build)
        bt = Path(base).read_text() if base and Path(base).exists() else ''
        have = rows(bt); seen = set(have); mine = [r for r in rows(g['list'].read_text()) if r not in seen]
        Path(a[2]).write_text(f'# Prewarm seed list (shipped in the app, next to shader_map.tsv): Hermit\'s shared shader list for {g["name"]} ({g["engine_id"]})'
                              + (', after the engine\'s own' if have else '') + '\n' + ''.join(r + '\n' for r in have + mine))
        print(f'{label(g)}: {len(have) + len(mine)} rows shipped ({len(mine)} from games/{g["dir"].name}/{g["list"].name})')
    else: sys.exit(__doc__)


if __name__ == '__main__':
    main()
