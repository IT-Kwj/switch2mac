# Changelog

## 2026-11-05 (4)

- **Try any Switch 2 game on any engine.** Every game can be built on each engine switch2mac knows (switch2mac's, nxnative's, pokopia-native's) as an **untested** build, and so can Switch 2 games switch2mac has no page for yet. Each engine guesses a starting profile from the game's own files. Untested builds will often fail: they're for trying, and for anyone who wants to take a game further in a port of their own.
- The performance overlay now shows which engine the game was built with, next to the frame rate (the detailed view shows its version too). It appears after your next build of a game.
- A damaged dump now stops the build at its first step and says how to fix it.
- App fixes, coming in the next app release: a game you build shows in the Library straight away; the Build menu starts on the build recommended for your Mac; untested builds ask before you pick them.
- A new report for Mario Kart World on nxnative's build (M1 Max, 64 GB). Pokopia's pokopia-native build moved to its newest version.

## 2026-11-05 (3)

- The README now starts with the app: download it, open it, choose your dump folder, press Build. `Build a Game.command` is gone; the Terminal commands are still there.
- New **How it ran** form on the Issues page: tell others how a game runs on your Mac. Each game's reports and the build your Mac gets come from these.
- Builds moved to their newest upstream versions: Donkey Kong Bananza (the white Donkey Kong fix), Mario Kart World's nxnative build (fewer stray bright dots), Yoshi and the Mysterious Book (395 more shaders), Pokopia's pokopia-native build, and Mario Kart World's own engine.
- Switching a game between its builds keeps what each build learned, so switching back doesn't bring back first-play stutter.
- App bug fixes, coming in the next app release.
- Docs updated for nine games and three engines.

## 2026-11-05 (2)

- Five more Switch 2 games, built with nxnative: **Yoshi and the Mysterious Book**, **Splatoon Raiders**, **Hyrule Warriors: Age of Imprisonment**, **Fire Emblem Fortune's Weave** and **Mario Tennis Fever**. Like Donkey Kong Bananza, they start straight into the game, with the performance overlay on key 1 and the settings on key 2. None has been test-built in switch2mac yet: each game's page says what nxnative and players report. Thanks to seedds and nxnative's contributors.
- **Pokémon Pokopia now has two builds**: xFractals' pokopia-native (the default, about an hour to build) and nxnative's (2.0.1 only; it builds all ~131,000 shaders, which takes hours and over 200 GB of disk).
- Every game now has a **reports table** (`reports.tsv`): how it ran on players' Macs, from GitHub issues and nxnative's notes, with fixes noted. Mario Kart World's adds nxnative's build on 16 GB Macs (60 fps on an M6, 36–40 on an M1 Pro) and update 1.8.0 on 24 GB Macs.
- The switch2mac app no longer contains the prod.keys and cheats code it inherited from NX2Apple; switch2mac never used either.

## 2026-11-05

- New: the **switch2mac app** (preview). Choose your dump folder, press Build, and the game lands in Applications, with a library of your built games and their eShop banners (downloaded onto your Mac, never stored here). It shows your Mac's chip, memory and macOS. Download it from [Releases](https://github.com/azmasm/switch2mac/releases/latest) (version 0.1.0; the README says how to open it the first time). Its design comes from NX2Apple (MIT), with thanks to LNPANDY and its contributors.
- **Mario Kart World now has two builds**: switch2mac's engine, and nxnative's (with switch2mac's overlay and key-2 settings). Macs with less than 24 GB of memory, and M3 or newer Macs, get nxnative's build; M1 and M2 Macs with 24 GB or more get switch2mac's. `./switch2mac.py builds mario-kart-world` shows which one your Mac gets and why, and `--engine` builds the other. In the app, a Build card shows the same, and Manage → "Build with …" switches. Your save is kept when you switch.
- How each build ran on players' Macs is now kept in `games/mario-kart-world/reports.tsv`, and the choice above is based on it.
- Each build has its own shared shader list. The two engines name shaders differently, so their lists can't be mixed.

## 2026-11-04 (3)

- Mario Kart World's engine now lives in its own repository, [switch2mac-engine](https://github.com/azmasm/switch2mac-engine) (a fork of nxnative). switch2mac fetches it when building, the same way it fetches the other games' engines. Engine bugs and fixes go there; everything else stays here.

## 2026-11-04 (2)

- New: **Build a Game.command**. Double-click it, drag your dump folder in, and the game ends up in Applications. A Quick start at the top of the README walks through it.
- Clearer setup: anything missing is named with its fix, a new enough Python is found automatically, and the build checks free disk space first.
- Mario Kart World: a warning that 16 GB Macs may not run it smoothly yet (work on memory is under way), and 477 more shared shaders from the first player submission.
- Donkey Kong Bananza and Pokopia: statuses now say what their builders and players have verified.
- Sending a shader list is simpler: a shorter form, a shorter Send dialog with a ? button, and an "Is sending safe?" section.

## 2026-11-04

- Two more games: **Donkey Kong Bananza** (built with nxnative's build) and **Pokémon Pokopia** (built with xFractals' pokopia-native). Like Mario Kart World, they start straight into the game, with the performance overlay on key 1 and their settings on key 2. Not yet tested in switch2mac. Thanks to seedds (nxnative) and xFractals (pokopia-native).
- Shared shader lists for every game, each kept to its own game and build. When you close a game, the app offers to send the shaders and pipelines it built through a GitHub form; the game never uploads anything by itself. Idea and approach from MacNativeGames.
- Donkey Kong Bananza and Pokopia follow their builds' updates.
- Tidier repository: one README for every game, and each game's page has its own build steps.

## 2026-11-03 (3)

- Handheld console mode: the 3D scene no longer stays black in races. Four run-time shaders that only handheld mode uses are now taken from the dump, plus 13 more shared pipelines. On an M1 Pro, handheld mode runs races at a locked 60 fps. Thanks to lecjaksdav-ship-it ([#1](https://github.com/azmasm/switch2mac/pull/1)).

## 2026-11-03 (2)

- Builds now work on every macOS 26 version: the app is built for the macOS of the Mac that builds it, instead of nxnative's fixed 26.6 minimum. Thanks to lessy2020 on Reddit for finding and testing this on macOS 26.5.
- `setup` checks the macOS version (macOS 26 or later is needed for Metal 4).

## 2026-11-03

- README: the requirements now say **macOS 26.6 or later**. Apps built with switch2mac do not open on older versions (reported on macOS 26.5.1).

## 2026-11-02: first release

- Native Mac builds of Switch 2 games, built on nxnative. First game: Mario Kart World 1.0.0 (~58 fps in races on an M1 Max).
- Complete first launch: run-time shaders taken from your dump.
- Shared pipeline list: a one-time preparing screen instead of stutter in recorded places (idea from MacNativeGames).
- Porting guide (docs/porting.md) and notes for AI coding assistants (AGENTS.md).
