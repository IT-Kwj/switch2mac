# Pokémon Pokopia

Title ID `0400A3A01EE4C000`, update v327680 or 2.0.1 (v655360). **Untested in switch2mac.**

Built with [pokopia-native](https://github.com/xFractals/pokopia-native) by xFractals (MIT) at the commit `game.json` names (fetched once into `./engines`; its setup fetches nxnative and applies its Switch 2 patch), with switch2mac's front end added (`tools/engine/patch.py`), so it plays like the Mario Kart World port:

- the game starts at once: no settings window first
- **key 1**: the performance overlay in the top right (compact FPS and resolution → detailed graph, GPU, frame time, CPU, memory → off)
- **key 2**: the settings the app's launch window offers, in the Mario Kart style; most apply at the next launch

| What | |
|---|---|
| Dump folder | `base/exefs` and `updates/<version>/` (exefs, romfs), or `exefs/` and `romfs/` of the update directly; the base game alone is not enough |
| Build time | about an hour the first time (3,800 shaders), a couple of minutes after (pokopia-native's figures) |
| pokopia-native's report | plays through the opening and the first area; it looks the same as on the Switch 2 |

## Shared shader list

[`shader_list.tsv`](shader_list.tsv): this game's own list of shaders and pipelines players have met, for this engine version only (its first line says which). pokopia-native ships no list of its own, so the app's list is this list's rows; the app prepares them before the first frame. It starts empty: when you close the game, the app offers to send what it built (every 100 new rows), as described in the main README's Contributing section.

## Build

```bash
./switch2mac.py build "<your dump folder>"
```

Then `./switch2mac.py install`. `refresh` and `run` are for Mario Kart World only.

A dump copied over FTP must be copied in **binary** mode: a text-mode copy damages the code files, and the build stops saying they are cut short or damaged.
