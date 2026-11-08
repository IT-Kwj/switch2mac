# Ori and the Blind Forest: Definitive Edition

Title ID `010061D00DB74000`. A **Switch** game: built from your own copy's `.xci` / `.nsp` files with your own `prod.keys` (see [LEGAL.md](../../LEGAL.md)). Version 1.0.1.

Built with [MacNativeGames](https://github.com/ly05010419/MacNativeGames) by ly05010419 (MIT): its [`games/ori`](https://github.com/ly05010419/MacNativeGames/tree/9fe3fdc1d08ce5e1a64d120f257d79cc2dc7c0ca/games/ori) port, at the commit `game.json` names, run through that port's own builder as its README describes. Community port. The card image (.xci) that holds the 1.0.1 update, or a base game with the 1.0.1 update; your firmware for the system fonts. It has its own runtime, so switch2mac's overlay and key-2 settings are not added: the port has its own. Needs Homebrew's `python@3.14`, `opus` and `libvpx`.

## Build

In the switch2mac app: **+ Build game**, choose the game's file (or the folder with its base game and update), then your `prod.keys`. In Terminal:

```bash
./switch2mac.py build "<the game's .xci or .nsp, or its folder>" --keys <path of prod.keys>
```

Add `--firmware <your unpacked firmware dump>` (or `--shared-fonts <a Tears of the Kingdom build's fonts>`) when the port needs the Switch's system fonts (an `.nsp` carries none).

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac. Tell others how it ran with the [How it ran](https://github.com/azmasm/switch2mac/issues/new?template=how-it-ran.yml) form.
