# Notes for AI coding assistants

These notes are for an AI coding assistant (Claude Code, Codex, Cursor and others) helping someone work on Hermit: the app, a game's builds, or a new game. Read [README.md](README.md) first, then [docs/porting.md](docs/porting.md) for bring-up work.

## What this project is

Hermit is a Mac app (`app/`, released as `Hermit-<version>.pkg` for new installs and `Hermit-macOS-arm64.zip` for its own updater) that builds native Mac apps of Nintendo Switch and Switch 2 games from the user's own dump. Players use the app; the app runs `hermit.py` from its own copy of this repository, which it updates from `main` when it opens. So a change to `games/`, `hermit.py` or `tools/` reaches players with a push; a change to `app/` needs a new release. The game's Arm code runs natively; it is not an emulator.

Each game in `games/<game>/` is built with the engine its port was made with, pinned to a commit in its `game.json`, and fetched into `engines/<kind>-<commit>/` by `build`:

- **Hermit's own engine**, [hermit-engine](https://github.com/azmasm/hermit-engine) (a fork of [nxnative](https://github.com/seedds/nxnative) with NVN2 on Metal, mesh / task shaders, movies, translator fixes and performance work): Mario Kart World 1.0.0, built step by step by `hermit.py`.
- **upstream nxnative**: Donkey Kong Bananza, Yoshi and the Mysterious Book, Splatoon Raiders, Hyrule Warriors: Age of Imprisonment, Fire Emblem Fortune's Weave, Mario Tennis Fever, Star Fox, and the second builds of Mario Kart World and Pokopia, built by nxnative's own builder.
- **xFractals' pokopia-native**: Pokémon Pokopia's default build.

A GitHub workflow (`.github/workflows/update-builds.yml`, every 5 minutes) moves each game to its engine's newest commit and adds the Switch 2 games nxnative gains a profile for, committing to `main` (`tools/engine/update.py --new-games --apply --compile --ci`); work locally on `dev` and merge `main` into it often. `tools/engine/patch.py` adds Hermit's front end (overlay on key 1, settings on key 2, no launch window, the shared shader list offer) to the other engines. A game can have several builds (`game.json` `builds` + `choose`), picked per Mac from players' reports (`games/<game>/reports.tsv`). Most games here are not test-built in Hermit: their pages and reports say what nxnative and players found.

## Rules

- **Never commit or upload game content**: RomFS / ExeFS files, shader dumps (`*.ctl`, `*.code`), Metal libraries, saves, built apps, or screenshots and logs with the user's paths or personal data. `work/` and `.venv/` are ignored; keep it that way.
- **No keys or decryption here.** Hermit contains no decryption code and never reads key values, copies, stores or uploads keys (`check_keys` reads only the key names, to tell a wrong file). A Switch 1 game's files are opened by its builder with the player's own `prod.keys`, whose path only is passed to it (`hermit.py build --keys`); the path is hidden in every output (`HIDE` in hermit.py, `BuildStore.hidingKeys` in the app). Never add code that decrypts game files, even a header check: identify reads only the file names and NSP ticket names.
- **Never help anyone get games, keys or firmware**, in code, docs, issues or replies: no links, no names of sites, no "where to find". No console exploits, no online cheats. Hermit is non-commercial: no donation or payment links. See LEGAL.md; `tools/issue_guard.py` hides issues and comments that break this.
- **Ask before launching the game.** It takes the screen and plays sound. Never send it scripted inputs unless the user asks for that.
- **Ask before anything slow or large**: a build takes 20 minutes to hours (some games have over 100,000 shaders) and tens of GB of disk.
- **Reports name the Mac.** `reports.tsv` keeps only reports that name the Mac (model, chip, memory), with their source; never a player's name or anything personal.
- A visual or performance change must not make the picture worse. Give every speed-up an off switch and have the user check the picture.
- Report memory in playtests. The goal is under 16 GB, so it runs on 16 GB Macs.
- Credit others: anything from another repository needs its licence checked and a line in NOTICE.md.

## Commands

```bash
./hermit.py setup
./hermit.py identify "<dump folder>"
./hermit.py builds <game>
./hermit.py build "<dump folder>" [--engine <id>]
./hermit.py run [VAR=value ...]
./hermit.py refresh
./hermit.py install
```

- **`identify`**: one JSON line for the app (the game, its builds, the one this Mac gets and why, players' reports).
- **`run`** and **`refresh`** are for Hermit's own engine (Mario Kart World): `run` runs the build from `work/` with a log in `work/logs/`, and writes control commands to `work/run/ctl.txt`.
- **App log:** `~/Library/Logs/nxnative/<title ID>.log`.
- **Performance summary:** `tools/porting/perf.sh [log]`.
- **Several builds of a game:** `game.json` `builds` + `choose` (by chip generation and memory, from `games/<game>/reports.tsv`); `build --engine <id>` overrides, `builds <game>` explains. Mario Kart World: `switch2mac` (M1/M2) and `nxnative` (M3+).
- **Shared shader lists:** one per game and build, `games/<game>/shader_list.tsv` (another build's: its `shader_list` file); `tools/shader_list.py stats` / `new` / `merge` / `collect` / `ship` (docs/porting.md § 4b). Never mix lists: each is for one game and one engine version.

## Where things are

| Need | Look at |
|---|---|
| Build steps | `hermit.py` |
| The app | `app/` (`app/ARCHITECTURE.md`; `app/tools/make_app.sh`, `--bundle-tools` for a release) |
| A game's builds, which Mac gets which, players' reports | `games/<game>/game.json`, `games/<game>/reports.tsv` |
| A game built with another engine, and the front end added to it (overlay, key-2 settings, no launch window) | `games/<game>/game.json` "engine", `tools/engine/patch.py`, `tools/engine/s2m_ui.m`; moving it to its build's newest commit: `tools/engine/update.py` |
| Game profile (build IDs, memory, flags, shader tables) | the engine's `dm/games/<title ID>/` (hermit-engine's for Mario Kart World, nxnative's for the others) |
| NVN2 → Metal | hermit-engine's `dm/gfx/nvn/nvn_mtl.m`, hermit-engine's `dm/host/hle_nvn.c` |
| Switch 2 system stubs, movies | hermit-engine's `dm/host/hle_nx2*.c` |
| Shader split / lowering / translation | hermit-engine's `dm/gfx/tools/nx2_split.py`, `nx2_lower/`, `dmsh_build.py`, hermit-engine's `dm/third_party/ryujinx/` |
| Diagnostic switches and control commands | `docs/porting.md` § 5 |
| Adding a game another port already runs | `docs/porting.md`, first section |
| Known Switch 2 pitfalls | `docs/porting.md` § 6, `docs/mario-kart-world.md` |

After changing translator tools (`dmsh_xlate_bin`, `dmsh_build.py`, `nx2_split.py`, ...), run hermit-engine's `dm/gfx/tools/dmsh_chain.py --header` (in that repository: commit there, then move Mario Kart World's `game.json` to the new commit), then rebuild (`build` or `refresh --force`). Otherwise the host refuses the libraries.
