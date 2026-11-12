# SHIN MEGAMI TENSEI V: Vengeance

Title ID `010069C01AB82000`. A **Switch** game: built from your own copy's `.xci` / `.nsp` files with your own `prod.keys` (see [LEGAL.md](../../LEGAL.md)). Versions: 1.0.3.

Added automatically from [nxnative](https://github.com/seedds/nxnative)'s profile: see [its notes](https://github.com/seedds/nxnative/tree/2006d5ed8690d79ef4865a60917eb938cdb4c8dc/dm/games/010069C01AB82000) for how far it plays and on which Mac. Built with nxnative's builder at the commit `game.json` names, with Hermit's front end: the game starts at once, **key 1** is the performance overlay and **key 2** the settings.

## Shared shader list

[`shader_list.tsv`](shader_list.tsv): shaders and pipelines players have met. When you close the game, the app offers to send what it built.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac. Tell others how it ran with the [How it ran](https://github.com/azmasm/hermit/issues/new?template=how-it-ran.yml) form.

## Build

In the Hermit app: **+ Build game**, choose the game's file (or the folder with its base game, update and DLC), then your `prod.keys`. In Terminal:

```bash
./switch2mac.py build "<the game's .xci or .nsp, or its folder>" --keys <path of prod.keys>
```
