# Super Mario Odyssey

Title ID `0100000000010000`. A **Switch** game: built from your own copy's `.xci` / `.nsp` files with your own `prod.keys` (see [LEGAL.md](../../LEGAL.md)). Versions: 1.4.1.

Added automatically from [nxnative](https://github.com/seedds/nxnative)'s profile: see [its notes](https://github.com/seedds/nxnative/tree/a2514d7def4e35f3c47f8792af9e6ad31c90ace9/dm/games/0100000000010000) for how far it plays and on which Mac. Built with nxnative's builder at the commit `game.json` names, with Hermit's front end: the game starts at once, **key 1** is the performance overlay and **key 2** the settings.

## MacNativeGames' build

A second build: [MacNativeGames](https://github.com/ly05010419/MacNativeGames)' Odyssey port (`games/odyssey`, community, early; MIT), its own runtime with the Tears of the Kingdom settings panel (key 1: FPS graph, render size, MetalFX). In its own tests: 60 fps in the Wooded Kingdom with the 3D scene at 2560x1440 on an M1 Max; Cap, Bonneton and Wooded Kingdoms played, later kingdoms not yet. Pick it with **Build with…** in the app, or `--engine macnativegames`.

- Plays the base game with update **1.3.0 or 1.4.1**: a card image or NSP holding both, or the base NSP and the update NSP. Needs your Switch's **firmware** for the system fonts (not every card carries them).
- **The app ends a session after 20 minutes on purpose**: longer runs of its renderer once crashed macOS's graphics driver, and longer sessions have not been checked again. `session-minutes.txt` in **Odyssey Data** (next to the app, where its saves, shader cache and log go) changes it, at your own risk.
- Hermit runs its one-command builder (`scripts/build_odyssey.py`) with its Python packages in the game's build folder. Not built through Hermit yet: tell us how it goes.

## Shared shader list

[`shader_list.tsv`](shader_list.tsv): shaders and pipelines players have met. When you close the game, the app offers to send what it built.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac. Tell others how it ran with the [How it ran](https://github.com/azmasm/hermit/issues/new?template=how-it-ran.yml) form.

## Build

In the Hermit app: **+ Build game**, choose the game's file (or the folder with its base game, update and DLC), then your `prod.keys`. In Terminal:

```bash
./hermit.py build "<the game's .xci or .nsp, or its folder>" --keys <path of prod.keys>
```
