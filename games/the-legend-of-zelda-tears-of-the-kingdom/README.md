# The Legend of Zelda: Tears of the Kingdom

Title ID `0100F2C0115B6000`. A **Switch** game: built from your own copy's `.xci` / `.nsp` files with your own `prod.keys` (see [LEGAL.md](../../LEGAL.md)).

Two builds:

| Build | What it is |
|---|---|
| **MacNativeGames' runtime** (recommended) | [ly05010419/MacNativeGames](https://github.com/ly05010419/MacNativeGames) (MIT) at the commit `game.json` names: its own runtime and Metal renderer. Tears of the Kingdom 1.0.0, 1.2.1 or 1.4.3 (1.4.3 recommended), up to native 4K (5K on Macs with 32 GB or more): its main game, the most polished port there. Input: base game 1.0.0 (.xci or .nsp) and, optionally, one update .nsp/.nsz (1.2.1 or 1.4.3). Needs Homebrew's `python@3.14`, `opus` and `libvpx`. Hermit's overlay and key-2 settings are not added to it: it has its own. |
| **nxnative** | [upstream nxnative](https://github.com/seedds/nxnative)'s profile `dm/games/0100F2C0115B6000`, for version 1.4.3 (update v720896), with Hermit's overlay and key-2 settings. |

## Build

In the Hermit app: **+ Build game**, choose the game's file (or the folder with its base game, update and DLC), then your `prod.keys`. In Terminal:

```bash
./switch2mac.py build "<the game's .xci or .nsp, or its folder>" --keys <path of prod.keys>
```

MacNativeGames builds from an `.nsp`, and always for Breath of the Wild, also need the Switch's system fonts: add `--firmware <your unpacked firmware dump>` or `--shared-fonts <the fonts an earlier Tears of the Kingdom build extracted>`.

## Hermit's fix for MacNativeGames' build

**Version 1.0.0: loading a save near some areas no longer crashes** (Zora's Domain and others; MacNativeGames issues [#1742](https://github.com/ly05010419/MacNativeGames/issues/1742) and [#1792](https://github.com/ly05010419/MacNativeGames/issues/1792)). The game keeps its merged area scenery in a 32 KB memory block of its own; with some saves it fills up, a request comes back empty and the game crashes (`main+0x855560`). Hermit makes that block 64 KB after MacNativeGames' builder has made the app: one instruction (`main+0xec1f78`, the fix lili2029 found and tested on #1742) and the app's check of its code. It is `fixes` in [`game.json`](game.json), done by `switch2mac.py` (`mng_fixes`) on every build, whatever MacNativeGames commit the build uses:

- applied only to 1.0.0 (main's build ID) and only where the original instruction is found;
- once MacNativeGames makes the block bigger itself, Hermit sees it and adds nothing;
- if MacNativeGames' code moves so the instruction is no longer found, the build goes on unchanged and its log says so.

Played on an M1 Max with a save that crashed every time before: it loads and plays.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): reports that name the Mac. Hermit has not test-built this game yet.
