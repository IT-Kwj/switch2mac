# The Legend of Zelda: Tears of the Kingdom

Title ID `0100F2C0115B6000`. A **Switch** game: built from your own copy's `.xci` / `.nsp` files with your own `prod.keys` (see [LEGAL.md](../../LEGAL.md)).

Two builds:

| Build | What it is |
|---|---|
| **MacNativeGames' runtime** (recommended) | [ly05010419/MacNativeGames](https://github.com/ly05010419/MacNativeGames) (MIT) at the commit `game.json` names: its own runtime and Metal renderer. Tears of the Kingdom 1.0.0, 1.2.1 or 1.4.3 (1.4.3 recommended), up to native 4K (5K on Macs with 32 GB or more): its main game, the most polished port there. Input: base game 1.0.0 (.xci or .nsp) and, optionally, one update .nsp/.nsz (1.2.1 or 1.4.3). Needs Homebrew's `python@3.14`, `opus` and `libvpx`. switch2mac's overlay and key-2 settings are not added to it: it has its own. |
| **nxnative's engine** | [upstream nxnative](https://github.com/seedds/nxnative)'s profile `dm/games/0100F2C0115B6000`, for version 1.4.3 (update v720896), with switch2mac's overlay and key-2 settings. |

## Build

In the switch2mac app: **+ Build game**, choose the game's file (or the folder with its base game, update and DLC), then your `prod.keys`. In Terminal:

```bash
./switch2mac.py build "<the game's .xci or .nsp, or its folder>" --keys <path of prod.keys>
```

MacNativeGames builds from an `.nsp`, and always for Breath of the Wild, also need the Switch's system fonts: add `--firmware <your unpacked firmware dump>` or `--shared-fonts <the fonts an earlier Tears of the Kingdom build extracted>`.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): reports that name the Mac. switch2mac has not test-built this game yet.
