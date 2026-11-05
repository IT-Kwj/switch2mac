#!/usr/bin/env python3
# Mario Kart World's launcher settings (Resources/dm/launcher.json): nxnative's generic list (dm/games/settings.py) plus this build's own rows.
# The dump has no control.nacp, so the language list is fixed to en-US. Usage: launcher.py <nxnative folder> <rewritten modules dir> <out.json>   (switch2mac.py runs it)
import json, os, sys
repo, patched, out = sys.argv[1:4]
sys.path[:0] = [os.path.join(repo, 'dm/games'), os.path.join(repo, 'dm/tools')]
os.environ.update(SETTINGS_PLATFORM='mac', GFXAPI='nvn', DM_LANG='en-US')
import nacp, settings
nacp.languages = lambda control: ['en-US']
d = settings.build('0400C3F00006E000', patched, None)
rows = {s['env']: s for s in d['settings']}
overlay = {'env': 'DM_OVERLAY', 'kind': 'choice', 'section': 'Game', 'label': '性能悬浮层',
           'note': '游戏中按 1 键循环切换：紧凑（FPS + 分辨率）→ 详细（图表、GPU、帧时间、CPU、内存）→ 关闭。',
           'default': 'compact', 'level': 'basic', 'options': [['compact', '紧凑'], ['detailed', '详细'], ['off', '关闭']]}
enc = rows['DM_NVN_ENC_THREAD']
enc.update(default='1', note='在独立线程编码 GPU 工作。关闭：约慢 10 fps。')
perf = {'env': 'DM_NVN_SKIP_FS', 'kind': 'toggle', 'section': 'Performance', 'label': '性能模式',
        'note': '跳过一次环境反射更新（约 +7 fps，接近 60）。关闭：每帧都更新反射。',
        'default': '83ea368cd702b9de', 'level': 'basic', 'on': '83ea368cd702b9de', 'off': 'none'}
order = []
for s in d['settings']:
    if s['env'] == 'DM_METAL_HUD': continue
    if s['env'] == 'DM_FULLSCREEN': order += [s, overlay]; continue
    if s['env'] == 'DM_PRESENT_SNAP': order.append(perf)
    order.append(s)
d['settings'] = [s for s in order if s['section'] != 'Controls'] + [s for s in order if s['section'] == 'Controls']   # tabs: Display, Performance, Controls
open(out, 'w', encoding='utf-8').write(json.dumps(d, indent=1, ensure_ascii=False) + '\n')
print(out, len(order), 'settings')
