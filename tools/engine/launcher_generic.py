#!/usr/bin/env python3
# The launcher settings (Resources/dm/launcher.json) of a game built on Hermit's engine with a borrowed profile (an untested build): the engine's
# generic list (dm/games/settings.py) plus the performance overlay row, as Mario Kart World's launcher.py makes them without its own game-specific rows.
# Usage: launcher_generic.py <engine folder> <rewritten modules dir> <out.json> <title ID>   (hermit.py runs it)
import json, os, sys
repo, patched, out, tid = sys.argv[1:5]
sys.path[:0] = [os.path.join(repo, 'dm/games'), os.path.join(repo, 'dm/tools')]
os.environ.update(SETTINGS_PLATFORM='mac', GFXAPI='nvn', DM_LANG='en-US')
import nacp, settings
nacp.languages = lambda control: ['en-US']   # a dump has no control data
d = settings.build(tid, patched, None)
overlay = {'env': 'DM_OVERLAY', 'kind': 'choice', 'section': 'Game', 'label': 'Performance overlay',
           'note': 'Key 1 in game cycles it: compact (FPS + resolution) → detailed (graph, GPU, frame time, CPU, memory) → off.',
           'default': 'compact', 'level': 'basic', 'options': [['compact', 'Compact'], ['detailed', 'Detailed'], ['off', 'Off']]}
order = []
for s in d['settings']:
    if s['env'] == 'DM_METAL_HUD': continue
    order.append(s)
    if s['env'] == 'DM_FULLSCREEN': order.append(overlay)
d['settings'] = [s for s in order if s['section'] != 'Controls'] + [s for s in order if s['section'] == 'Controls']
open(out, 'w', encoding='utf-8').write(json.dumps(d, indent=1, ensure_ascii=False) + '\n')
print(out, len(order), 'settings')
