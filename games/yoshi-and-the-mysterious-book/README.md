# Yoshi and the Mysterious Book

Title ID `0400245021D2C000`, update v131072 (Ver. 1.0.2). **nxnative reports it plays at 60 fps on a 16 GB M6 Mac** through the first habitat, a save and a reload.

Built with [upstream nxnative](https://github.com/seedds/nxnative)'s own builder at the commit `game.json` names (fetched once into `./engines`), with Hermit's front end added (`tools/engine/patch.py`), so it plays like the Mario Kart World port:

- the game starts at once: no settings window first
- **key 1**: the performance overlay in the top right (compact FPS and resolution → detailed graph, GPU, frame time, CPU, memory → off)
- **key 2**: the settings nxnative's own launch window offers for this game, in the Mario Kart style; most apply at the next launch

| What | |
|---|---|
| Profile and notes | [nxnative `dm/games/0400245021D2C000`](https://github.com/seedds/nxnative/tree/95f9a6a929ede91ab35177987aa8fa15a7dfa031/dm/games/0400245021D2C000) |
| Engine | Unreal Engine 5.4.4, NVN2 |
| Dump folder | `base/` (exefs, romfs) and `updates/131072/` (exefs, romfs: the whole RomFS, 20 GB). nxnative tested a NUP of the same files; Hermit builds from a dump folder |
| Shaders | about 133,000 in the game. nxnative's runs built only the ones its playtests asked for; a build of all of them can take many hours |
| Verified by nxnative | on an M6 Mac with 16 GB: the first habitat at 60 fps (frame time p50 16.7 ms, p95 17.1 ms), about 5.6 GB in memory. Later chapters are not measured; Nanite's visibility shaders are left out (the first chapter does not ask for them) |

## Shared shader list

[`shader_list.tsv`](shader_list.tsv): this game's own list of shaders and pipelines players have met, for this engine version only (its first line says which). It starts empty: when you close the game, the app offers to send what it built (every 100 new rows), as described in the main README's Contributing section.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac.

## Build

In the Hermit app: choose your dump folder on the **Builds** page and press **Build**. In Terminal:

```bash
./hermit.py build "<your dump folder>"
```

Then `./hermit.py install`. `refresh` and `run` are for Mario Kart World only.
