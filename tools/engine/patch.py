#!/usr/bin/env python3
"""Hermit's additions in another nxnative checkout (upstream nxnative for Donkey Kong Bananza, pokopia-native's for Pokémon Pokopia), as hermit.py build applies them:

  - Mario Kart World's overlay (key 1) and settings panel (key 2): tools/engine/s2m_ui.m copied in, with the shared shader list's offer (tools/engine/s2m_share.m, a copy of hermit-builds' dm/host/s2m_share.m), two calls in front_mac.m, the file in the host's Makefile
  - the overlay's data: mtl_cur_frame (nvn_mtl.m) and nvn_game_size (hle_nvn.c), when the checkout lacks them
  - the "Performance overlay" row in the app's settings list (dm/games/settings.py)

  tools/engine/patch.py <nxnative checkout>

Each change is found by a line of the pinned commit's source and made once (a second run changes nothing); a line that is not there stops it, naming the file.
"""
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
MARK = '(switch2mac)'   # every inserted block names it, so a second run sees its own work


def edit(path, after, add, why):   # add the text after the first line holding `after`, once
    s = path.read_text()
    if MARK in add and add.strip() in s: return
    i = s.find(after)
    if i < 0: sys.exit(f'{path}: no line with {after!r} ({why}): this engine version is not one Hermit knows')
    j = s.index('\n', i) + 1
    path.write_text(s[:j] + add + s[j:])
    print(f'  {path.name}: {why}')


def main():
    if len(sys.argv) != 2: sys.exit(__doc__)
    nx = Path(sys.argv[1]).resolve(); host = nx / 'dm/host'; nvn = nx / 'dm/gfx/nvn'
    for f in (ROOT / 'tools/engine/s2m_ui.m', ROOT / 'tools/engine/s2m_share.m'):   # the overlay and panel; the shared shader list's offer (the same file as Mario Kart World's)
        src = f.read_bytes()
        if not (host / f.name).is_file() or (host / f.name).read_bytes() != src: (host / f.name).write_bytes(src); print(f'  {f.name} copied')
    mk = host / 'Makefile'; s = mk.read_text()
    if ' s2m_ui.m' not in s:
        if s.count('front_mac.m ') < 1: sys.exit(f'{mk}: no front_mac.m in the sources')
        mk.write_text(s.replace('front_mac.m ', 'front_mac.m s2m_ui.m s2m_share.m ', 1)); print('  Makefile: s2m_ui.m and s2m_share.m built with the host')
    fm = host / 'front_mac.m'
    edit(fm, '#include "front.h"', '// (switch2mac) overlay and settings panel: s2m_ui.m\n'
         'void s2m_ui_attach(NSWindow *win, NSView *view, CAMetalLayer *layer, void (*release)(void), void (*resume)(void)); int s2m_ui_key(NSEvent *e);\n', 'declarations')
    edit(fm, 'v.layer = g_layer; [(DmGameView *)v fitDrawable];', '        s2m_ui_attach(win, v, g_layer, input_release, input_resume);   // (switch2mac) the overlay and settings panel\n', 'overlay attached to the window')
    keys = ('if (e.type == NSEventTypeKeyDown && (e.modifierFlags & NSEventModifierFlagCommand)) return e;',   # nxnative's key monitor: ⌘ shortcuts go to the menu
            'if (cmd) return e;   // ⌘ shortcuts go to the menu')   # pokopia-native's (8c34a990: Shift, Control and Option as game keys, F1 its Settings window)
    edit(fm, next((k for k in keys if k in fm.read_text()), keys[0]),
         '            if (s2m_ui_key(e)) return nil;   // (switch2mac) keys 1 and 2, and every key while the settings panel is open\n', 'keys 1 and 2')
    mtl = nvn / 'nvn_mtl.m'
    if 's2m_fg_shown(void)' not in mtl.read_text():   # the overlay's shown frame rate with frame generation: the engine's count where it has one
        t = mtl.read_text()
        mtl.write_text(t.rstrip('\n') + '\nuint64_t s2m_fg_shown(void) { return %s; }   // (switch2mac) the overlay: pictures shown after a generated frame\n' % ('g_fg_shown' if 'static uint64_t g_fg_shown;' in t else '0'))
        print('  nvn_mtl.m: s2m_fg_shown')
    if 'mtl_cur_frame(void) {' not in mtl.read_text():
        edit(mtl, 'static _Atomic uint64_t g_cur_frame;', 'uint64_t mtl_cur_frame(void) { return atomic_load(&g_cur_frame); }   // (switch2mac) the overlay\'s frames per second\n', 'mtl_cur_frame')
    hn = nvn / 'hle_nvn.c'
    if 'void nvn_game_size(' not in hn.read_text():
        s = hn.read_text(); k = 'static const int *present_crop('
        if k not in s: sys.exit(f'{hn}: no present_crop')
        hn.write_text(s.replace(k, 'static _Atomic int g_game_w, g_game_h;   // (switch2mac) the size of the frame the game presents last (the overlay)\n'
                                   'void nvn_game_size(int *w, int *h) { *w = atomic_load(&g_game_w); *h = atomic_load(&g_game_h); }\n' + k, 1))
        edit(hn, 'const int *crop = present_crop(o->crop, (int)t->d.width, (int)t->d.height, lc);', '        atomic_store(&g_game_w, (int)t->d.width); atomic_store(&g_game_h, (int)t->d.height);   // (switch2mac)\n', 'nvn_game_size')
    bi = nx / 'scripts/build_ipa_from_nsp.py'   # a quick try (hermit.py --quick) also takes the game's shared shader list (S2M_SEEN), and builds a game whose profile has no shader_seen.tsv
    s = bi.read_text() if bi.is_file() else ''
    old = ("    return set(re.findall(r'^[0-9a-f]{16}\\b', g.table('shader_seen.tsv').read_text(errors='replace'), re.M))\n")
    if old in s:
        bi.write_text(s.replace(old, "    t = ''.join(f.read_text(errors='replace') for f in (g.table('shader_seen.tsv'), Path(os.environ.get('S2M_SEEN') or '/nonexistent')) if f.is_file())   # (switch2mac) and the shared list\n"
                                     "    return set(re.findall(r'^(?:[SC]\\t)?([0-9a-f]{16})(?:_[a-z]+)?\\b', t, re.M))\n", 1)); print('  build_ipa_from_nsp.py: quick tries take the shared shader list')
    elif s and 'S2M_SEEN' not in s: print('  build_ipa_from_nsp.py: no seen_listed of the known form: a quick try uses only the profile\'s own list')
    st = nx / 'dm/games/settings.py'
    s = st.read_text(); w = "    Path(sys.argv[4]).write_text(json.dumps(d,"
    if w not in s: sys.exit(f'{st}: no line with {w!r}')
    if MARK not in s:
        row = ("    # (switch2mac) the performance overlay's row, after Fullscreen (s2m_ui.m reads DM_OVERLAY)\n"
               "    ov = {'env': 'DM_OVERLAY', 'kind': 'choice', 'section': 'Game', 'label': 'Performance overlay', 'default': 'compact', 'level': 'basic',\n"
               "          'note': 'Key 1 in game cycles it: compact (FPS + resolution) → detailed (graph, GPU, frame time, CPU, memory) → off. Key 2: these settings.',\n"
               "          'options': [['compact', 'Compact'], ['detailed', 'Detailed'], ['off', 'Off']]}\n"
               "    at = next((i + 1 for i, r in enumerate(d['settings']) if r.get('env') == 'DM_FULLSCREEN'), 0)\n"
               "    if not any(r.get('env') == 'DM_OVERLAY' for r in d['settings']): d['settings'].insert(at, ov)\n")
        st.write_text(s.replace(w, row + w, 1)); print('  settings.py: Performance overlay row')


if __name__ == '__main__':
    main()
