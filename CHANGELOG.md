# Changelog

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
