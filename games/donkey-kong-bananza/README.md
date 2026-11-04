# Donkey Kong Bananza

Title ID `040074A01BF12000`, update v458752. **Untested in switch2mac.**

Built with [upstream nxnative](https://github.com/seedds/nxnative)'s own builder at the commit `game.json` names (fetched once into `./engines`), with switch2mac's front end added (`tools/engine/patch.py`), so it plays like the Mario Kart World port:

- the game starts at once: no settings window first
- **key 1**: the performance overlay in the top right (compact FPS and resolution → detailed graph, GPU, frame time, CPU, memory → off)
- **key 2**: the settings nxnative's own launch window offers for this game, in the Mario Kart style; most apply at the next launch

| What | |
|---|---|
| Profile and notes | [nxnative `dm/games/040074A01BF12000`](https://github.com/seedds/nxnative/tree/aafe01d31dece4fb9dc032d86a566f35fa826f69/dm/games/040074A01BF12000) |
| Dump folder | `base/` (exefs, romfs), `updates/458752/` (exefs, romfs: the full patched RomFS), optionally `dlc/` |
| Build time | all 22,852 shaders: about 75 minutes on an M4 Pro (nxnative's figure), longer on older Macs |
| nxnative's report | plays on an M4 Pro through the opening areas at 60 fps, dropping to 30 in busy scenes |

## Shared shader list

[`shader_list.tsv`](shader_list.tsv): this game's own list of shaders and pipelines players have met, for this engine version only (its first line says which). Its build ships nxnative's own seed list for the game (3,793 rows from nxnative's playtests) followed by this list's rows; the app prepares them before the first frame. It starts empty: when you close the game, the app offers to send what it built (every 100 new rows), as described in the main README's Contributing section.

## Build

```bash
./switch2mac.py build "<your dump folder>"
```

Then `./switch2mac.py install`. `refresh` and `run` are for Mario Kart World only.
