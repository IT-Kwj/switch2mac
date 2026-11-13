# Pokémon Pokopia

Title ID `0400A3A01EE4C000`, update v327680 or 2.0.1 (v655360).

## Three builds

Pokopia can be built three ways. Same game, same save; each has its own shared shader list.

| Build (`--engine`) | Engine | Takes | Build time |
|---|---|---|---|
| `pokopia-native` (default) | [azmasm/pokopia-native](https://github.com/azmasm/pokopia-native): xFractals' pokopia-native (MIT), kept as its last available version (3 November 2026) after its original repository was removed | update v327680 or 2.0.1 | about an hour: the ~3,800 shaders the game needs |
| `horizon-nx2` | [joaoalvess/horizon-nx2](https://github.com/joaoalvess/horizon-nx2) (MIT), an nxnative fork tuned on a fanless 16 GB MacBook Air M4 | 2.0.1 (v655360) only | hours: all of the game's shaders, and over 200 GB of disk while it builds |
| `nxnative` | upstream [nxnative](https://github.com/seedds/nxnative)'s Pokopia profile (commit in `game.json`) | 2.0.1 (v655360) only | hours: all ~131,000 shaders, and over 200 GB of disk while it builds ([#1174](https://github.com/seedds/nxnative/issues/1174)) |

`./hermit.py build` takes horizon-nx2's on a MacBook Air or a Mac with 16 GB or less when the dump is 2.0.1, and pokopia-native's otherwise; `--engine` builds another (the app has a Build menu for it). `./hermit.py builds pokemon-pokopia` shows all three and how each ran on players' Macs. Neither has been test-built in Hermit.

All three are built with Hermit's front end added (`tools/engine/patch.py`), so they play like the Mario Kart World port:

- **key 1**: the performance overlay in the top right (compact FPS and resolution → detailed graph, GPU, frame time, CPU, memory → off)
- **key 2**: the game's settings in the Mario Kart style; most apply at the next launch

The dump folder holds `base/exefs` and `updates/<version>/` (exefs, romfs), or `exefs/` and `romfs/` of the update directly; the base game alone is not enough.

**pokopia-native** is xFractals' builder (it fetches nxnative and applies its Switch 2 patch, then builds a Mac app). Its original repository and its author's GitHub account were removed in November 2026; Hermit builds it from [azmasm/pokopia-native](https://github.com/azmasm/pokopia-native), a copy of its last available version with all of xFractals' commits (gameplay captures left out). Hermit checked that its setup still runs and that the game host compiles with Hermit's front end; it has not built the whole game from that copy yet.

## Shared shader lists

[`shader_list.tsv`](shader_list.tsv) (pokopia-native), [`shader_list-horizon-nx2.tsv`](shader_list-horizon-nx2.tsv) and [`shader_list-nxnative.tsv`](shader_list-nxnative.tsv): each build's own list of shaders and pipelines players have met, for its engine version only (the first line says which). When you close the game, the app offers to send what it built (every 100 new rows), as described in the main README's Contributing section.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac, with the fps and memory where given, and whether it was fixed.

## Build

In the Hermit app: press **+ Build game**, choose your dump and press **Build**. In Terminal:

```bash
./hermit.py build "<your dump folder>"
```

Then `./hermit.py install`. `refresh` and `run` are for Mario Kart World only.

A dump copied over FTP must be copied in **binary** mode: a text-mode copy damages the code files, and the build stops saying they are cut short or damaged.
