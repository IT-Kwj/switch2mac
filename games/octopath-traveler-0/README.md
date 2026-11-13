# Octopath Traveler 0

Title ID `01005270232F2000`. A **Switch** game: built from your own copy's `.xci` / `.nsp` files with your own `prod.keys` (see [LEGAL.md](../../LEGAL.md)). Version 1.0.3, 1.0.4 or 1.0.5.

Built with [MacNativeGames](https://github.com/ly05010419/MacNativeGames) by ly05010419 (MIT): its [`games/ot0`](https://github.com/ly05010419/MacNativeGames/tree/94f107e58498cfa608fdbf829f6b7cf8b1def01b/games/ot0) port, at the commit `game.json` names, run through that port's own builder as its README describes. Community port, work in progress. Base game card image (.xci; a trimmed image works) and update 1.0.3, 1.0.4 or 1.0.5 (required). Up to 120 fps (the Switch version holds 30). It has its own runtime, so Hermit's overlay and key-2 settings are not added: the port has its own. Needs Homebrew's `python@3.14`, `opus` and `libvpx`.

## Build

In the Hermit app: **+ Build game**, choose the game's file (or the folder with its base game and update), then your `prod.keys`. In Terminal:

```bash
./hermit.py build "<the game's .xci or .nsp, or its folder>" --keys <path of prod.keys>
```

Add `--firmware <your unpacked firmware dump>` (or `--shared-fonts <a Tears of the Kingdom build's fonts>`) when the port needs the Switch's system fonts (an `.nsp` carries none).

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac. Tell others how it ran with the [How it ran](https://github.com/azmasm/hermit/issues/new?template=how-it-ran.yml) form.
