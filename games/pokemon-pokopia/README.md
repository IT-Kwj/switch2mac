# Pokémon Pokopia

Title ID `0400A3A01EE4C000`, update v327680 or 2.0.1 (v655360). **pokopia-native reports it plays on its author's M4 Mac** past the first wake-up with no issues found.

## Three builds

Pokopia can be built three ways. Same game, same save; each has its own shared shader list.

| Build (`--engine`) | Engine | Takes | Build time |
|---|---|---|---|
| `pokopia-native` (default) | [pokopia-native](https://github.com/xFractals/pokopia-native) by xFractals | update v327680 or 2.0.1 | about an hour: the ~3,800 shaders the game needs |
| `nxnative` | upstream [nxnative](https://github.com/seedds/nxnative)'s Pokopia profile (commit in `game.json`) | 2.0.1 (v655360) only | hours: all ~131,000 shaders, and over 200 GB of disk while it builds ([#1174](https://github.com/seedds/nxnative/issues/1174)) |
| `horizon-nx2` | [joaoalvess/horizon-nx2](https://github.com/joaoalvess/horizon-nx2) (MIT), tuned on a fanless 16 GB MacBook Air M4 | 2.0.1 (v655360) only | as nxnative's |

`./switch2mac.py build` takes horizon-nx2's on a MacBook Air or a Mac with 16 GB or less when the dump is 2.0.1, and pokopia-native's otherwise; `--engine nxnative` builds the other (the app has a Build menu for it). `./switch2mac.py builds pokemon-pokopia` shows both and how each ran on players' Macs. Neither has been test-built in switch2mac.

## pokopia-native's build

Built with [pokopia-native](https://github.com/xFractals/pokopia-native) by xFractals (MIT) at the commit `game.json` names (fetched once into `./engines`; its setup fetches nxnative and applies its Switch 2 patch), with switch2mac's front end added (`tools/engine/patch.py`), so it plays like the Mario Kart World port:

- the game starts at once: no settings window first
- **key 1**: the performance overlay in the top right (compact FPS and resolution → detailed graph, GPU, frame time, CPU, memory → off)
- **key 2**: the settings the app's launch window offers, in the Mario Kart style; most apply at the next launch

| What | |
|---|---|
| Dump folder | `base/exefs` and `updates/<version>/` (exefs, romfs), or `exefs/` and `romfs/` of the update directly; the base game alone is not enough |
| Build time | about an hour the first time (3,800 shaders), a couple of minutes after (pokopia-native's figures) |
| Verified by pokopia-native | built and played on its author's M4 Mac up to after the first wake-up with no issues found, and on iPhone at 30 fps (the Switch 2 runs this game at 30 in handheld); screenshots matched Switch 2 footage scene for scene. It gives no frame rate for the Mac |
| Reported by players (Reddit, pokopia-native's release thread) | MacBook Air M3, 16 GB, 3440x1440: 30 fps, runs well. iPhone 16 Pro: crashed after character creation, likely out of memory |

## Shared shader list

[`shader_list.tsv`](shader_list.tsv): this game's own list of shaders and pipelines players have met, for this engine version only (its first line says which). pokopia-native ships no list of its own, so the app's list is this list's rows; the app prepares them before the first frame. It starts empty: when you close the game, the app offers to send what it built (every 100 new rows), as described in the main README's Contributing section.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac (from GitHub issues on this game's builder), with the fps and memory where given, and whether it was fixed.

## Build

In the switch2mac app: choose your dump folder on the **Builds** page and press **Build**. In Terminal:

```bash
./switch2mac.py build "<your dump folder>"
```

Then `./switch2mac.py install`. `refresh` and `run` are for Mario Kart World only.

A dump copied over FTP must be copied in **binary** mode: a text-mode copy damages the code files, and the build stops saying they are cut short or damaged.
