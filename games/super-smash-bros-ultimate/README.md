# Super Smash Bros. Ultimate

Title ID `01006A800016E000`. A **Switch** game: built from your own copy's `.xci` / `.nsp` files with your own `prod.keys` (see [LEGAL.md](../../LEGAL.md)). Version 1.0.0 with update 13.0.2 or 13.0.5.

Built with [MacNativeGames](https://github.com/ly05010419/MacNativeGames) by ly05010419 (MIT): its [`games/ssbu`](https://github.com/ly05010419/MacNativeGames/tree/9e212f52f0271691bc126e6cc033bbed2904a498/games/ssbu) port, at the commit `game.json` names, run through that port's own builder as its README describes. Community port. Base game 1.0.0 (card image .xci; a base .nsp needs your firmware for the system fonts) and update 13.0.2 or 13.0.5 (required): the app runs the update's code. It has its own runtime, so switch2mac's overlay and key-2 settings are not added: the port has its own. Needs Homebrew's `python@3.14`, `opus` and `libvpx`.

## Build

In the switch2mac app: **+ Build game**, choose the game's file (or the folder with its base game and update), then your `prod.keys`. In Terminal:

```bash
./switch2mac.py build "<the game's .xci or .nsp, or its folder>" --keys <path of prod.keys>
```

Add `--firmware <your unpacked firmware dump>` (or `--shared-fonts <a Tears of the Kingdom build's fonts>`) when the port needs the Switch's system fonts (an `.nsp` carries none).

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac. Tell others how it ran with the [How it ran](https://github.com/azmasm/switch2mac/issues/new?template=how-it-ran.yml) form.
