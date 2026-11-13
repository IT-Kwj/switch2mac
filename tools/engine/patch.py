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
               "    ov = {'env': 'DM_OVERLAY', 'kind': 'choice', 'section': 'Game', 'label': '性能悬浮层', 'default': 'compact', 'level': 'basic',\n"
               "          'note': '游戏中按 1 键循环切换：紧凑（FPS + 分辨率）→ 详细（图表、GPU、帧时间、CPU、内存）→ 关闭。',\n"
               "          'options': [['compact', '紧凑'], ['detailed', '详细'], ['off', '关闭']]}\n"
               "    at = next((i + 1 for i, r in enumerate(d['settings']) if r.get('env') == 'DM_FULLSCREEN'), 0)\n"
               "    if not any(r.get('env') == 'DM_OVERLAY' for r in d['settings']): d['settings'].insert(at, ov)\n")
        st.write_text(s.replace(w, row + w, 1)); print('  settings.py: Performance overlay row')
    settings_zh(nx)
    hle_net_poll(nx)


def hle_net_poll(nx):   # cap the offline poll/select idle wait at 100 ms: Mario Kart World otherwise stalls for ~14 s at "return to home" / before the course select (0 fps)
    path = nx / 'dm/host/hle_net.c'; s = path.read_text()
    old = "static int sk_idle(int64_t ms) { dm_guest_sleep_ns((ms < 0 ? 100 : ms) * 1000000); return 0; }"
    new = "static int sk_idle(int64_t ms) { if (ms > 100) ms = 100; dm_guest_sleep_ns((ms < 0 ? 100 : ms) * 1000000); return 0; }"
    if old in s:
        path.write_text(s.replace(old, new, 1)); print('  hle_net.c: poll idle capped at 100 ms')


def settings_zh(nx):   # switch2mac's Chinese labels/notes for the generic rows a game's key-2 panel shows (idempotent: the English lines are gone after the first run)
    path = nx / 'dm/games/settings.tsv'; s = path.read_text(); changed = False
    for old, new in (
        ("DM_OPMODE\tchoice\t1=Docked,0=Handheld\tDM_GAME_OPMODE\talways\tGame\tConsole mode\t\tlevel=basic",
         "DM_OPMODE\tchoice\t1=底座模式,0=掌机模式\tDM_GAME_OPMODE\talways\tGame\t主机模式\t\tlevel=basic"),
        ("DM_PRESENT_UPSCALE\tchoice\toff=Standard,metalfx=MetalFX\toff\talways\tGame\tUpscaling\tUses more GPU time and can increase heat.",
         "DM_PRESENT_UPSCALE\tchoice\toff=标准,metalfx=MetalFX\toff\talways\tGame\t画面放大\t会占用更多 GPU 时间，可能增加发热。"),
        ("DM_LANG\tchoice\tlanguages\tbuild:DM_LANG\tlanguages>1\tGame\tGame language\t\tlevel=basic",
         "DM_LANG\tchoice\tlanguages\tbuild:DM_LANG\tlanguages>1\tGame\t游戏语言\t\tlevel=basic"),
        ("DM_FULLSCREEN\tchoice\t0=Window,1=Fullscreen\t0\tplatform:mac\tGame\tDisplay mode\t\tlevel=basic",
         "DM_FULLSCREEN\tchoice\t0=窗口,1=全屏\t0\tplatform:mac\tGame\t显示模式\t\tlevel=basic"),
        ("DM_UPSCALER\tchoice\tgame=Game's own,metalfx=MetalFX\tgame\tDM_GAME_UPSCALER_N!=0\tGame\tGame's upscaler",
         "DM_UPSCALER\tchoice\tgame=游戏自带,metalfx=MetalFX\tgame\tDM_GAME_UPSCALER_N!=0\tGame\t游戏内置升频器"),
        ("DM_RUMBLE\ttoggle\t-\t1\talways\tControls\tGame rumble\t\tlevel=basic",
         "DM_RUMBLE\ttoggle\t-\t1\talways\tControls\t手柄震动\t\tlevel=basic"),
        ("DM_RUMBLE_GAIN\trange\t0:3:0.1\t1.0\talways\tControls\tRumble strength\t\tneeds=DM_RUMBLE=1",
         "DM_RUMBLE_GAIN\trange\t0:3:0.1\t1.0\talways\tControls\t震动强度\t\tneeds=DM_RUMBLE=1"),
        ("DM_RUMBLE_MIN\trange\t0:0.9:0.05\t0\talways\tControls\tRumble cutoff",
         "DM_RUMBLE_MIN\trange\t0:0.9:0.05\t0\talways\tControls\t震动阈值"),
        ("DM_PRESENT_SNAP\ttoggle\t-\tDM_GAME_PRESENT_SNAP\tgfxapi:nvn\tPerformance\tFrame buffering\tUp to one frame more display latency.",
         "DM_PRESENT_SNAP\ttoggle\t-\tDM_GAME_PRESENT_SNAP\tgfxapi:nvn\tPerformance\t帧缓冲\t最多增加一帧显示延迟。"),
        ("DM_PSO_MTL4\ttoggle\t-\tDM_GAME_PSO_MTL4|1\tgfxapi:nvn\tPerformance\tMetal 4 pipelines\tKeeps a pipeline archive; uses more memory.",
         "DM_PSO_MTL4\ttoggle\t-\tDM_GAME_PSO_MTL4|1\tgfxapi:nvn\tPerformance\tMetal 4 管线\t保留管线归档；占用更多内存。"),
        ("DM_PSO_PREBUILD\ttoggle\t-\t1\tgfxapi:nvn\tPerformance\tPipeline prebuild\tThe first start waits a few minutes for it, once.\tneeds=DM_PSO_MTL4=1",
         "DM_PSO_PREBUILD\ttoggle\t-\t1\tgfxapi:nvn\tPerformance\t管线预构建\t首次启动会为此等待几分钟，仅一次。\tneeds=DM_PSO_MTL4=1"),
        ("DM_NVN_ENC_THREAD\ttoggle\t-\t1|DM_GAME_ENC_THREAD\tgfxapi:nvn\tPerformance\tEncode thread",
         "DM_NVN_ENC_THREAD\ttoggle\t-\t1|DM_GAME_ENC_THREAD\tgfxapi:nvn\tPerformance\t编码线程"),
        ("DM_METAL_HUD\ttoggle\t-\t0\talways\tPerformance\tPerformance HUD",
         "DM_METAL_HUD\ttoggle\t-\t0\talways\tPerformance\t性能 HUD"),
        ("DM_FPS_TARGET\tchoice\t30=30 fps,60=60 fps,120=120 fps?DM_GAME_FPS_MAX==120&platform:mac\tDM_GAME_FPS_TARGET\tDM_GAME_FPS_TARGET!=0\tGame\tFrame rate\t\tlevel=basic",
         "DM_FPS_TARGET\tchoice\t30=30 帧,60=60 帧,120=120 帧?DM_GAME_FPS_MAX==120&platform:mac\tDM_GAME_FPS_TARGET\tDM_GAME_FPS_TARGET!=0\tGame\t帧率\t\tlevel=basic"),
        ("DM_DYNAMIC_RESOLUTION\ttoggle\t-\t0\tfixups:DYNAMIC_RESOLUTION\tGame\tDynamic resolution\tLets the game lower its resolution under load. Turn off to keep full resolution for the selected console mode.",
         "DM_DYNAMIC_RESOLUTION\ttoggle\t-\t0\tfixups:DYNAMIC_RESOLUTION\tGame\t动态分辨率\t让游戏在高负载时降低分辨率；关闭后保持所选主机模式下的完整分辨率。"),
        ("DM_RENDER_SCALE\trange\t0.5:1.0:0.05\t1.0\tfixups:RENDER_SCALE\tGame\tRender scale\t\tlevel=basic",
         "DM_RENDER_SCALE\trange\t0.5:1.0:0.05\t1.0\tfixups:RENDER_SCALE\tGame\t渲染比例\t\tlevel=basic"),
        ("DM_PICTURE_FIT\tchoice\tfit=Fit,fill=Fill\tfit\tplatform:ios\tGame\tPicture\tFill crops the game's 16:9 picture to cover the screen. Health bars, subtitles or maps near the edges can be cut off. A full-screen picture without cropping needs a patch for each game.",
         "DM_PICTURE_FIT\tchoice\tfit=适配,fill=填充\tfit\tplatform:ios\tGame\t画面\t“填充”会裁切游戏的 16:9 画面以铺满屏幕，边缘的血条、字幕或地图可能被切掉；不裁切的全屏画面需要为每个游戏单独打补丁。"),
        ("DM_SHOW_FPS\ttoggle\t-\tbuild:DM_SHOW_FPS\tplatform:ios\tGame\tFrame-rate counter",
         "DM_SHOW_FPS\ttoggle\t-\tbuild:DM_SHOW_FPS\tplatform:ios\tGame\t帧率显示"),
        ("DM_TOUCH_HAPTICS\ttoggle\t-\t1\tplatform:ios\tControls\tTouch feedback",
         "DM_TOUCH_HAPTICS\ttoggle\t-\t1\tplatform:ios\tControls\t触摸反馈"),
        ("DM_PAD_PRESS_TO_JOIN\ttoggle\t-\t0\talways\tControls\tPress a button to join",
         "DM_PAD_PRESS_TO_JOIN\ttoggle\t-\t0\talways\tControls\t按键加入"),
        ("DM_SW2\ttoggle\t-\t0\tplatform:mac\tControls\tSwitch 2 controllers\tPlays Joy-Con 2 and Pro Controller 2 over Bluetooth: hold Sync on one during the game to pair it. macOS asks once for Bluetooth access.",
         "DM_SW2\ttoggle\t-\t0\tplatform:mac\tControls\tSwitch 2 手柄\t通过蓝牙使用 Joy-Con 2 和 Pro Controller 2：游戏中按住手柄上的 Sync 键配对。macOS 会请求一次蓝牙权限。"),
        ("DM_SCREEN_ASPECT\tchoice\tauto=Match screen?platform:ios,1.43=iPhone Duo screen (1.43:1),0=16:9 (Switch)\tauto|0\tDM_GAME_SCREEN_ASPECT!=0\tGame\tPicture shape\tRenders about a quarter more pixels: a little slower and warmer.",
         "DM_SCREEN_ASPECT\tchoice\tauto=匹配屏幕?platform:ios,1.43=iPhone Duo 屏幕 (1.43:1),0=16:9 (Switch)\tauto|0\tDM_GAME_SCREEN_ASPECT!=0\tGame\t画面形状\t渲染像素约多四分之一：会稍慢、稍热。"),
        ("DM_FPS_HOLD\ttoggle\ton/off\tDM_GAME_FPS_HOLD\tDM_GAME_FPS_TARGET!=0\tPerformance\tHold frames when late",
         "DM_FPS_HOLD\ttoggle\ton/off\tDM_GAME_FPS_HOLD\tDM_GAME_FPS_TARGET!=0\tPerformance\t掉帧时保持帧"),
    ):
        if old in s:
            s = s.replace(old, new); changed = True
    if changed: path.write_text(s); print('  settings.tsv: Chinese labels/notes')

    # the note a language list without control data shows (settings.py), and the language names in the DM_LANG menu (nacp.py)
    sp = nx / 'dm/games/settings.py'; t = sp.read_text()
    old_note = "UNKNOWN_LANGUAGES = 'This game\\'s files do not list its languages, so some of these may not be in the game. It may then show another one.'"
    new_note = "UNKNOWN_LANGUAGES = '此游戏文件未列出其语言，因此其中一些可能不在游戏中；游戏可能显示为另一种语言。'"
    if old_note in t:
        sp.write_text(t.replace(old_note, new_note)); print('  settings.py: Chinese language note')
    np_ = nx / 'dm/tools/nacp.py'; n = np_.read_text()
    old_langs = ("LANGUAGES = [('en-US', 'American English'), ('en-GB', 'British English'), ('ja', 'Japanese'), ('fr', 'French'), ('de', 'German'), ('es-419', 'Latin American Spanish'), ('es', 'Spanish'), ('it', 'Italian'),\n"
                 "             ('nl', 'Dutch'), ('fr-CA', 'Canadian French'), ('pt', 'Portuguese'), ('ru', 'Russian'), ('ko', 'Korean'), ('zh-Hant', 'Traditional Chinese'), ('zh-Hans', 'Simplified Chinese'), ('pt-BR', 'Brazilian Portuguese')]")
    new_langs = ("LANGUAGES = [('en-US', '美式英语'), ('en-GB', '英式英语'), ('ja', '日语'), ('fr', '法语'), ('de', '德语'), ('es-419', '拉美西班牙语'), ('es', '西班牙语'), ('it', '意大利语'),\n"
                 "             ('nl', '荷兰语'), ('fr-CA', '加拿大法语'), ('pt', '葡萄牙语'), ('ru', '俄语'), ('ko', '韩语'), ('zh-Hant', '繁体中文'), ('zh-Hans', '简体中文'), ('pt-BR', '巴西葡萄牙语')]")
    if old_langs in n:
        np_.write_text(n.replace(old_langs, new_langs)); print('  nacp.py: Chinese language names')


if __name__ == '__main__':
    main()
