# Notes for AI coding assistants

These notes are for an AI coding assistant (Claude Code, Codex, Cursor and others) helping someone build or port a game with switch2mac. Read [README.md](README.md) first, then [docs/porting.md](docs/porting.md) for bring-up work.

## What this project is

switch2mac builds native Mac apps of Nintendo Switch 2 games from the user's own dump. It is built on [nxnative](https://github.com/seedds/nxnative) (in `engines/switch2mac/`) plus Switch 2 work done here: NVN2 on Metal, mesh / task shaders, movies, shader translator fixes and performance work. The game's ARM64 code runs natively; it is not an emulator. Mario Kart World 1.0.0 is the first supported game (`games/mario-kart-world/`), on switch2mac's own engine. Donkey Kong Bananza and Pokémon Pokopia are built with another engine each (upstream nxnative, xFractals' pokopia-native), named with its commit in their `game.json`; `build` fetches it into `engines/` and adds switch2mac's front end with `tools/engine/patch.py`.

## Rules

- **Never commit or upload game content**: RomFS / ExeFS files, shader dumps (`*.ctl`, `*.code`), Metal libraries, saves, built apps, or screenshots and logs with the user's paths or personal data. `work/` and `.venv/` are ignored; keep it that way.
- **Ask before launching the game.** It takes the screen and plays sound. Never send it scripted inputs unless the user asks for that.
- **Ask before anything slow or large**: the shader step takes 10-20 minutes on all cores, and the game image is 22 GB.
- A visual or performance change must not make the picture worse. Give every speed-up an off switch and have the user check the picture.
- Report memory in playtests. The goal is under 16 GB, so it runs on 16 GB Macs.

## Commands

```bash
./switch2mac.py setup
./switch2mac.py build "<dump folder>"
./switch2mac.py run [VAR=value ...]
./switch2mac.py refresh
./switch2mac.py install
```

- **`run`**: runs the build from `work/` with a log in `work/logs/`, and writes control commands to `work/run/ctl.txt`.
- **App log:** `~/Library/Logs/nxnative/<title ID>.log`.
- **Performance summary:** `tools/porting/perf.sh [log]`.
- **Shared shader lists:** one per game, `games/<game>/shader_list.tsv`; `tools/shader_list.py stats` / `new` / `merge` / `collect` / `ship` (docs/porting.md § 4b). Never mix lists: each is for one game and one engine version.

## Where things are

| Need | Look at |
|---|---|
| Build steps | `switch2mac.py` |
| A game built with another engine, and the front end added to it (overlay, key-2 settings, no launch window) | `games/<game>/game.json` "engine", `tools/engine/patch.py`, `tools/engine/s2m_ui.m`; moving it to its build's newest commit: `tools/engine/update.py` |
| Game profile (build IDs, memory, flags, shader tables) | `engines/switch2mac/dm/games/<title ID>/` (Mario Kart World); the engine's own for the others |
| NVN2 → Metal | `engines/switch2mac/dm/gfx/nvn/nvn_mtl.m`, `engines/switch2mac/dm/host/hle_nvn.c` |
| Switch 2 system stubs, movies | `engines/switch2mac/dm/host/hle_nx2*.c` |
| Shader split / lowering / translation | `engines/switch2mac/dm/gfx/tools/nx2_split.py`, `nx2_lower/`, `dmsh_build.py`, `engines/switch2mac/dm/third_party/ryujinx/` |
| Diagnostic switches and control commands | `docs/porting.md` § 5 |
| Known Switch 2 pitfalls | `docs/porting.md` § 6, `docs/mario-kart-world.md` |

After changing translator tools (`dmsh_xlate_bin`, `dmsh_build.py`, `nx2_split.py`, ...), run `engines/switch2mac/dm/gfx/tools/dmsh_chain.py --header`, then rebuild (`build` or `refresh --force`). Otherwise the host refuses the libraries.
