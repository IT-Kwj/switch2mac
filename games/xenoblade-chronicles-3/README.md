# Xenoblade Chronicles 3

Title ID `010074F013262000`. A **Switch** game: built from your own copy's `.xci` / `.nsp` files with your own `prod.keys` (see [LEGAL.md](../../LEGAL.md)). Versions: 2.2.1.

Added automatically from [nxnative](https://github.com/seedds/nxnative)'s profile: see [its notes](https://github.com/seedds/nxnative/tree/6a16b7d3c52d40e8dd6c9d927da92fb943309609/dm/games/010074F013262000) for how far it plays and on which Mac. Built with nxnative's builder at the commit `game.json` names, with Hermit's front end: the game starts at once, **key 1** is the performance overlay and **key 2** the settings.

## MacNativeGames' build

A second build: [MacNativeGames](https://github.com/ly05010419/MacNativeGames)' Xenoblade Chronicles 3 port (`games/xc3`, community, playable; MIT), its own runtime and a settings window (screen, window size, MetalFX, frame rate overlay). In its own tests the base game and the four Expansion Pass add-ons start, play and save, and a 2.5-hour session showed no glitches (Apple M5, 32 GB); it runs at 30 fps, as on the Switch. Neither story has been played to the end. Pick it with **Build with…** in the app, or `--engine macnativegames`.

- Plays the base game **1.0.0 as an NSP** alone, or with update **2.2.1** and your own Expansion Pass add-ons. Needs your Switch's **firmware** for the system fonts.
- Hermit runs the steps of its README in order: the code, its rewrite for Apple silicon, the game's data (and add-ons), the fonts, the runtime and the game's shaders, then the app (a self-contained app; saves in `~/Library/Application Support/MacNativeGames/XC3`). Not built through Hermit yet: tell us how it goes.

## Shared shader list

[`shader_list.tsv`](shader_list.tsv): shaders and pipelines players have met. When you close the game, the app offers to send what it built.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac. Tell others how it ran with the [How it ran](https://github.com/azmasm/hermit/issues/new?template=how-it-ran.yml) form.

## Build

In the Hermit app: **+ Build game**, choose the game's file (or the folder with its base game, update and DLC), then your `prod.keys`. In Terminal:

```bash
./switch2mac.py build "<the game's .xci or .nsp, or its folder>" --keys <path of prod.keys>
```
