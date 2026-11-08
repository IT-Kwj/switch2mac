#!/usr/bin/env python3
"""switch2mac: build a native Mac app of a Switch 2 game from your own dump.

  ./switch2mac.py setup                       Python packages into .venv (once)
  ./switch2mac.py build <dump folder>         the whole build: game files, code, shaders, host, app
  ./switch2mac.py build <dump> --engine <id>  a game with several builds (Mario Kart World: switch2mac, nxnative): that one, not the one chosen for this Mac
  ./switch2mac.py builds <dump folder>        which builds the game has, which one this Mac gets and why, and how they ran on players' Macs
  ./switch2mac.py refresh                     take in the shaders the app saved while you played, and pack the app again
  ./switch2mac.py install                     move the finished app to /Applications (replacing the old one)
  ./switch2mac.py run [VAR=value ...]         run the build straight from ./work with a log in work/logs (for porting and debugging: docs/porting.md)

The dump folder holds exefs/ (main, main.npdm, sdk, ...) and romfs/, or base/exefs and base/romfs; or the dump is one .nup file (a NUP container: base, updates and DLC),
which the nxnative-based builds open themselves (tools/nup.py reads its title ID and version first).
Everything the build writes goes to ./work (--work names another folder). Nothing of the game is in this repository.
Each supported game has a folder in games/ (game.json names it); its profile is in its engine (Mario Kart World: switch2mac-engine's dm/games/<title ID>).
A game whose game.json names an "engine" (upstream nxnative or pokopia-native) is built by that engine's own builder at the pinned commit (fetched once into ./engines),
with Mario Kart World's overlay and key-2 settings panel added (tools/engine/patch.py); refresh and run are not for those.
A game can have several builds (game.json "builds", each with its own engine and shader list): game.json "choose" picks one for this Mac (its chip and memory),
from what players reported (games/<game>/reports.tsv); --engine overrides it.
"""
import argparse, datetime, hashlib, json, os, re, shutil, struct, subprocess, sys, time
from pathlib import Path

ROOT = Path(__file__).resolve().parent
NX = None   # the engine of the game being built on switch2mac's engine: engines/switch2mac-<commit> (use_engine)
VENV = ROOT / '.venv'
ENGINES = ROOT / 'engines'   # pinned checkouts of the other engines some games are built with (game.json "engine")
GAMES = {g['title_id']: dict(g, dir=p.parent) for p in sorted((ROOT / 'games').glob('*/game.json')) for g in [json.loads(p.read_text())]}
SKIP = {'.listing', '.DS_Store'}   # a dump tool's FTP listings and Finder's files: never game files


def say(msg): print(f'\n== {msg}', flush=True)


def builds(g):   # a game's tested builds (game.json "builds"); a game with one "engine" has one build, named after its engine; a game not in games/ has none
    if 'builds' in g: return g['builds']
    return [{'id': g['engine']['kind'], 'name': f'{g["engine"]["kind"]}\'s engine', 'engine': g['engine'], 'shader_list': 'shader_list.tsv'}] if 'engine' in g else []


def unknown_game(tid):   # a game switch2mac has no folder for: it can still be tried with the untested builds (a Switch 1 game: nxnative's, which knows most of them)
    s1 = tid.startswith('01')
    return {'title_id': tid, 'name': engine_game_name(tid) or f'Switch {1 if s1 else 2} game {tid}', 'version': '', 'builds': [], 'dir': None, 'switch1': s1}


def engine_game_name(tid):   # the game's name in the nxnative profile at the pin switch2mac keeps (dm/games/<title ID>/game.tsv "name"), '' when that engine is not fetched or has none
    for d in sorted(ENGINES.glob('nxnative-*')):
        f = d / f'dm/games/{tid}/game.tsv'
        if f.is_file():
            for l in f.read_text(errors='replace').splitlines():
                if l.startswith('name\t'): return l.split('\t', 1)[1].strip()
    return ''


def this_mac():   # what the build choice reads: the chip (its generation: 1 for M1, ...) and memory
    def sysctl(k): return subprocess.run(['sysctl', '-n', k], capture_output=True, text=True).stdout.strip()
    chip = sysctl('machdep.cpu.brand_string'); m = re.search(r'\bM(\d+)\b', chip)
    try: model = json.loads(subprocess.run(['system_profiler', 'SPHardwareDataType', '-json'], capture_output=True, text=True, timeout=20).stdout)['SPHardwareDataType'][0].get('machine_name', '')
    except Exception: model = ''   # "MacBook Air", "MacBook Pro", "Mac mini" ...: a "choose" rule's "model"
    return {'chip': chip, 'generation': int(m[1]) if m else 0, 'memory_gb': int(sysctl('hw.memsize') or 0) >> 30, 'model': model, 'macos': macos()}


def fits(b, ver):   # whether a build plays this game version (game.json build "versions": the update folders its profile knows, "v0" the base game; none listed: any),
    # and this dump's form: switch2mac's own engine reads a dump's folders, so a .nup goes to the engines whose builders open it (nxnative, pokopia-native);
    # Switch 1 files (NSP / XCI, opened with the player's keys) to the builders that take them (S1_KINDS)
    if DUMP_NUP and b['engine']['kind'] == 'switch2mac': return False
    if DUMP_S1 and b['engine']['kind'] not in S1_KINDS: return False
    return not ver or not b.get('versions') or ver in b['versions']


def recommend(g, mac, ver=None):   # (build id, why): the first game.json "choose" rule this Mac meets (chip_min, chip_max, memory_min, memory_max, model) whose build plays the dump's version, else the first build that does
    bs = {b['id']: b for b in builds(g)}
    if not ver and builds(g) and builds(g)[0].get('versions'): ver = builds(g)[0]['versions'][0]   # version unknown (no dump at hand): the game's main one, its first build's
    for r in g.get('choose', []):
        if r['build'] in bs and not fits(bs[r['build']], ver): continue
        models = [r['model']] if isinstance(r.get('model'), str) else r.get('model', [])
        if models and mac.get('model', '').lower() not in [m.lower() for m in models]: continue   # the Mac's model name, as "About This Mac" gives it ("MacBook Air")
        if mac['generation'] < r.get('chip_min', 0) or mac['generation'] > r.get('chip_max', 99): continue
        if mac['memory_gb'] < r.get('memory_min', 0) or mac['memory_gb'] > r.get('memory_max', 1 << 20): continue
        return r['build'], r.get('why', '')
    if not builds(g):   # no tested build: nxnative's guess is the most complete (its survey and memory check)
        u = [b['id'] for b in untested_builds(g)]
        return ('nxnative-untested' if 'nxnative-untested' in u else (u[0] if u else '')), 'No tested build of this game yet: every build here is untested'
    ok = [b for b in builds(g) if fits(b, ver)]
    if ver and not ok: return builds(g)[0]['id'], f'No build here knows your dump\'s version ({ver}); this one may not start'
    return (ok or builds(g))[0]['id'], ''


S1_KINDS = ('nxnative', 'macnativegames')   # the engines whose builders take a Switch 1 game's NSP / XCI files and the player's prod.keys
NO_UNTESTED = ('macnativegames',)   # builders made for their own games only (MacNativeGames' build_app.py: Tears of the Kingdom and Breath of the Wild): never offered as a guess for others
KINDS = {'macnativegames': "MacNativeGames' runtime", 'switch2mac': "switch2mac's engine", 'nxnative': "nxnative's engine", 'pokopia-native': "pokopia-native's engine"}
RISK = ' Nobody has built the game this way yet: it may stop partway, or build and not start. Try it at your own risk; Stop ends it at any time.'
ABOUT = {
    'switch2mac': "Untested: switch2mac's engine with a profile guessed from this game's own files." + RISK,
    'nxnative': "Untested: nxnative's builder guesses a profile from this game's own files (it may boot the game for a few seconds to size its memory)." + RISK,
    'pokopia-native': "Untested: pokopia-native's engine (nxnative with xFractals' Switch 2 changes) with a profile guessed from this game's own files." + RISK,
}
PROFILE = None   # an untested build on switch2mac's engine: the profile guessed from the game's files (<work>/guessed/<title ID>); None: the engine's own


def engine_pins():   # each engine's pin that an untested build uses: the ones the updater keeps current (Mario Kart World's two, Pokopia's pokopia-native)
    pins = {}
    for g in GAMES.values():
        for b in builds(g): pins.setdefault(b['engine']['kind'], b['engine'])
    for tid, kind in (('0400C3F00006E000', 'switch2mac'), ('0400C3F00006E000', 'nxnative'), ('0400A3A01EE4C000', 'pokopia-native')):
        for b in builds(GAMES.get(tid, {})):
            if b['engine']['kind'] == kind: pins[kind] = b['engine']
    return pins


def untested_builds(g):
    """Every engine the game has no tested build on, as an untested build: each guesses a profile from the game's own files (never another engine's
    profile). They will often fail; someone may take one further in a port of their own, which then becomes a tested build here."""
    have = {b['engine']['kind'] for b in builds(g)}; pins = engine_pins()
    wip = g.get('wip', {})   # game.json "wip": {kind: engine pin}, a port of this game on that engine still in progress, at its own pin (Ocarina of Time on switch2mac's oot work)
    pins.update(wip)
    s1 = g.get('switch1') or g.get('title_id', '').startswith('01')   # a Switch 1 game: only the builders that open its files
    known = s1 and bool(engine_game_name(g.get('title_id', '')))   # nxnative's own profile for it (it has about 150 Switch 1 games): no guess
    return [{'id': f'{k}-untested', 'name': f'{KINDS[k]} (untested)', 'engine': pins[k], 'untested': True,
             'about': (f"Work in progress: {KINDS[k]} with its own profile for this game, not finished yet." + RISK) if k in wip else
                      (f"Not tried through switch2mac yet: {KINDS[k]} with its own profile for this game. Needs your own prod.keys." + RISK) if known else ABOUT[k]}
            for k in KINDS if k not in have and k in pins and k not in NO_UNTESTED and (not s1 or k in S1_KINDS)]


def profile_src(tid): return PROFILE or NX / f'dm/games/{tid}'


def with_build(g, bid=None, ver=None):   # the game as one of its builds: its engine and shader list (bid None: the one game.json "choose" picks for this Mac and the dump's version)
    bs = builds(g) + untested_builds(g)
    if not bid: bid = recommend(g, this_mac(), ver)[0]
    b = next((b for b in bs if b['id'] == bid), None)
    if not b: sys.exit(f'{g["name"]} has no build {bid!r} (its builds: {", ".join(b["id"] for b in bs)})')
    return dict(g, engine=b['engine'], build=b, disk_gb=b.get('disk_gb', g.get('disk_gb')))   # a build may need more disk than the game's usual (Pokopia's full nxnative build)


def reports(g):   # how the game ran on players' Macs (games/<game>/reports.tsv): one dict a report
    if not g.get('dir'): return []
    f = g['dir'] / 'reports.tsv'; keys = ('mac', 'chip', 'memory_gb', 'macos', 'build', 'fps', 'peak_gb', 'notes', 'source', 'date')
    return [dict(zip(keys, l.split('\t'))) for l in (f.read_text().splitlines() if f.exists() else []) if l.strip() and not l.startswith('#')]


def built_game(w):   # the game a finished build in w is, as the build it was made with (title.txt, build.txt)
    tf = w / 'title.txt'
    if not tf.exists(): sys.exit('no finished build in ' + str(w) + ': run build first')
    tid = tf.read_text().strip(); bf = w / 'build.txt'
    if tid not in GAMES: GAMES[tid] = unknown_game(tid)
    GAMES[tid] = with_build(GAMES[tid], bf.read_text().strip() if bf.exists() else builds(GAMES[tid])[0]['id'])
    global PROFILE
    guessed = w / 'guessed' / tid
    PROFILE = guessed if GAMES[tid]['build'].get('untested') and (guessed / 'game.tsv').is_file() else None
    return tid


class Progress:
    """The build's stages. --progress json writes one event per line, the form the switch2mac app reads (NX2Apple's launcher, from nxnative's build script):
    {"ev": "stage", "k": 2, "n": 7, "name": ...}, {"ev": "step", "k", "step"}, {"ev": "stage_end", "k", "name", "ok", "elapsed", "summary"}, {"ev": "say", "msg"}.
    Anything else on the output (the tools' own lines) is log text. Without it, a stage is the usual '== name' line."""
    # Time left: each stage's expected length is how long it took the last time (history: <work>/stage_times.json), else a first-build guess
    # (FIRST: Mario Kart World on an M1 Max with nothing cached). While a stage runs, a progress event a second gives its share done and the
    # seconds left (marked as an estimate); the app shows them as the bar and the time left. The history is written when a stage ends well.
    FIRST = {'the dump': 1, 'game files': 140, 'code': 90, 'shader split': 15, 'Metal shaders': 900, 'host': 30, 'app': 160, 'engine': 60}
    order = []   # the stages still to come after the running one, for the time left in all (Mario Kart World's build sets them)
    def __init__(self): self.json, self.k, self.n, self.name, self.t0, self.open, self.step_text, self.hist, self.hist_path = False, 0, 0, '', 0.0, False, '', {}, None
    def history(self, path):
        self.hist_path = Path(path)
        try: self.hist = json.loads(self.hist_path.read_text())
        except (OSError, ValueError): self.hist = {}
    def _tick(self, k):
        exp = self.hist.get(self.name) or self.FIRST.get(self.name)
        if not exp: return
        while self.open and self.k == k:
            t = time.time() - self.t0; left = max(1.0, exp - t)
            later = sum(self.hist.get(n) or self.FIRST.get(n, 0) for n in self.order[self.order.index(self.name) + 1:]) if self.name in self.order else 0
            total = left + later; mins = round(total / 60)
            note = f'about {mins} min left in all' if mins >= 2 else 'about a minute left in all' if total > 30 else 'almost done'
            self.emit('progress', k=k, frac=round(min(0.99, t / exp), 3), eta=round(left), step=self.step_text, note=note, est=True)
            time.sleep(1)
    def emit(self, ev, **kw):
        if self.json: print(json.dumps(dict(ev=ev, **kw), ensure_ascii=False), flush=True)
    def plan(self, n): self.n = n
    def stage(self, name, step=''):   # ends the stage before it (done) and starts the next
        if self.open: self.end()
        self.k += 1; self.name, self.t0, self.open, self.step_text = name, time.time(), True, step
        if self.json:
            self.emit('stage', k=self.k, n=max(self.n, self.k), name=name, step=step)
            import threading; threading.Thread(target=self._tick, args=(self.k,), daemon=True).start()
        else: say(name + (f' ({step})' if step else ''))
    def step(self, text):
        if self.json and self.open: self.emit('step', k=self.k, step=text)
        else: print(f'  {text}', flush=True)
    def end(self, ok=True, summary=''):
        if not self.open: return
        self.open = False
        took = round(time.time() - self.t0, 1)
        self.emit('stage_end', k=self.k, name=self.name, ok=ok, elapsed=took, summary=summary)
        if ok and self.hist_path:
            self.hist[self.name] = took
            try: self.hist_path.parent.mkdir(parents=True, exist_ok=True); self.hist_path.write_text(json.dumps(self.hist, indent=1))
            except OSError: pass


P = Progress()


HIDE = {}   # paths never written to the output (the build log the app keeps and players may share): the player's prod.keys → a placeholder


def hide(text):
    for path, label in HIDE.items(): text = text.replace(path, label)
    return text


def run(cmd, env=None, cwd=None, shift=None):   # shift: the tool writes --progress json events of its own: number its stages after ours (shift = our stages before it)
    print('$', hide(' '.join(str(c) for c in cmd)), flush=True)
    if shift is None and not HIDE:
        r = subprocess.run([str(c) for c in cmd], env=env, cwd=cwd); rc = r.returncode
    else:
        pr = subprocess.Popen([str(c) for c in cmd], env=env, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, errors='replace')
        for line in pr.stdout:
            ev = None
            if line.startswith('{'):
                try: ev = json.loads(line)
                except ValueError: pass
            if isinstance(ev, dict) and 'ev' in ev:
                if 'k' in ev: ev['k'] += shift or 0
                if 'n' in ev: ev['n'] += shift or 0; P.plan(ev['n'])
                line = json.dumps(ev, ensure_ascii=False) + '\n'
            sys.stdout.write(hide(line)); sys.stdout.flush()
        rc = pr.wait()
    if rc:
        P.end(False, f'{Path(str(cmd[1] if len(cmd) > 1 and str(cmd[0]).endswith("python") else cmd[0])).name} failed ({rc})')
        sys.exit(f'\nstopped: {Path(str(cmd[0])).name} failed ({rc})')


def has_packages():   # the build's Python packages are importable here (the switch2mac app's bundled Python): no .venv needed
    import importlib.util
    return sys.version_info >= (3, 12) and all(importlib.util.find_spec(m) for m in ('capstone', 'lz4', 'fontTools', 'zstandard'))


def py():   # the Python the build's tools run under: .venv (Terminal setup), else this one when it has the packages (the switch2mac app's own Python, which never makes a .venv)
    p = VENV / 'bin/python'
    if p.exists(): return p
    if has_packages(): return Path(sys.executable)
    sys.exit('run ./switch2mac.py setup first')


def env():
    e = dict(os.environ, PATH=f'{VENV / "bin"}:{os.environ["PATH"]}', DMSH_BORDER_EMU='0', DM_ALLOW_OTHER_METAL='1')
    if 'DOTNET_ROOT' not in e:
        for d in ('/usr/local/share/dotnet', '/opt/homebrew/opt/dotnet/libexec', str(Path.home() / '.dotnet')):
            if Path(d, 'dotnet').exists(): e['DOTNET_ROOT'] = d; break
    return e


def macos():   # this Mac's macOS as major.minor (e.g. 26.5): the app is built for the Mac that builds it, like its Metal shaders
    v = subprocess.run(['sw_vers', '-productVersion'], capture_output=True, text=True).stdout.strip().split('.')
    return f'{v[0]}.{v[1] if len(v) > 1 else 0}'


def good_python():   # a Python 3.12 or later for .venv: this one, else the newest Homebrew or python.org one (macOS's own python3 is 3.9)
    if sys.version_info >= (3, 12): return sys.executable
    cands = [shutil.which(f'python3.{m}') for m in range(20, 11, -1)] + [f'/opt/homebrew/bin/python3.{m}' for m in range(20, 11, -1)] + ['/opt/homebrew/bin/python3', '/usr/local/bin/python3'] \
            + [f'/Library/Frameworks/Python.framework/Versions/3.{m}/bin/python3' for m in range(20, 11, -1)]
    for c in cands:
        if not c or not os.access(c, os.X_OK): continue
        r = subprocess.run([c, '-c', 'import sys; print(sys.version_info >= (3, 12))'], capture_output=True, text=True)
        if r.stdout.strip() == 'True': return c
    return None


def setup(a):
    say('checks')   # each missing piece with the exact fix; setup stops before anything else when one is missing
    bad = []
    def check(name, ok, fix):
        print(f'  {"ok     " if ok else "MISSING"}  {name}' + ('' if ok else f'\n           fix: {fix}'))
        if not ok: bad.append(name)
    v = macos()
    check(f'macOS 26 or later (this Mac: {v})', int(v.split('.')[0]) >= 26, 'update macOS in System Settings → General → Software Update (the games draw with Metal 4, new in macOS 26)')
    xc = subprocess.run(['xcode-select', '-p'], capture_output=True, text=True)
    check('Xcode', xc.returncode == 0 and 'Xcode' in xc.stdout and shutil.which('clang++') is not None,
          'install Xcode from the App Store, open it once, then in Terminal: sudo xcode-select -s /Applications/Xcode.app')
    r = subprocess.run(['xcrun', '-sdk', 'macosx', 'metal', '--version'], capture_output=True, text=True)
    check('Metal Toolchain', r.returncode == 0, 'open Xcode → Settings → Components, and install Metal Toolchain')
    check('.NET 10', 'DOTNET_ROOT' in env(), 'install the .NET 10 SDK from https://dot.net (or: brew install --cask dotnet-sdk)')
    gp = good_python()
    if VENV.exists() and subprocess.run([py(), '-c', 'import sys; sys.exit(sys.version_info < (3, 12))']).returncode: shutil.rmtree(VENV)   # an old .venv made with Python 3.9
    check('Python 3.12 or later' + (f' ({gp})' if gp else ''), gp is not None, 'install Python from https://www.python.org/downloads (or: brew install python), then run setup again')
    check('git', shutil.which('git') is not None, 'comes with Xcode: install Xcode first')
    if bad: sys.exit(f'\nsetup stopped: {len(bad)} thing(s) missing ({", ".join(bad)}). Install them as shown above, then run setup again.')
    say('Python packages (.venv)')
    if not VENV.exists(): run([gp, '-m', 'venv', VENV])
    run([py(), '-m', 'pip', 'install', '-q', '--disable-pip-version-check', '-r', ROOT / 'requirements.txt'])
    print('\nsetup done: everything is ready to build a game.')


def free_space(w, g):   # stop before a build that cannot fit (game.json "disk_gb": the free space a first build needs); S2M_SKIP_DISK_CHECK=1 skips it
    need = g.get('disk_gb'); w.mkdir(parents=True, exist_ok=True)
    have = shutil.disk_usage(w).free / 1e9
    if need and have < need and os.environ.get('S2M_SKIP_DISK_CHECK') != '1':
        sys.exit(f'not enough free disk space: {g["name"]} needs about {need} GB for its first build, this disk has {have:.0f} GB free.\n'
                 'Free some space (or build on another disk with --work <folder>), then try again.')


def dump_dirs(d):
    d = Path(d).expanduser().resolve()
    for base in (d, d / 'base'):
        if (base / 'exefs/main').is_file() and (base / 'romfs').is_dir(): return base / 'exefs', base / 'romfs'
    sys.exit(f'no exefs/main and romfs/ in {d} (or in {d}/base)')


EMPTY_TABLES = {   # a guessed profile's shader tables before the shader split fills them (as nxnative's builder writes them for its provisional profiles)
    'shader_map.tsv': '# kind: evidence  provisional profile: filled by the shader split\npackage\tindex\tstage\tdm_ctl_sha16\tsource\n',
    'shader_facts.tsv': '# Answer table for translation queries. Provisional profile: filled by the shader split\n',
    'shader_pairs.tsv': '# kind: evidence  vertex / pixel shader pairs within BNSH variations\n',
    'shader_map.tsv.conflicts.tsv': '# kind: evidence  control-section key conflict rulings: empty\ndm_ctl_sha16\tchosen_pc\tclass\tcandidates\trecords\n',
    'bf_want.tsv': '# generated\n',
    'pso_manifest.tsv': '# Prewarm seed list. Provisional profile: empty\n'}


def guess_profile(w, tid, exefs, romfs, version, name):
    """A provisional profile for switch2mac's engine, guessed from the game's own files by the engine's dm/games/profile_guess.py (the keys and layout
    nxnative's builder writes for a game it has no profile for, without its memory check). In <work>/guessed/<title ID>; an existing one is kept, so it can be edited by hand."""
    out = w / 'guessed' / tid
    if (out / 'game.tsv').is_file(): print(f'  reusing the guessed profile {out / "game.tsv"} (delete it to guess again)'); return out
    sys.path.insert(0, str(NX / 'dm/games')); import profile_guess as pg
    F = pg.facts_of(exefs, romfs); G, R = pg.guess(F), F['romfs']
    groups, seen = [], {'main', 'other'}
    for d, _ in R['dirs'].most_common(24):
        g = re.sub(r'[^a-z0-9]', '', d.lower())[:16] or 'g'
        while g in seen: g += 'x'
        seen.add(g); groups.append(f'/{d}/={g}')
    store = sorted(x for x, n in R['extb'].items() if x and R['exts'][x] and (n / R['exts'][x] >= 1 << 20 or 2 * R['extc'][x] >= R['exts'][x]))
    mods = G['modules'][0].split(); T = '\t'
    def key(k, default=None):
        v, why = G[k] if k in G else (default, '')
        return [] if v is None else ([f'# {why}'] if why else []) + [f'{k}{T}{v}']
    ipa = (''.join(re.findall(r'[A-Za-z0-9]+', name))[:48] or tid) + '.ipa'
    L = ['# Provisional game profile (guessed by switch2mac.py with dm/games/profile_guess.py for an untested build, not checked by hand)', f'# {name}, SDK {F["sdk"] or "?"}', '',
         f'title_id{T}{tid}', f'program_id{T}{(F["program"] or int(tid, 16)):016X}', '',
         f'name{T}{name}', f'ipa{T}{ipa}', f'app_category{T}public.app-category.games', *key('pad_layout'), *key('op_mode'), '',
         T.join(['build', version, version] + [f'{m}={F["mods"][m]["bid"]}' for m in mods if m in F['mods']]), f'package{T}{version}', f'shader_versions{T}{version}', '',
         *key('modules'), f'romfs_marker{T}{R["biggest"][1]}', f'zip_store{T}{":".join(store + [".metallib"])}', '',
         *key('mem_reserve'), *key('mem_alias'), *key('mem_stack'), *key('app_pool'), *key('sys_resource'), '',
         *key('shader_groups', " ".join(groups) or "/=romfs"), f'shader_note{T}{name} shaders']
    out.mkdir(parents=True, exist_ok=True); (out / 'game.tsv').write_text('\n'.join(L) + '\n', encoding='utf-8')
    for n, text in EMPTY_TABLES.items(): (out / n).write_text(text)
    print(f'  guessed a provisional profile: {out / "game.tsv"}')
    return out


def update_dirs(d):   # the newest update's exefs and romfs when it holds both (updates/exefs + updates/romfs, or updates/<version>/...): an update RomFS is the whole patched tree
    d = Path(d).expanduser().resolve(); found = []
    for u in [d / 'updates'] + sorted((p for p in (d / 'updates').glob('*') if p.name.isdigit()), key=lambda p: int(p.name), reverse=True):
        if (u / 'exefs/main').is_file() and (u / 'romfs').is_dir(): found.append(u)
    return (found[0] / 'exefs', found[0] / 'romfs') if found else None


DUMP_NUP = None   # the .nup the dump path names (read_dump), or None for a dump folder


def nup_file(d):   # the NUP container a dump path names: the .nup file itself, or the one .nup in a folder holding no exefs/ or base/; None for a dump folder
    d = Path(d).expanduser().resolve()
    sys.path.insert(0, str(ROOT / 'tools')); import nup
    if d.is_file(): return d if nup.is_nup(d) else None
    if d.is_dir() and not any((d / x).is_dir() for x in ('exefs', 'base')):
        found = [p for p in sorted(d.glob('*.nup')) if nup.is_nup(p)]
        if len(found) > 1: sys.exit(f'more than one .nup in {d}: {", ".join(p.name for p in found)}; keep one game per folder, or choose the .nup file itself')
        if found: return found[0]
    return None


def nup_scan(p):   # (title ID, newest update version or 0) of a NUP: its table of contents and main.npdm, every file read checked against its SHA-256
    sys.path.insert(0, str(ROOT / 'tools')); import nup
    try:
        with nup.Nup(p) as n:
            app, _, vers, _ = nup.scan(n)
            return f'{app:016X}', max(vers) if vers else 0
    except nup.Error as x: sys.exit(f'{x}. Copy the .nup again, or extract it to a dump folder.')


def read_dump(d):   # once per command: whether the dump is a .nup (DUMP_NUP) or Switch 1 files (DUMP_S1), so the build choice and the checks know
    global DUMP_NUP, DUMP_S1
    there = Path(d).expanduser().exists()
    DUMP_NUP = nup_file(d) if there else None
    DUMP_S1 = s1_files(d) if there and not DUMP_NUP else []
    if DUMP_S1 and S1_EXTRA: DUMP_S1 = sorted(set(DUMP_S1) | {p for p in S1_EXTRA if p.is_file() and p.suffix.lower() in S1_EXT})   # an update or DLC the player added (--add)
    return DUMP_NUP


# Switch 1 games come as their own console's NSP / NSZ / XCI / XCZ files (base game, update, DLC), which are encrypted: only the builder opens them, with the
# player's own prod.keys (passed to it as a path at build time, never read, copied or stored here). switch2mac reads no game data from them: which game and
# version they are comes from what a dump tool writes in the clear, the "[title ID][v<version>]" in the file names and an NSP's ticket names (<rights ID>.tik,
# whose first 16 hex digits are the title ID). switch2mac holds no decryption code (LEGAL.md).
DUMP_S1 = []   # the Switch 1 files the dump path names (read_dump), or [] for a Switch 2 dump
S1_EXT = ('.nsp', '.nsz', '.xci', '.xcz')
S1_PICK = None   # --title-id: which game of a cartridge with several (or of files of several games) to build
S1_EXTRA = []    # --add: update and DLC files the player added to a Switch game


def s1_family(p):   # a Switch 1 file's game, from the first title ID in its name: base, update (+0x800) and DLC (+0x1000...) share it; None without one
    t = re.search(r'(?<![0-9A-Fa-f])(01[0-9A-Fa-f]{14})(?![0-9A-Fa-f])', p.name)
    return int(t.group(1), 16) & ~0x1FFF if t else None


def s1_files(d):   # the Switch 1 game files a dump path names: the file itself, or those in a folder that holds no Switch 2 dump (exefs/, base/, a .nup)
    d = Path(d).expanduser().resolve()
    if d.is_file():   # one game's file, perhaps in a folder of many games: it, and its own update and DLC beside it or one folder up (matched by title ID)
        if d.suffix.lower() not in S1_EXT: return []
        fam = s1_family(d)
        if fam is None: return [d]
        near = [x for folder in {d.parent, d.parent.parent} if folder.is_dir() for x in folder.iterdir()
                if x.is_file() and x.suffix.lower() in S1_EXT and not x.name.startswith('.') and s1_family(x) == fam]
        return sorted(set(near) | {d})
    if not d.is_dir() or any((d / x).is_dir() for x in ('exefs', 'base')): return []
    return sorted(p for p in d.iterdir() if p.is_file() and p.suffix.lower() in S1_EXT and not p.name.startswith('.'))


def pfs0_names(p):   # the file names inside an NSP / NSZ (a PFS0 container: its plain table of contents), [] for anything else
    try:
        with p.open('rb') as f:
            head = f.read(0x10)
            if len(head) < 0x10 or head[:4] != b'PFS0': return []
            n, size = struct.unpack_from('<II', head, 4)
            if not 0 < n <= 4096 or size > 1 << 20: return []
            table = f.read(n * 0x18 + size); names = table[n * 0x18:]
        return [names[o:names.index(b'\0', o)].decode('utf-8', 'replace') if b'\0' in names[o:] else names[o:].decode('utf-8', 'replace')
                for o in (struct.unpack_from('<I', table, i * 0x18 + 0x10)[0] for i in range(n)) if o < len(names)]
    except (OSError, ValueError, struct.error): return []


def s1_ids(p):   # the Switch 1 title IDs a file names: in its file name (any brackets) and its NSP tickets
    return {t.upper() for t in re.findall(r'(?<![0-9A-Fa-f])(01[0-9A-Fa-f]{14})(?![0-9A-Fa-f])', p.name)} | \
           {n[:16].upper() for n in pfs0_names(p) if re.fullmatch(r'[0-9A-Fa-f]{32}\.tik', n)}


def s1_apps(files):   # the games (base title IDs) a set of Switch 1 files belongs to, in order
    return sorted({f'{int(t, 16) & ~0x1FFF:016X}' for p in files for t in s1_ids(p)})


def s1_cart(files):   # whether one file carries several games (a cartridge like "Vol. 1 + Vol. 2": "[<id>+<id>]"): then its first game is built unless --title-id picks another
    apps = s1_apps(files)
    return len(apps) > 1 and any({f'{int(t, 16) & ~0x1FFF:016X}' for t in s1_ids(p)} >= set(apps) for p in files)


def s1_scan(files):   # (base game title ID or None, newest update version or 0, every title ID seen) of a set of Switch 1 files, from the names a dump tool gives them
    ids, vers = set(), {}
    for p in files:
        tags = re.findall(r'(?<![0-9A-Fa-f])(01[0-9A-Fa-f]{14})(?![0-9A-Fa-f])', p.name)   # a title ID anywhere in the name, whatever brackets a tool or a rename left round it
        v = re.findall(r'(?:^|[\[\(\s_-])v(\d+)(?=$|[\]\)\s_.-])', p.name)
        found = {t.upper() for t in tags} | {n[:16].upper() for n in pfs0_names(p) if re.fullmatch(r'[0-9A-Fa-f]{32}\.tik', n)}
        for t in found:
            if not t.startswith('01'): continue   # Switch 1 titles start 01
            ids.add(t)
            if v and t.endswith('800'): vers[t] = max(vers.get(t, 0), int(v[-1]))   # an update's title ID is its game's with 800 at the end
    apps = sorted({f'{int(t, 16) & ~0x1FFF:016X}' for t in ids})   # the game each title belongs to (an update's or a DLC's base game)
    pick = (S1_PICK or '').upper()
    base = apps[0] if len(apps) == 1 else pick if pick in apps else apps[0] if s1_cart(files) else None
    return base, max((v for t, v in vers.items() if base and t == f'{int(base, 16) | 0x800:016X}'), default=0), sorted(ids)


def s1_title(d):   # the Switch 1 game a dump path is, or a stop that says what to do
    base, _, ids = s1_scan(DUMP_S1)
    if base: return base
    names = ', '.join(p.name for p in DUMP_S1[:3]) + (' …' if len(DUMP_S1) > 3 else '')
    if not ids: sys.exit(f'switch2mac can\'t tell which game {names} is without opening it: name the files the way dump tools do, with the title ID in brackets, '
                         'e.g. "Game [0100F2C0115B6000][v0].nsp" and "Game [0100F2C0115B6800][v458752].nsp"')
    sys.exit(f'these files are more than one game ({", ".join(ids)}): keep one game (its base game, update and DLC) per folder')


def s1_parts(files, tid):   # (base game file, update file or None, DLC files) of one Switch game, by the title IDs in their names or tickets (s1_scan)
    base_id, upd_id = int(tid, 16), int(tid, 16) | 0x800
    def ids(p): return {int(t, 16) for t in re.findall(r'(?<![0-9A-Fa-f])(01[0-9A-Fa-f]{14})(?![0-9A-Fa-f])', p.name)} | {int(n[:16], 16) for n in pfs0_names(p) if re.fullmatch(r'[0-9A-Fa-f]{32}\.tik', n)}
    base = [p for p in files if base_id in ids(p)]; upd = [p for p in files if upd_id in ids(p) and p not in base]
    dlc = [p for p in files if p not in base and p not in upd and (not ids(p) or any(base_id + 0x1000 <= i < base_id + 0x2000 for i in ids(p)))]   # this game's DLC (another game's files on a cartridge stay out)
    if not base: sys.exit(f'no base game file of {tid} among {", ".join(p.name for p in files)}: the base game must be there too')
    if len(base) > 1: base.sort(key=lambda p: p.suffix.lower() != '.xci')   # a card image first: it may carry its own update
    if len(upd) > 1: upd.sort(key=lambda p: max(map(int, re.findall(r'\[v(\d+)\]', p.name) or ['0'])), reverse=True)
    return base[0], (upd[0] if upd else None), dlc


def check_keys(path):   # a quick look at a prod.keys file by its key NAMES only (no value is used): (ok, what to tell the player). The builder makes the real check when it opens the game
    p = Path(path).expanduser()
    try: text = p.read_text(errors='replace')
    except OSError: return False, f'The keys file can\'t be read: {p.name}'
    names = {l.split('=', 1)[0].strip().lower() for l in text.splitlines() if '=' in l}
    if 'header_key' not in names: return False, f'{p.name} has no header_key: it isn\'t a prod.keys file from a Switch, or it is cut short. Dump it from your Switch again'
    masters = sorted(int(n[len('master_key_'):], 16) for n in names if re.fullmatch(r'master_key_[0-9a-f]{2}', n))
    if not masters: return False, f'{p.name} has no master keys: dump prod.keys from your Switch again'
    return True, f'prod.keys with master keys up to {masters[-1]:02x} (the builder checks they open this game when the build starts)'


def dump_version(d):   # the dump's game version as the profiles name it: "v<update>" for the newest update folder (updates/<number>/), "v0" with no update, None when it cannot tell
    if read_dump(d): return f'v{nup_scan(DUMP_NUP)[1]}'
    if DUMP_S1: return f'v{s1_scan(DUMP_S1)[1]}'
    d = Path(d).expanduser().resolve(); u = update_dirs(d)
    if not u: return 'v0'
    return f'v{u[0].parent.name}' if u[0].parent.name.isdigit() else None


def title_id(npdm):
    npdm = npdm.read_bytes()
    aci = struct.unpack_from('<I', npdm, 0x70)[0]   # ACI0 offset in the META header
    return f'{struct.unpack_from("<Q", npdm, aci + 0x10)[0]:016X}'


def dump_title(d):   # the title ID from exefs/main.npdm or base/exefs/main.npdm, whatever else the folder holds (updates/, dlc/); a .nup's from its own main.npdm
    if read_dump(d): return nup_scan(DUMP_NUP)[0]
    if DUMP_S1: return s1_title(d)
    d = Path(d).expanduser().resolve()
    for base in (d, d / 'base'):
        if (base / 'exefs/main.npdm').is_file(): return title_id(base / 'exefs/main.npdm')
    sys.exit(f'no exefs/main.npdm in {d} (or in {d}/base), and no Switch 1 game file (.nsp, .nsz, .xci, .xcz)')


def title_and_build(exefs):
    sys.path.insert(0, str(NX / 'dm/tools')); import nso
    return title_id(exefs / 'main.npdm'), nso.read(exefs / 'main').build_id[:16].hex()


def own_engine(g): return g.get('engine', {}).get('kind') == 'switch2mac'   # built step by step here (Mario Kart World), not by another builder


def use_engine(g):   # switch2mac's engine at the commit the game pins, fetched once: every step below reads it through NX
    global NX
    NX = engine_dir(g)
    return NX


def engine_dir(g):   # the game's engine at its pinned commit (game.json "engine": upstream nxnative or pokopia-native), fetched once: that commit only, no history
    eng = g['engine']; d = ENGINES / f'{eng["kind"]}-{eng["commit"][:12]}'
    if (d / '.git').is_dir() and not d.with_name(d.name + '.part').exists(): return d
    say(f'engine: {eng["kind"]} {eng["commit"][:12]} from {eng["repo"]} (once)')
    tmp = d.with_name(d.name + '.part'); shutil.rmtree(tmp, ignore_errors=True); tmp.mkdir(parents=True)
    for c in (['init', '-q'], ['remote', 'add', 'origin', eng['repo']], ['fetch', '-q', '--depth', '1', 'origin', eng['commit']], ['checkout', '-q', 'FETCH_HEAD']): run(['git', '-C', tmp] + c)
    tmp.rename(d)
    return d


# Every engine game is built as Mario Kart World is: the game starts at once (DM_LAUNCHER=0 in the app's switches: no settings window first, the saved choices apply),
# with the performance overlay top right (key 1) and the engine's own launch settings on key 2 in the Mario Kart style (tools/engine/patch.py adds them to the engine's host)
# S2M_ENGINE names the engine in the shader list contribution the app writes, so a game's list only ever takes rows from its own build (tools/shader_list.py)
def app_switches(g):   # an untested build says so in the overlay (S2M_ENGINE=<kind>-untested); a build's own "switches" in game.json follow (a port's recommended settings)
    return '\n'.join([f'DM_LAUNCHER=0\nS2M_ENGINE={g["engine"]["kind"]}-' + ('untested' if g.get('build', {}).get('untested') else g["engine"]["commit"][:12])] + g.get('build', {}).get('switches', []))


def engine_build(a, tid, w, e):   # a game on another engine: its own builder does it all (game files, code, shaders, host, app), checking the version itself
    g = GAMES[tid]; eng = g['engine']; d = engine_dir(g); dump = Path(a.dump).expanduser().resolve()
    if sys.version_info < (3, 12): sys.exit(f'{eng["kind"]}\'s builder needs Python 3.12 or later: make .venv again with a newer python3 (./switch2mac.py setup)')
    print(f'  {g["name"]} ({tid}): built with {eng["kind"]} {eng["commit"][:12]}')
    e = {k: v for k, v in e.items() if k != 'DMSH_BORDER_EMU'}   # Mario Kart World's translator setting, not this engine's
    w.mkdir(parents=True, exist_ok=True); app = w / f'{g["name"]}.app'
    untested = g['build'].get('untested')
    if untested: print(f'  UNTESTED: {g["name"]} on {KINDS[eng["kind"]]}, with a profile it guesses from the game\'s files. It may stop partway or not start.')
    if getattr(a, 'quick', False):
        if eng['kind'] != 'nxnative': sys.exit(f'--quick is for builds on nxnative\'s builder; {g["name"]} is built with {KINDS[eng["kind"]]}')
        print('  QUICK: only the shaders the profile\'s playtests used (and those the last runs reported missing): minutes, not hours. Areas they do not cover draw with parts missing until a full build')
    if eng['kind'] == 'nxnative' or (untested and eng['kind'] == 'pokopia-native'):
        nx = d
        P.plan(2); P.stage('engine', f'{eng["kind"]} {eng["commit"][:12]} with switch2mac\'s overlay and settings')
        if eng['kind'] == 'pokopia-native':   # its nxnative tree, patched with xFractals' Switch 2 changes: nxnative's own builder, which guesses a profile for any game
            run([py(), d / 'nxs2.py', 'setup', '--no-ios'], env=e, cwd=d); nx = d / 'nxnative'; e = dict(e, NXNATIVE=str(nx))
        run([py(), ROOT / 'tools/engine/patch.py', nx], env=e)
        if not untested:
            seed = w / f'{tid}-engine-seed.tsv'   # the engine's own seed list at its pinned commit, then the game's shared list after it
            seed.write_text(subprocess.run(['git', '-C', nx, 'show', f'HEAD:dm/games/{tid}/pso_manifest.tsv'], capture_output=True, text=True).stdout)
            ship_list(tid, nx / f'dm/games/{tid}/pso_manifest.tsv', seed)
        sw = w / 'app_switches.txt'; sw.write_text(app_switches(g) + '\n')
        P.end()
        s1 = []
        if DUMP_S1:   # nxnative's builder reads a folder of one game's files: links to this game's base, update and DLC only (its folder may hold other games)
            base, upd, dlc = s1_parts(DUMP_S1, tid)
            dump = w / 'switch-files' / tid
            if dump.exists(): shutil.rmtree(dump)
            dump.mkdir(parents=True)
            for f in [base] + ([upd] if upd else []) + dlc: (dump / f.name).symlink_to(f)
            print(f'  base {base.name}' + (f', update {upd.name}' if upd else '') + (f', {len(dlc)} DLC' if dlc else ''))
            s1 = ['--title-id', tid]
        run([py(), nx / 'scripts/build_ipa_from_nsp.py', dump, '--platform', 'mac-app', '--allow-other-metal', '--env-file', sw,
             '--work-dir', w / tid, '-o', app, '--progress', 'json' if P.json else 'lines'] + (['-k', Path(a.keys).expanduser().resolve()] if DUMP_S1 else [])
            + (['--seen-shaders'] if getattr(a, 'quick', False) else []) + s1
            + eng.get('args', []), env=e, cwd=nx, shift=P.k if P.json else None)
    elif eng['kind'] == 'macnativegames':   # MacNativeGames (ly05010419, MIT): its own runtime and builder (build_app.py) for Tears of the Kingdom and Breath of the Wild
        if not DUMP_S1: sys.exit(f'{g["name"]}: MacNativeGames builds from the game\'s .xci / .nsp files with your prod.keys')
        py314 = shutil.which('python3.14') or next((p for p in ('/opt/homebrew/bin/python3.14', '/usr/local/bin/python3.14') if Path(p).exists()), None)
        miss = [] if py314 else ['python@3.14']
        miss += [f for f in ('opus', 'libvpx') if not any(Path(r, 'opt', f).exists() for r in ('/opt/homebrew', '/usr/local'))]
        if miss: sys.exit(f'MacNativeGames needs Homebrew\'s {", ".join(miss)}: brew install {" ".join(miss)}')
        base, upd, dlc = s1_parts(DUMP_S1, tid)
        fonts = (['--firmware', Path(a.firmware).expanduser().resolve()] if getattr(a, 'firmware', None) else
                 ['--shared-fonts', Path(a.shared_fonts).expanduser().resolve()] if getattr(a, 'shared_fonts', None) else [])
        if not fonts and not eng.get('builder') and (base.suffix.lower() in ('.nsp', '.nsz') or tid == '01007EF00011E000'):
            print('  NOTE: from an .nsp, and always for Breath of the Wild, MacNativeGames needs the Switch\'s system fonts: --firmware <your firmware dump> or --shared-fonts <a TotK build\'s fonts>')
        print(f'  base {base.name}' + (f', update {upd.name}' if upd else '') + (f', {len(dlc)} DLC' if dlc else ''))
        P.plan(1); P.stage('build', 'MacNativeGames\' builder: the game files, its runtime, shaders and the app')
        b = eng.get('builder')
        if b:   # a community port with its own builder script (games/<port>/...): game.json names it and its arguments, as that port's README gives them
            m = re.search(r'v(\d{5,})', upd.name) if upd and b.get('updates') else None
            if m and f'v{m[1]}' not in b['updates']:   # an update the port cannot run (Wonder's port: 1.2.1 only): built without it
                print(f'  NOTE: this port takes only update {", ".join(b["updates"])}; {upd.name} is left out (the base game is built)'); upd = None
            vals = {'base': base, 'update': upd, 'keys': Path(a.keys).expanduser().resolve(), 'app': app, 'work': w / tid,
                    'firmware': Path(a.firmware).expanduser().resolve() if getattr(a, 'firmware', None) else None,
                    'shared_fonts': Path(a.shared_fonts).expanduser().resolve() if getattr(a, 'shared_fonts', None) else None}
            for need in b.get('needs', []):
                if not vals.get(need) and not (need == 'firmware' and vals['shared_fonts']): sys.exit(f'{g["name"]}: MacNativeGames\' port needs ' + {'update': 'the game\'s update file (' + b.get('update_note', 'see its README') + ') next to the base game',
                                                                                              'firmware': 'the Switch\'s system fonts: --firmware <your unpacked firmware dump> or --shared-fonts <a TotK build\'s fonts>'}.get(need, need))
            cmd, args = [], list(b['args'])
            while args:   # "--flag?" "{value}": the pair only when the value is there; "{value}" alone: required
                x = args.pop(0)
                if x.endswith('?'):
                    v = vals.get(args.pop(0)[1:-1])
                    if v: cmd += [x[:-1], v]
                elif x.startswith('{') and x.endswith('}'): cmd.append(vals[x[1:-1]])
                else: cmd.append(x)
            if 'dlc' in b and dlc: cmd += [z for f in dlc for z in (b['dlc'], f)]
            print(f'  MacNativeGames port: {b["script"]}')
            run([py314, d / b['script']] + cmd + eng.get('args', []), env=e, cwd=d / b.get('cwd', ''))
        else:
            run([py314, d / 'build_app.py', base] + (['--update', upd] if upd else []) + [x for f in dlc for x in ('--dlc', f)]
                + ['-k', Path(a.keys).expanduser().resolve(), '-o', app, '--work', w / tid] + fonts + eng.get('args', []), env=e, cwd=d)
    elif DUMP_S1: sys.exit(f'{g["name"]}: {KINDS[eng["kind"]]} builds Switch 2 games only')
    elif eng['kind'] == 'pokopia-native':
        nx = d / 'nxnative'; e = dict(e, NXNATIVE=str(nx)); P.plan(4)
        P.stage('engine', f'pokopia-native {eng["commit"][:12]} with switch2mac\'s overlay and settings')
        run([py(), d / 'nxs2.py', 'setup', '--no-ios'], env=e, cwd=d)   # nxnative at its pinned commit with pokopia-native's Switch 2 patch, and its shader lowering
        run([py(), ROOT / 'tools/engine/patch.py', nx], env=e)
        ship_list(tid, d / f'profile/{tid}/pso_manifest.tsv')   # pokopia-native ships no list of its own: the game's shared list is the app's
        script = d / 'nxs2.py'; t = script.read_text()   # once: its app's baked switches (APP_ENV) get switch2mac's, and its profile step copies the list
        if 'S2M_ENGINE=' not in t:
            k = "DM_NVN_SHDUMP=shdump\\n'\n"
            if t.count(k) != 1: sys.exit(f'{script}: its APP_ENV line is not the one switch2mac knows')
            t = t.replace(k, k[:-2] + app_switches(g).replace('\n', '\\n') + "\\n'   # (switch2mac)\n", 1)
        if "'shader_facts.seed.tsv', 'pso_manifest.tsv')" not in t:
            k = "'shader_facts.seed.tsv'):"
            if t.count(k) != 1: sys.exit(f'{script}: its profile step is not the one switch2mac knows')
            t = t.replace(k, "'shader_facts.seed.tsv', 'pso_manifest.tsv'):", 1)
        script.write_text(t)
        P.stage('build', 'game files, code, shaders (the long step) and host, by pokopia-native')
        run([py(), script, 'build', dump, '--out', w / tid, '--mac-app', '--no-ios'], env=e, cwd=d)
        P.stage('app')
        if app.exists(): shutil.rmtree(app)
        shutil.move(str(w / tid / 'out' / f'{g["name"]}.app'), app)
    else: sys.exit(f'{g["name"]}: engine kind {eng["kind"]!r} is not one switch2mac builds with')
    (w / 'title.txt').write_text(tid + '\n'); (w / 'build.txt').write_text(g['build']['id'] + '\n')
    P.end(summary=str(app))
    print(f'\nbuilt: {app}\n./switch2mac.py install moves it to /Applications.')


def profile_builds(tid):   # main build ID → version name, from the profile's build lines
    rows = [l.split('\t') for l in (profile_src(tid) / 'game.tsv').read_text().splitlines() if l.startswith('build\t')]
    return {c.split('=', 1)[1]: r[2] for r in rows for c in r[3:] if c.startswith('main=')}


def check_version(tid, bid):
    if tid not in GAMES: sys.exit(f'title {tid} is not supported yet (this repository has: {", ".join(g["name"] + " " + t for t, g in GAMES.items())}).\n'
                                  'Adding a game: docs/porting.md')
    rows = [l.split('\t') for l in (profile_src(tid) / 'game.tsv').read_text().splitlines() if l.startswith('build\t')]
    known = {c.split('=', 1)[1]: r[2] for r in rows for c in r[3:] if c.startswith('main=')}
    if bid in known:
        print(f'  {GAMES[tid]["name"]} {known[bid]} (main {bid}): tested')
        return
    sys.exit(f'main build ID {bid} is not a version this profile knows ({", ".join(known.values())}).\n'
             f'This version is UNTESTED: its build line (game.tsv) and module list must be added first (see {GAMES[tid]["dir"].relative_to(ROOT) if GAMES[tid].get("dir") else "docs/porting.md"}/README.md, "Other versions").')


def stage(romfs, out):   # a symlink tree of the RomFS without the dump tool's dot-files, so they never end up in the image
    if out.exists(): shutil.rmtree(out)
    n = 0
    for root, _, files in os.walk(romfs):
        rel = Path(root).relative_to(romfs); (out / rel).mkdir(parents=True, exist_ok=True)
        for f in files:
            if f in SKIP: continue
            os.symlink(Path(root) / f, out / rel / f); n += 1
    print(f'  {n:,} game files linked')


def paths(a):
    w = Path(a.work).resolve()
    return w, w / 'extract', w / 'build', w / 'shader', w / 'cache/metal_shader_cache'


def profile(w, tid):   # a fresh copy of the repo's profile in work/profile: the shader split rewrites its tables, the repo stays as it is
    prof = w / 'profile' / tid
    if prof.exists(): shutil.rmtree(prof)
    shutil.copytree(profile_src(tid), prof)
    if not PROFILE: ship_list(tid, prof / 'pso_manifest.tsv')   # an untested build has no shared list (keys differ between engines)
    return prof


def ship_list(tid, out, base=None):   # the build's shared shader list (games/<game>/shader_list.tsv, or the build's own) as the pso_manifest.tsv its app ships, after the engine's own rows when it has some
    b = GAMES[tid].get('build')
    run([py(), ROOT / 'tools/shader_list.py', 'ship', tid, out] + (['--base', base] if base else []) + (['--build', b['id']] if b else []))


def runtime_shaders(tid, w):
    """Shaders the game assembles while it runs are not in its usual shader containers, but their parts are in its files. games/<game>/runtime_shaders.tsv says where each
    one's control section and code are (file + offset, as positions only: no game data), and its key, sha256(control + code), checks what is read. They go to work/runtime
    as <key>.ctl / <key>.code, the way the app saves shaders it meets (refresh), so the first launch already has them."""
    import zstandard
    table = GAMES[tid]['dir'] / 'runtime_shaders.tsv' if GAMES[tid].get('dir') else ROOT / 'games/none'
    out = w / 'runtime'; out.mkdir(exist_ok=True)
    if not table.exists(): return None
    rows = [l.rstrip('\n').split('\t') for l in table.open() if l.strip() and not l.startswith('#')]
    blobs, bad = {}, 0
    def blob(name):
        if name not in blobs:
            if name == 'main': blobs[name] = (w / 'shader/main.img').read_bytes()
            else:
                b = (w / 'input/romfs' / name).read_bytes()
                blobs[name] = zstandard.ZstdDecompressor().stream_reader(b).read(1 << 31) if name.endswith('.zs') else b
        return blobs[name]
    for key, cf, co, kf, ko, n in rows:
        ctl = blob(cf)[int(co, 16):int(co, 16) + 0xd8]; code = blob(kf)[int(ko, 16):int(ko, 16) + int(n)]
        if hashlib.sha256(ctl + code).hexdigest()[:16] != key: bad += 1; continue
        (out / f'{key}.ctl').write_bytes(ctl); (out / f'{key}.code').write_bytes(code)
    print(f'  {len(rows) - bad} of {len(rows)} run-time shaders taken from the dump' + (f' ({bad} did not match: another game version?)' if bad else ''))
    return out


def shaders(a, tid, w, sh, cache, e):
    prof = profile(w, tid); tools = NX / 'dm/gfx/tools'
    e.update(DM_GAMES_DIR=str(w / 'profile'), DM_GAMES_FIRST='1')   # every tool (and the host build) takes the work copy
    lower = tools / 'nx2_lower/nx2_lower'
    if not lower.exists():
        P.step('building the shader lowering tool (nx2_lower)')
        run(['clang++', '-std=c++20', '-O2', '-w', '-Wno-c++11-narrowing', '-I.', 'nx2_lower.cpp', '-o', 'nx2_lower'], cwd=tools / 'nx2_lower')
    if (tools / 'nx2_lower/next/nx2_lower.cpp').exists() and not (tools / 'nx2_lower/next/nx2_lower_next').exists():   # the fallback lowering, for programs nx2_lower rejects (engines from 9ae37886 on)
        P.step('building the fallback shader lowering tool (nx2_lower/next)')
        run(['clang++', '-std=c++20', '-O2', '-w', '-Wno-c++11-narrowing', '-I.', 'nx2_lower.cpp', '-o', 'nx2_lower_next'], cwd=tools / 'nx2_lower/next')
    e = dict(e, DM_GAME=tid, **GAMES[tid].get('shader_env', {}))   # game.json shader_env: switches for the shader tools (Ocarina of Time: EDEN_NX2_TENSOR=1, its movie's matrix maths)
    run([py(), NX / 'dm/tools/nso.py', w / 'extract/ExeFS/main', sh / 'main.img'], env=e)
    P.stage('shader split', 'with the run-time shaders listed for this game' + (' and those the app saved while you played' if (w / 'captures').is_dir() and any((w / 'captures').iterdir()) else ''))
    rt = runtime_shaders(tid, w)
    caps = [str(p) for p in (rt, w / 'captures') if p and p.is_dir() and any(p.iterdir())]
    e = dict(e, NX2_DUMPS=':'.join(caps))
    run([py(), tools / 'nx2_split.py', w / 'input/romfs', sh / 'main.img', sh / 'pkg', prof / 'shader_map.tsv', prof / 'shader_facts.tsv', prof / 'shader_pairs.tsv', sh / 'rejects.tsv'], env=e)
    P.stage('Metal shaders', 'the long step: 10-20 minutes the first time, all cores')
    run([py(), tools / 'own_compilers.py', sh / 'pkg', cache], env=e)
    chain = re.search(r'"([0-9a-f]{12})"', (NX / 'dm/gfx/nvn/dmsh_chain.h').read_text())[1]   # the translator chain version names the library folder
    lib = cache / f'b-{chain}'
    run([py(), tools / 'nx2_res.py', prof / 'shader_map.tsv', sh / 'pkg', sh / 'pkg/cs_layout.tsv', sh / 'res'], env=e)
    run([py(), tools / 'nx2_reflect.py', lib, sh / 'pkg/cs_layout.tsv', sh / 'res'], env=e)
    return lib


def host_and_app(a, tid, w, lib, e):
    g = GAMES[tid]; prof = w / 'profile' / tid
    P.stage('host', 'the native runtime')
    run(['make', '-C', NX / 'dm/host', f'GAME={tid}', f'MACOS_MIN={macos()}', 'dmhost'], env=e)   # for this Mac's macOS, not nxnative's fixed 26.6
    font = w / 'build/font'
    if not (font / 'nintendo_ext.ttf').exists():
        font.mkdir(parents=True, exist_ok=True); run([py(), NX / 'dm/tools/make_ext_font.py', font / 'nintendo_ext.ttf'], env=e)
    P.stage('app')
    if PROFILE:   # an untested build: the generic settings, its own switches, the marker from the borrowed profile
        run([py(), ROOT / 'tools/engine/launcher_generic.py', NX, w / 'build/patched', w / 'build/launcher.json', tid], env=e)
        envf = w / 'build/env_untested.txt'; envf.write_text(f'S2M_ENGINE=switch2mac-untested\n')
        marker = next((l.split()[1] for l in (prof / 'game.tsv').read_text().splitlines() if l.startswith('romfs_marker')), '')
    else:
        run([py(), g['dir'] / 'launcher.py', NX, w / 'build/patched', w / 'build/launcher.json'], env=e)
        envf, marker = g['dir'] / 'env.txt', g['marker']
    app = w / f'{g["name"]}.app'
    run([py(), NX / 'dm/mac/pack_app.py', app, '--host', NX / 'dm/host/dmhost', '--patched', w / 'build/patched', '--romfs', w / 'extract/RomFS.img',
         '--msl', lib, '--tables', prof, '--font', font, '--env-file', envf, '--settings', w / 'build/launcher.json', '--launcher-window', 'off',
         '--title-id', tid, '--name', g['name'], '--version', g['version'] or 'untested', '--lang', 'en-US'] + (['--marker', marker] if marker else []), env=e)
    (w / 'title.txt').write_text(tid); (w / 'build.txt').write_text(g['build']['id'] + '\n')
    P.end(summary=str(app))
    print(f'\ndone: {app}\nnext: ./switch2mac.py install')


def build(a):
    e = env(); w, ex, b, sh, cache = paths(a)
    if 'DOTNET_ROOT' not in e: sys.exit('.NET is missing: run ./switch2mac.py setup for the checks')
    P.json = getattr(a, 'progress', None) == 'json'; P.plan(7); P.history(w / 'stage_times.json')
    P.order = ['the dump', 'game files', 'code', 'shader split', 'Metal shaders', 'host', 'app']
    P.stage('the dump'); tid = dump_title(a.dump)
    if DUMP_S1:   # a Switch 1 game: its files are opened by the builder with the player's own keys, whose path goes to the builder alone
        if not getattr(a, 'keys', None): sys.exit('A Switch 1 game needs your own prod.keys, dumped from your Switch: choose it (--keys <path of prod.keys>)')
        ok, why = check_keys(a.keys)
        if not ok: sys.exit(why)
        HIDE[str(Path(a.keys).expanduser().resolve())] = '<your prod.keys>'; HIDE[str(a.keys)] = '<your prod.keys>'
        print(f'  Switch 1 game files: {len(DUMP_S1)}; {why}')
    bad = damaged_modules(a.dump)   # before anything is fetched or copied: a damaged dump stops here with what to do (the app's identify says the same)
    if bad: sys.exit(f'The dump is damaged: {", ".join(bad)} {"is" if len(bad) == 1 else "are"} cut short. Copy it off your Switch 2 again (over FTP, in binary mode).')
    if tid not in GAMES: GAMES[tid] = unknown_game(tid)   # any Switch 2 game can be tried with the untested builds
    if True:
        ver = dump_version(a.dump); GAMES[tid] = with_build(GAMES[tid], a.engine, ver); chosen = GAMES[tid]['build']   # not `b`: that is the build folder
        print(f'  {GAMES[tid]["name"]} ({tid})' + (f', {chosen["name"]}' + ('' if a.engine else f' ({recommend(GAMES[tid], this_mac(), ver)[1] or "this Mac"})') if len(builds(GAMES[tid])) > 1 else ''))
        if not fits(chosen, ver) and not (DUMP_NUP and chosen['engine']['kind'] == 'switch2mac'): print(f'  NOTE: {chosen["name"]} lists {", ".join(chosen["versions"])}, and this dump is {ver}: it may not build or start')
        free_space(w, GAMES[tid])
    if not own_engine(GAMES[tid]): return engine_build(a, tid, w, e)
    if DUMP_NUP: sys.exit(f'{GAMES[tid]["build"]["name"]} builds from a dump folder (exefs/ and romfs/), not a .nup: choose another build of this game, or extract the .nup to a folder first')
    if DUMP_S1: sys.exit(f'{GAMES[tid]["build"]["name"]} builds Switch 2 games only: choose another build of this game')
    use_engine(GAMES[tid])
    global PROFILE
    untested = GAMES[tid]['build'].get('untested'); PROFILE = None
    upd = update_dirs(a.dump)   # an untested build takes the update when the dump has one; a tested one when its profile knows the update's main (Ocarina of Time v131072)
    if upd and not untested and title_and_build(upd[0])[1] not in profile_builds(GAMES[tid]['title_id']): upd = None
    exefs, romfs = upd or dump_dirs(a.dump)
    if untested:
        print(f'  UNTESTED: {GAMES[tid]["name"]} on switch2mac\'s engine, with a profile guessed from the game\'s files. It may stop partway or not start.')
        ver = f'v{exefs.parent.name}' if upd and exefs.parent.name.isdigit() else 'v0'
        if (NX / f'dm/games/{tid}/game.tsv').is_file(): print(f'  the engine has a profile for this game: using it, not a guess')   # an experimental game's own engine
        else:
            PROFILE = guess_profile(w, tid, exefs, romfs, ver, GAMES[tid]['name'])
            e.update(DM_GAMES_DIR=str(PROFILE.parent), DM_GAMES_FIRST='1')   # every tool reads the guessed profile
    tid, bid = title_and_build(exefs); check_version(tid, bid)
    for d in (ex / 'ExeFS', b, sh): d.mkdir(parents=True, exist_ok=True)
    P.stage('game files', 'code modules and the RomFS image (a few minutes; reused when unchanged)')
    for f in exefs.iterdir():
        if f.is_file() and f.name not in SKIP: run(['cp', '-c', f, ex / 'ExeFS' / f.name])
    stage(romfs, w / 'input/romfs')
    run([py(), NX / 'dm/tools/romfs_image.py', '--reuse', w / 'input/romfs', ex / 'RomFS.img'], env=e)
    P.stage('code', 'the game modules rewritten for the Mac')
    mods = subprocess.run([py(), NX / 'dm/games/game.py', tid, 'modules'], capture_output=True, text=True, check=True, env=e).stdout.split()
    for m in mods: run([py(), NX / 'dm/tools/patch_nso.py', ex / 'ExeFS' / m, b / 'patched', m], env=e)
    lib = shaders(a, tid, w, sh, cache, e)
    host_and_app(a, tid, w, lib, e)


def refresh(a):
    e = env(); w, ex, b, sh, cache = paths(a)
    tid = built_game(w)
    if not own_engine(GAMES[tid]): sys.exit(f'{GAMES[tid]["name"]} is built with another engine: refresh is for the games on switch2mac\'s engine (build again instead)')
    use_engine(GAMES[tid])
    caps = w / 'captures'; caps.mkdir(exist_ok=True); new = []
    for saved in (Path.home() / f'Library/Application Support/nxnative/{tid}/shdump', w / 'run/shdump'):   # the installed app's captures, and run's
        got = [p for p in saved.glob('*') if p.is_file() and not (caps / p.name).exists()] if saved.is_dir() else []
        for p in got: shutil.copy2(p, caps / p.name)
        print(f'{len(got)} new files from {saved}'); new += got
    print(f'{sum(1 for _ in caps.glob("*.ctl"))} shaders captured in all')
    if not new and not a.force: sys.exit('nothing new to build in (play the game a while first, or --force)')
    P.json = getattr(a, 'progress', None) == 'json'; P.plan(4); P.history(w / 'stage_times.json'); P.order = ['shader split', 'Metal shaders', 'host', 'app']
    lib = shaders(a, tid, w, sh, cache, e)
    host_and_app(a, tid, w, lib, e)


def damaged_modules(d):   # code modules (NSO) of a dump whose segments reach past the end of the file: a copy cut short, as an FTP copy in text mode leaves them
    if read_dump(d): return []   # a .nup: its size and table of contents were checked when it was read, and every file is checked against its SHA-256 as the build reads it
    if DUMP_S1: return []   # Switch 1 files: the builder checks them (NCA hashes) as it opens them
    d = Path(d).expanduser().resolve(); bad = []
    for exefs in [d / 'exefs', d / 'base/exefs'] + sorted(d.glob('updates/*/exefs')) + sorted(d.glob('updates/exefs')):
        if not exefs.is_dir(): continue
        for f in sorted(exefs.iterdir()):
            if not f.is_file() or f.name in SKIP: continue
            with f.open('rb') as h: head = h.read(0x100)
            if len(head) < 0x100 or head[:4] != b'NSO0': continue
            size = f.stat().st_size
            for i in range(3):   # text, ro, data: file offset at 0x10 + 0x10 * i, size in the file at 0x60 + 4 * i
                off = struct.unpack_from('<I', head, 0x10 + 0x10 * i)[0]; n = struct.unpack_from('<I', head, 0x60 + 4 * i)[0]
                if off + n > size: bad.append(str(f.relative_to(d))); break
    return bad


def identify(a):   # for the app: which game a dump folder is, as one JSON line (nothing is copied or built)
    out = {'ok': False, 'folder': str(Path(a.dump).expanduser())}
    try:
        tid = dump_title(a.dump); out['title_id'] = tid
    except SystemExit as x:
        out['problem'] = ('The .nup could not be read: ' if str(x).endswith('extract it to a dump folder.') else '' if DUMP_S1 else 'This isn\'t a game dump: ') + str(x); print(json.dumps(out)); return
    bad = damaged_modules(a.dump)
    if bad:
        g = GAMES.get(tid); out.update(name=g['name'] if g else '', damaged=bad,
            problem=f'The dump is damaged: {", ".join(bad)} {"is" if len(bad) == 1 else "are"} cut short. Copy it off your Switch 2 again (over FTP, in binary mode).')
        print(json.dumps(out, ensure_ascii=False)); return
    g = GAMES.get(tid) or unknown_game(tid)   # a game switch2mac has no folder for: offered with the untested builds only
    mac = this_mac(); ver = dump_version(a.dump); rec, why = recommend(g, mac, ver)
    if not rec: out['problem'] = f'title {tid}: no engine is set up to try it'; print(json.dumps(out)); return
    eng = with_build(g, rec)['engine']
    out.update(ok=True, name=g['name'], version=g.get('version', ''), engine=eng.get('kind', 'switch2mac'), commit=eng.get('commit', '')[:12],
               disk_gb=g.get('disk_gb'), page=f'games/{g["dir"].name}/README.md' if g.get('dir') else '', untested=not builds(g),
               mac=mac, recommended=rec, why=why, reports=reports(g), dump_version=ver, dump_form='nup' if DUMP_NUP else 'switch1' if DUMP_S1 else 'folder',
               needs_keys=bool(DUMP_S1), files=[p.name for p in DUMP_S1],
               builds=[{'id': b['id'], 'name': b['name'], 'engine': b['engine']['kind'], 'commit': b['engine']['commit'][:12], 'about': b.get('about', ''), 'fits': fits(b, ver)} for b in builds(g)],
               experimental=[{'id': b['id'], 'name': b['name'], 'engine': b['engine']['kind'], 'commit': b['engine']['commit'][:12], 'about': b['about']} for b in untested_builds(g)])
    if DUMP_S1 and getattr(a, 'keys', None): out['keys_ok'], out['keys_note'] = check_keys(a.keys)
    if DUMP_S1:   # what goes to the builder: the base game, its update and DLC; and the games a cartridge holds, to pick from
        try:
            base, upd, dlc = s1_parts(DUMP_S1, tid)
            out['parts'] = {'base': base.name, 'update': upd.name if upd else '', 'dlc': [p.name for p in dlc]}
        except SystemExit: pass
        apps = s1_apps(DUMP_S1)
        if len(apps) > 1: out['games_in_files'] = [{'title_id': t, 'name': GAMES[t]['name'] if t in GAMES else ''} for t in apps]
    print(json.dumps(out, ensure_ascii=False))


def builds_cmd(a):   # the builds a game has and which one this Mac gets, for people (identify gives the same to the app)
    tid = dump_title(a.dump) if Path(a.dump).expanduser().exists() else a.dump.upper()
    g = GAMES.get(tid) or next((g for g in GAMES.values() if g['dir'].name == a.dump), None) or (unknown_game(tid) if re.fullmatch(r'[0-9A-F]{16}', tid) else None)
    if not g: sys.exit(f'{a.dump}: not a Switch 2 game dump, a title ID or a games/ folder')
    ver = dump_version(a.dump) if Path(a.dump).expanduser().exists() else None
    mac = this_mac(); rec, why = recommend(g, mac, ver); rs = reports(g)
    print(f'{g["name"]}: this Mac is an {mac["chip"]} with {mac["memory_gb"]} GB, macOS {mac["macos"]}' + (f'; the dump is {ver}' if ver else ''))
    for b in builds(g):
        print(f'\n  {"*" if b["id"] == rec else " "} {b["id"]}: {b["name"]} ({b["engine"]["kind"]} {b["engine"]["commit"][:12]})' + (f'  <- this Mac: {why}' if b['id'] == rec and why else '')
              + (f'  [plays {", ".join(b["versions"])} only]' if b.get('versions') and not fits(b, ver) else ''))
        if b.get('about'): print(f'      {b["about"]}')
        for r in rs:
            if r['build'].split()[0] == b['id']:
                print(f'      {r["mac"]} {r["chip"]}' + (f', {r["memory_gb"]} GB' if r['memory_gb'] else '') + (f': {r["fps"]} fps' if r['fps'] else '') + (f', {r["peak_gb"]} GB peak' if r['peak_gb'] else '') + f' ({r["notes"]}; {r["source"]})')
    for b in untested_builds(g):
        print(f'\n  ! {b["id"]}: {b["name"]} ({b["engine"]["kind"]} {b["engine"]["commit"][:12]})\n      {b["about"]}')
    if len(builds(g)) + len(untested_builds(g)) > 1: print(f'\n./switch2mac.py build <dump> builds {rec}; --engine <id> builds another.')


def switched_build(g):
    """The game's data folder notes which build is installed (s2m_build.txt). Each build keeps its own record of the pipelines it built
    (pso_user.tsv), its pipeline archive (pso_archive/) and its shader list contribution: the engines name shaders differently, and one
    build cannot read the other's archive. When the build changes, the old build's are put aside under its name and the new build's,
    if it was installed before, come back, so switching back and forth never loses what a build learned. Saves are the game's own and stay."""
    data = Path.home() / f'Library/Application Support/nxnative/{g["title_id"]}'; note = data / 's2m_build.txt'; new = g['build']['id']
    old = note.read_text().strip() if note.exists() else (builds(g)[0]['id'] if (data / 'pso_user.tsv').exists() else '')
    def aside(f, b):   # pso_user.tsv → pso_user.<build>.tsv, pso_archive → pso_archive.<build>
        return data / (f'{f.removesuffix(".tsv").removesuffix(".txt")}.{b}{Path(f).suffix}' if Path(f).suffix in ('.tsv', '.txt', '.done') else f'{f}.{b}')
    if old and old != new:
        for f in ('pso_user.tsv', 'pso_archive', 'shader-list-contribution.txt', '.shader-list-contribution.txt.done'):
            p, keep = data / f, aside(f, old)
            if p.exists() and not keep.exists(): p.rename(keep)
            back = aside(f, new)
            if back.exists() and not p.exists(): back.rename(p)
        print(f'  {g["name"]} was on the {old} build: its pipeline record and archive are kept aside for it, and the {new} build\'s own come back (saves stay)')
    if data.is_dir(): note.write_text(new + '\n')


def install(a):
    w = paths(a)[0]; tid = built_game(w)
    g = GAMES[tid]; app = w / f'{g["name"]}.app'; dst = Path(a.to).expanduser() / app.name
    if subprocess.run(['pgrep', '-f', f'{dst}/Contents/MacOS'], capture_output=True).returncode == 0: sys.exit(f'{g["name"]} is running: quit it first')
    if dst.exists(): shutil.rmtree(dst)
    shutil.move(str(app), dst); Path(str(app) + '.key').unlink(missing_ok=True)
    switched_build(g)
    print(f'installed: {dst}\nThe first start after each install waits 1-3 minutes while macOS scans the app (no window, no Dock icon yet): wait, do not open it twice.')


def run_game(a):
    """The build straight from ./work, without packing an app: the way to try a new game or a fix. Output goes to the terminal and work/logs/run-<time>.log;
    VAR=value arguments add host switches (docs/porting.md lists the useful ones). work/run/ctl.txt is the host's control file (DM_CTL): write a command
    line into it while the game runs (shot, passdump, texraw, memdump, ...). Shaders the game meets that the build lacks are saved to work/run/shdump."""
    w = paths(a)[0]; tid = built_game(w); g = GAMES[tid]; r = w / 'run'
    if not own_engine(g): sys.exit(f'{g["name"]} is built with another engine: open the app instead (its own runner: {w / tid})')
    use_engine(g)
    for d in ('save', 'temp', 'shdump'): (r / d).mkdir(parents=True, exist_ok=True)
    (r / 'ctl.txt').write_text(''); (w / 'logs').mkdir(exist_ok=True)
    e = dict(os.environ, DM_ROOT=str(w), DM_ROMFS=str(w / 'extract/RomFS.img'), DM_SAVE=str(r / 'save'), DM_TEMP=str(r / 'temp'), DM_NVN_SHDUMP=str(r / 'shdump'),
             DM_MSL_DIR=str(w / 'cache/metal_shader_cache'), DM_FONT_DIR=str(w / 'build/font'), DM_NVN_SHMAP=str(w / 'profile' / tid / 'shader_map.tsv'),
             DM_GAMES_DIR=str(w / 'profile'), DM_GAMES_FIRST='1', DM_LANG='en-US', DM_WINDOW='1', DM_AUDIO='1', DM_CTL=str(r / 'ctl.txt'))
    envf = g['dir'] / 'env.txt' if g.get('dir') else Path('/nonexistent')
    for l in (envf.read_text().splitlines() if envf.exists() else []):
        if '=' in l and not l.startswith('#'): k, v = l.split('=', 1); e.setdefault(k.strip(), v.strip())
    for kv in a.vars:
        if '=' not in kv: sys.exit(f'{kv}: expected VAR=value')
        k, v = kv.split('=', 1); e[k] = v
    cmd = [str(NX / 'dm/host/dmhost'), str(w / 'build/patched')]
    log = w / 'logs' / f'run-{datetime.datetime.now():%Y%m%d-%H%M%S}.log'
    print(' '.join(f'{k}={e[k]}' for k in sorted(e) if k.startswith('DM_')) + ' ' + ' '.join(cmd))
    if a.print: return
    print(f'log: {log}', flush=True)
    with log.open('w') as f:
        p = subprocess.Popen(cmd, env=e, cwd=r, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, errors='replace')
        for line in p.stdout: sys.stdout.write(line); f.write(line)
    sys.exit(p.wait())


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('--work', default=str(ROOT / 'work'), help='build folder (default ./work)')
    sub = ap.add_subparsers(dest='cmd', required=True)
    sub.add_parser('setup'); bp = sub.add_parser('build'); bp.add_argument('dump')
    bp.add_argument('--engine', help='a game with several builds: build this one (see: builds <dump>) instead of the one chosen for this Mac')
    bp.add_argument('--quick', action='store_true', help='nxnative builds: only the shaders the game\'s playtests used (its shader_seen.tsv), for testing a change in minutes; a full build afterwards fills in the rest')
    sp = sub.add_parser('builds'); sp.add_argument('dump', help='a dump folder, a title ID or a games/ folder name')
    rp = sub.add_parser('refresh'); rp.add_argument('--force', action='store_true', help='rebuild even with no new shaders')
    for x in (bp, rp): x.add_argument('--progress', choices=('lines', 'json'), default='lines', help='json: one event per line, for the switch2mac app')
    ip = sub.add_parser('install'); ip.add_argument('--to', default='/Applications', help='the folder the app goes to (default /Applications)')
    dp = sub.add_parser('identify'); dp.add_argument('dump')
    bp.add_argument('--firmware', help='MacNativeGames builds from an .nsp (and Breath of the Wild): your unpacked firmware dump, for the system fonts')
    bp.add_argument('--shared-fonts', help='MacNativeGames: the six shared fonts an earlier Tears of the Kingdom build extracted, instead of --firmware')
    for x in (bp, dp): x.add_argument('--keys', help='a Switch 1 game (.nsp / .nsz / .xci / .xcz): your own prod.keys, passed to the builder only (never copied or kept)')
    for x in (bp, dp):
        x.add_argument('--title-id', help='a Switch cartridge with several games (or files of several games): the one to build, its title ID')
        x.add_argument('--add', action='append', default=[], metavar='FILE', help='a Switch game: an update or DLC file to build with it (again for more)')
    gp = sub.add_parser('run'); gp.add_argument('vars', nargs='*', help='host switches, VAR=value'); gp.add_argument('--print', action='store_true', help='show the command only')
    a = ap.parse_args()
    global S1_PICK, S1_EXTRA
    S1_PICK = getattr(a, 'title_id', None); S1_EXTRA = [Path(x).expanduser().resolve() for x in getattr(a, 'add', None) or []]
    if a.cmd not in ('setup', 'identify', 'builds') and Path(sys.prefix).resolve() != VENV.resolve() and not has_packages():   # run inside .venv, unless this Python has the packages (the app's)
        os.execv(py(), [str(py()), __file__] + sys.argv[1:])
    try:
        {'setup': setup, 'build': build, 'refresh': refresh, 'install': install, 'run': run_game, 'identify': identify, 'builds': builds_cmd}[a.cmd](a)
    except (KeyboardInterrupt, SystemExit): raise
    except Exception as x:   # the details go to the log, the last line says what to do
        import traceback; traceback.print_exc()
        if 'cut short or damaged' in str(x):   # a code file of the dump (nso.Error): the dump's problem, not switch2mac's
            P.end(False, 'the dump is damaged')
            sys.exit(f'The dump is damaged: {x}. Copy it off your Switch 2 again (over FTP, in binary mode).')
        P.end(False, 'switch2mac stopped on a problem of its own')
        sys.exit('switch2mac stopped on a problem of its own (a bug, not your dump). Copy the diagnostics in Settings and open an issue: '
                 'https://github.com/azmasm/switch2mac/issues')


if __name__ == '__main__':
    main()
