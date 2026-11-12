# Legal

Hermit is an independent, non-commercial fan project, made in good faith for people who own their games. This page says what it does and does not do. It is not legal advice.

## What it is for

Hermit exists so that you can play **games you bought, from your own console, on your own Mac**: it turns your own copy into a Mac app that runs on your own computer. That is interoperability (making software you own work on another computer), the kind of use courts have recognised, for example in *Sega v. Accolade* (1992) and *Sony v. Connectix* (2000). Hermit does not copy, sell, share or hand out any game, and it takes no money: no donations, no paid features, no ads.

## Games and keys

- This repository contains **no game content**: no game code, no game files, no shader code from a game, no keys, no Nintendo artwork. Everything game-specific in it is either written by hand (patches, settings) or a table of names, hashes and layout facts (the shader lists and run-time shader locations in `games/`; the game profiles live in the engines, such as hermit-engine's `dm/games/`).
- To build an app you need **your own dump** of a game you own, made from your own console. Hermit itself decrypts nothing and contains no decryption code.
  - **Switch 2 games** need no keys: Hermit reads an already extracted dump (folders, or a `.nup` file), as dump tools produce it.
  - **Switch games** come as their encrypted `.nsp` / `.xci` files. The builder you choose (nxnative's or MacNativeGames') opens them with **your own `prod.keys`, dumped from your own Switch**. Hermit only passes the file's path to that builder while it builds: it keeps where the file is, never a copy or what is in it, never uploads it, and writes `<your prod.keys>` in place of its path in build logs, diagnostics, reports and shader lists. Settings → Forget my keys file drops even the path. Which game the files are is read from their names, as dump tools write them, not from their contents.
- To show which game a file is and whether it carries an update or DLC, Hermit reads only what is stored unencrypted: the file's name, the plain table of contents inside an `.nsp`, card image or `.nup` (file names, ticket names, which carry title IDs), and a list of game names and title IDs (`games/titles.tsv`). The game itself stays encrypted and unread.
- Hermit never obtains, bundles, downloads, shares or checks the contents of keys: it only reads the key *names* in the file you choose, to tell you if it is the wrong file. It never contains or downloads firmware, system files or game files either.
- **What is never helped with here:** console exploits or hacking a console, getting or sharing keys or firmware, getting or sharing games (no links, no "where to find"), cheating in online play, or anything that takes away from what you can do with your own copy. Issues and comments that contain keys, game files or links to sites that hand out games are hidden automatically and removed (`.github/workflows/issue-guard.yml`). Never attach or paste `prod.keys`.

## What you build

- What the build makes (the `.app`, `work/`, captured shaders, the RomFS image) holds the game's data. **It is for you alone: do not share it**, and do not attach game files, shader dumps or builds to issues.
- Hermit adds no online service: it does not sign games in to Nintendo's servers or to any replacement for them.

## Artwork the app shows

The app shows each game's art from its owners, downloaded onto your Mac when it runs and kept there; none of it is in this repository or in the app download:

- the official **eShop banner** (from Nintendo's image server, listed by [titledb](https://github.com/blawar/titledb));
- the game's **eShop description** and details (publisher, release date, players, genre, age rating), from the same list: the pages of the booklet in an open game case;
- a **box front** from [GameTDB](https://www.gametdb.com) (Switch games) or the [LaunchBox Games Database](https://gamesdb.launchbox-app.com) (Switch 2 and other games), community databases made for game launchers and front ends. Settings › Box art turns these off; the Library then cuts covers from the banners.

The game cases, cartridges and booklets around that art and text are Hermit's own drawings: no console maker's logo is drawn by Hermit. The interface sounds are Hermit's own, made in code.

## What the app connects to

No account, no tracking, no analytics. The app connects only to:

| Where | Why |
|---|---|
| github.com (this repository, its releases and issues) | the game list, build updates, What's New, app updates; your **How it ran** reports and **shader lists**, only when you choose to send them, through your own GitHub account (public, and they name your Mac's model, chip, memory and macOS, never you or your files) |
| the engines' repositories on GitHub (nxnative and the others in [NOTICE.md](NOTICE.md)) | fetching the builder of the game you build |
| Nintendo's image server, titledb on GitHub | eShop banners, and the text of each game's booklet |
| www.gametdb.com, art.gametdb.com, gamesdb.launchbox-app.com, images.launchbox-app.com | box fronts (each once, then kept on your Mac; LaunchBox's list of games about once a month) |

## Licences and credits

Hermit is MIT licensed ([LICENSE](LICENSE)); the app began from NX2Apple (MIT, `app/LICENSE-NX2Apple`). The app carries these licences, the font's (OFL) and NOTICE.md inside it (`Contents/Resources/licenses`), with the licences of the tools it bundles. Every other project it builds on, with its licence, is in [NOTICE.md](NOTICE.md). The engines are not copied here: each build fetches its engine from that engine's own repository, under that engine's licence. One tool of hermit-engine, `nx2_lower` (from Eglantine), is GPL-3.0-or-later; it runs while building and is not part of the apps it builds.

## Trademarks

Nintendo, Nintendo Switch, Nintendo Switch 2 and the names of the games are trademarks of Nintendo and their other owners (for example Pokémon: Nintendo, Creatures and GAME FREAK; Hyrule Warriors: Nintendo and Koei Tecmo). The banners and box fronts belong to their owners. This project is not affiliated with or endorsed by Nintendo or any of them.

## No warranty, and removal requests

Hermit comes as it is, with no warranty (see [LICENSE](LICENSE)): keep a copy of your saves. If you hold rights to anything in this repository and want it changed or removed, open an issue or contact the maintainer through GitHub (or send GitHub a notice through its [DMCA process](https://docs.github.com/en/site-policy/content-removal-policies/dmca-takedown-policy)), and it will be dealt with promptly and in good faith.
