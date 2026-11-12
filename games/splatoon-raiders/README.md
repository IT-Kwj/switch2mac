# Splatoon Raiders

Title ID `0400380020056000`, update v65536. **nxnative reports it plays on an M4 Pro** (the opening, character creation, the first level's beach, inking and the first Salmonids, at 60 fps).

Built with [upstream nxnative](https://github.com/seedds/nxnative)'s own builder at the commit `game.json` names (fetched once into `./engines`), with Hermit's front end added (`tools/engine/patch.py`), so it plays like the Mario Kart World port:

- the game starts at once: no settings window first
- **key 1**: the performance overlay in the top right (compact FPS and resolution → detailed graph, GPU, frame time, CPU, memory → off)
- **key 2**: the settings nxnative's own launch window offers for this game, in the Mario Kart style; most apply at the next launch

| What | |
|---|---|
| Profile and notes | [nxnative `dm/games/0400380020056000`](https://github.com/seedds/nxnative/tree/a2514d7def4e35f3c47f8792af9e6ad31c90ace9/dm/games/0400380020056000) |
| Dump folder | `base/` and `updates/65536/` (the update RomFS is 13 GB) |
| Shaders | about 27,000 |
| Verified by nxnative | on an M4 Pro: about 4.5 minutes in the last session with no crash; median frame 16.6-16.9 ms (60 fps), about 15 ms of GPU on the beach |
| Known | 16 GB Macs: memory grows past 14 GB and macOS starts swapping, down to about 1 fps (open, seedds/nxnative#1281). Turn MetalFX upscaling off if colours look washed out |

## Shared shader list

[`shader_list.tsv`](shader_list.tsv): this game's own list of shaders and pipelines players have met, for this engine version only (its first line says which). It starts empty: when you close the game, the app offers to send what it built (every 100 new rows), as described in the main README's Contributing section.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac (nxnative's own playtests and GitHub issues), with the fps and memory where given, and whether it was fixed. Hermit has not test-built this game: what is known comes from these reports.

## Build

In the Hermit app: choose your dump folder on the **Builds** page and press **Build**. In Terminal:

```bash
./hermit.py build "<your dump folder>"
```

Then `./hermit.py install`. `refresh` and `run` are for Mario Kart World only.
