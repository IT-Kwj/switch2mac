# Donkey Kong Bananza

Title ID `040074A01BF12000`, update v458752. **nxnative reports it plays at 60 fps on an M4 Pro** through the first level's opening areas.

Built with [upstream nxnative](https://github.com/seedds/nxnative)'s own builder at the commit `game.json` names (fetched once into `./engines`), with switch2mac's front end added (`tools/engine/patch.py`), so it plays like the Mario Kart World port:

- the game starts at once: no settings window first
- **key 1**: the performance overlay in the top right (compact FPS and resolution → detailed graph, GPU, frame time, CPU, memory → off)
- **key 2**: the settings nxnative's own launch window offers for this game, in the Mario Kart style; most apply at the next launch

| What | |
|---|---|
| Profile and notes | [nxnative `dm/games/040074A01BF12000`](https://github.com/seedds/nxnative/tree/cb39b33ad5e8ed44c402d53cc3f183539582415a/dm/games/040074A01BF12000) |
| Dump folder | `base/` (exefs, romfs), `updates/458752/` (exefs, romfs: the full patched RomFS), optionally `dlc/` |
| Build time | all 22,852 shaders: about 75 minutes on an M4 Pro (nxnative's figure), longer on older Macs |
| Verified by nxnative | on an M4 Pro: three play sessions of about 5 minutes and longer automated runs, through the opening, the mining tunnel and the areas after it, at 60 fps; in busy scenes the game drops itself to 30 fps for a few seconds. Nothing past the first level's opening areas is tested. The first start builds its pipelines for about 4 minutes, once |

## Shared shader list

[`shader_list.tsv`](shader_list.tsv): this game's own list of shaders and pipelines players have met, for this engine version only (its first line says which). Its build ships nxnative's own seed list for the game (3,793 rows from nxnative's playtests) followed by this list's rows; the app prepares them before the first frame. It starts empty: when you close the game, the app offers to send what it built (every 100 new rows), as described in the main README's Contributing section.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac (from GitHub issues on this game's builder), with the fps and memory where given, and whether it was fixed.

## Build

In the switch2mac app: choose your dump folder on the **Builds** page and press **Build**. In Terminal:

```bash
./switch2mac.py build "<your dump folder>"
```

Then `./switch2mac.py install`. `refresh` and `run` are for Mario Kart World only.
