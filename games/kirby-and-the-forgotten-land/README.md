# Kirby and the Forgotten Land

Title ID `01004D300C5AE000`. A **Switch** game: built from your own copy's `.xci` / `.nsp` files with your own `prod.keys` (see [LEGAL.md](../../LEGAL.md)). Version 1.0.0.

Built with [MacNativeGames](https://github.com/ly05010419/MacNativeGames) by ly05010419 (MIT): its [`games/kirby`](https://github.com/ly05010419/MacNativeGames/tree/df1e321d4a9304855f81de3c9a3d471c4c748af5/games/kirby) port, at the commit `game.json` names, run through that port's own builder as its README describes. Community port, early. Base game 1.0.0 (.nsp or .xci); an .nsp carries no system fonts, so add your firmware. It has its own runtime, so switch2mac's overlay and key-2 settings are not added: the port has its own. Needs Homebrew's `python@3.14`, `opus` and `libvpx`.

## Build

In the switch2mac app: **+ Build game**, choose the game's file (or the folder with its base game), then your `prod.keys`. In Terminal:

```bash
./switch2mac.py build "<the game's .xci or .nsp, or its folder>" --keys <path of prod.keys>
```

Add `--firmware <your unpacked firmware dump>` (or `--shared-fonts <a Tears of the Kingdom build's fonts>`) when the port needs the Switch's system fonts (an `.nsp` carries none).

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac. Tell others how it ran with the [How it ran](https://github.com/azmasm/switch2mac/issues/new?template=how-it-ran.yml) form.
