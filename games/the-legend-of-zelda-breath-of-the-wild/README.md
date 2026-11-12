# The Legend of Zelda: Breath of the Wild

Title ID `01007EF00011E000`. A **Switch** game: built from your own copy's `.xci` / `.nsp` files with your own `prod.keys` (see [LEGAL.md](../../LEGAL.md)).

Two builds:

| Build | What it is |
|---|---|
| **MacNativeGames' runtime** (recommended) | [ly05010419/MacNativeGames](https://github.com/ly05010419/MacNativeGames) (MIT) at the commit `game.json` names: its own runtime and Metal renderer. Breath of the Wild 1.6.0 or 1.9.0, up to native 4K, on the same runtime as Tears of the Kingdom. Input: the base game with its 1.9.0 update .nsp (and DLC .nsp files, optional), or the 1.6.0 card image; plus the system fonts (--firmware or --shared-fonts). Needs Homebrew's `python@3.14`, `opus` and `libvpx`. Hermit's overlay and key-2 settings are not added to it: it has its own. |
| **nxnative's engine** | [upstream nxnative](https://github.com/seedds/nxnative)'s profile `dm/games/01007EF00011E000`, for version 1.9.0 (update v1114112), with Hermit's overlay and key-2 settings. |

## Build

In the Hermit app: **+ Build game**, choose the game's file (or the folder with its base game, update and DLC), then your `prod.keys`. In Terminal:

```bash
./hermit.py build "<the game's .xci or .nsp, or its folder>" --keys <path of prod.keys>
```

MacNativeGames builds from an `.nsp`, and always for Breath of the Wild, also need the Switch's system fonts: add `--firmware <your unpacked firmware dump>` or `--shared-fonts <the fonts an earlier Tears of the Kingdom build extracted>`.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): reports that name the Mac. Hermit has not test-built this game yet.
