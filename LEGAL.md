# Legal

switch2mac is an independent fan project, made in good faith for people who own their games. This page says what it does and does not do. It is not legal advice.

## Games and keys

- This repository contains **no game content**: no game code, no game files, no shader code from a game, no keys, no Nintendo artwork. Everything game-specific in it is either written by hand (patches, settings) or a table of names, hashes and layout facts (the shader lists and run-time shader locations in `games/`; the game profiles live in the engines, such as switch2mac-engine's `dm/games/`).
- To build an app you need **your own dump** of a game you own, made from your own console. switch2mac itself decrypts nothing and contains no decryption code.
  - **Switch 2 games** need no keys: switch2mac reads an already extracted dump (folders, or a `.nup` file), as dump tools produce it.
  - **Switch games** come as their encrypted `.nsp` / `.xci` files. The builder you choose (nxnative's or MacNativeGames') opens them with **your own `prod.keys`, dumped from your own Switch**. switch2mac only passes the file's path to that builder while it builds: it keeps where the file is, never a copy or what is in it, never uploads it, and writes `<your prod.keys>` in place of its path in build logs, diagnostics, reports and shader lists. Settings → Forget my keys file drops even the path. Which game the files are is read from their names, as dump tools write them, not from their contents.
- No help with console exploits, getting keys, getting games or decryption is given here, and no keys or game files are ever accepted in issues: never attach or paste `prod.keys`.

## What you build

- What the build makes (the `.app`, `work/`, captured shaders, the RomFS image) holds the game's data. **It is for you alone: do not share it**, and do not attach game files, shader dumps or builds to issues.
- switch2mac adds no online service: it does not sign games in to Nintendo's servers or to any replacement for them.

## Artwork the app shows

The app shows each game's art from its owners, downloaded onto your Mac when it runs and kept there; none of it is in this repository or in the app download:

- the official **eShop banner** (from Nintendo's image server, listed by [titledb](https://github.com/blawar/titledb));
- a **box front** from [GameTDB](https://www.gametdb.com) (Switch games) or the [LaunchBox Games Database](https://gamesdb.launchbox-app.com) (Switch 2 and other games), community databases made for game launchers and front ends. Settings › Box art turns these off; the Library then cuts covers from the banners.

The game cases, cartridges and booklets around that art are switch2mac's own drawings: no console maker's logo is drawn by switch2mac. The interface sounds are switch2mac's own, made in code.

## What the app connects to

No account, no tracking, no analytics. The app connects only to:

| Where | Why |
|---|---|
| github.com (this repository, its releases and issues) | the game list, build updates, What's New, app updates; your **How it ran** reports and **shader lists**, only when you choose to send them, through your own GitHub account (public, and they name your Mac's model, chip, memory and macOS, never you or your files) |
| the engines' repositories on GitHub (nxnative and the others in [NOTICE.md](NOTICE.md)) | fetching the builder of the game you build |
| Nintendo's image server, titledb on GitHub | eShop banners |
| www.gametdb.com, art.gametdb.com, gamesdb.launchbox-app.com, images.launchbox-app.com | box fronts (each once, then kept on your Mac; LaunchBox's list of games about once a month) |

## Licences and credits

switch2mac is MIT licensed ([LICENSE](LICENSE)); the app began from NX2Apple (MIT, `app/LICENSE-NX2Apple`). Every other project it builds on, with its licence, is in [NOTICE.md](NOTICE.md). The engines are not copied here: each build fetches its engine from that engine's own repository, under that engine's licence. One tool of switch2mac-engine, `nx2_lower` (from Eglantine), is GPL-3.0-or-later; it runs while building and is not part of the apps it builds.

## Trademarks

Nintendo, Nintendo Switch, Nintendo Switch 2 and the names of the games are trademarks of Nintendo and their other owners (for example Pokémon: Nintendo, Creatures and GAME FREAK; Hyrule Warriors: Nintendo and Koei Tecmo). The banners and box fronts belong to their owners. This project is not affiliated with or endorsed by Nintendo or any of them.

## No warranty, and removal requests

switch2mac comes as it is, with no warranty (see [LICENSE](LICENSE)): keep a copy of your saves. If you hold rights to anything in this repository and want it changed or removed, open an issue or contact the maintainer through GitHub, and it will be dealt with promptly.
