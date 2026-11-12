#!/usr/bin/env python3
# The Legend of Zelda: Ocarina of Time's launcher settings (from Mario Kart World's) (Resources/dm/launcher.json): nxnative's generic list (dm/games/settings.py) plus this build's own rows.
# The dump has no control.nacp, so the language list is fixed to en-US. Usage: launcher.py <nxnative folder> <rewritten modules dir> <out.json>   (hermit.py runs it)
import json, os, sys
repo, patched, out = sys.argv[1:4]
sys.path[:0] = [os.path.join(repo, 'dm/games'), os.path.join(repo, 'dm/tools')]
os.environ.update(SETTINGS_PLATFORM='mac', GFXAPI='nvn', DM_LANG='en-US')
import nacp, settings
nacp.languages = lambda control: ['en-US']
d = settings.build('0400486024DEC000', patched, None)
rows = {s['env']: s for s in d['settings']}
overlay = {'env': 'DM_OVERLAY', 'kind': 'choice', 'section': 'Game', 'label': 'Performance overlay',
           'note': 'Key 1 in game cycles it: compact (FPS + resolution) → detailed (graph, GPU, frame time, CPU, memory) → off.',
           'default': 'compact', 'level': 'basic', 'options': [['compact', 'Compact'], ['detailed', 'Detailed'], ['off', 'Off']]}
enc = rows['DM_NVN_ENC_THREAD']
enc.update(default='1', note='Encodes GPU work on its own thread (Mario Kart World: about 10 fps faster).')
order = []
for s in d['settings']:
    if s['env'] == 'DM_METAL_HUD': continue
    if s['env'] == 'DM_FULLSCREEN': order += [s, overlay]; continue
    order.append(s)
d['settings'] = [s for s in order if s['section'] != 'Controls'] + [s for s in order if s['section'] == 'Controls']   # tabs: Display, Performance, Controls
open(out, 'w', encoding='utf-8').write(json.dumps(d, indent=1, ensure_ascii=False) + '\n')
print(out, len(order), 'settings')
