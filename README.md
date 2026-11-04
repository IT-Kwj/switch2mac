# switch2mac

Native Mac builds of Nintendo Switch 2 games on Apple silicon, made from **your own dump** on your own Mac.

It is not an emulator: the game's own ARM64 code runs directly on the Mac, rewritten so its system calls land in a native runtime, and every shader is translated to Metal ahead of time. switch2mac is built on [nxnative](https://github.com/seedds/nxnative): Mario Kart World runs on switch2mac's own fork of it (NVN2 graphics on Metal, Switch 2 mesh and task shaders, movies, many shader translator fixes, and the performance work that took it from 20 to about 58 fps); other games are built with the engine their own port was made with, and switch2mac gives every app the same front end.

| Game | Version | Built with | Status | Page |
|---|---|---|---|---|
| Mario Kart World | 1.0.0 | switch2mac's engine (`nxnative/`) | Plays start to finish: menus, Grand Prix, free roam, traffic, movies; ~58 fps in races on an M1 Max (Performance mode), 2560x1440 | [games/mario-kart-world](games/mario-kart-world) |
| Donkey Kong Bananza | update v458752 | [nxnative](https://github.com/seedds/nxnative)'s builder | **Untested in switch2mac** | [games/donkey-kong-bananza](games/donkey-kong-bananza) |
| Pokémon Pokopia | v327680, 2.0.1 | [pokopia-native](https://github.com/xFractals/pokopia-native) by xFractals | **Untested in switch2mac** | [games/pokemon-pokopia](games/pokemon-pokopia) |
| Your game? | | | | [docs/porting.md](docs/porting.md) |

> This repository holds no game content. You need a dump of a game you own; what the build makes from it must not be shared. See [LEGAL.md](LEGAL.md).

## What you get

`<Game>.app`: a normal, double-clickable Mac app that carries everything it needs (it keeps working after you delete the build folder). Every game's app works the same way:

- Opens straight into the game, windowed or full screen (no settings window first).
- **Key 1**: the performance overlay (top right). Compact (FPS + resolution) → detailed (30-second FPS graph, GPU time, frame time, CPU, memory, the game's frame pacing) → off.
- **Key 2**: the settings panel (Esc closes it): the game's settings, the overlay and full screen change at once, the rest at the next launch.
- Controllers (Xbox, PlayStation, Switch Pro and others macOS recognises) and the keyboard.
- Saves in `~/Library/Application Support/nxnative/<title ID>/save`, the log in `~/Library/Logs/nxnative/<title ID>.log`.

## What you need

- A Mac with Apple silicon and **macOS 26 or later** (the runtime draws with Metal 4, new in macOS 26). The app is built for the macOS version of the Mac that builds it (tested: M1 Max, 64 GB, macOS 26.6; reported working: M4 Pro, 24 GB, macOS 26.5).
- **Xcode** with the Metal toolchain (Xcode → Settings → Components), and its command line tools.
- **.NET 10 SDK** ([dot.net](https://dot.net)): the shader translator runs on it.
- **Python 3.12 or newer** (python.org or Homebrew).
- **git** (comes with Xcode's command line tools): Donkey Kong Bananza and Pokémon Pokopia fetch their engine once.
- Free disk space and your dump: each game's page says how much and how the dump folder must look. Dump tools write the files already extracted: switch2mac needs no keys and decrypts nothing.

## Build it

The same commands for every game. `build` reads which game the dump is.

```bash
git clone https://github.com/azmasm/switch2mac.git
```

```bash
cd switch2mac
```

```bash
./switch2mac.py setup
```

```bash
./switch2mac.py build "/path/to/your/dump"
```

```bash
./switch2mac.py install
```

- `setup` makes a Python environment in `.venv` and checks Xcode, Metal, .NET and Python.
- `build` writes only into `./work`. Mario Kart World is built step by step here ([its page](games/mario-kart-world/README.md#build)). Donkey Kong Bananza and Pokémon Pokopia: their engine is fetched once into `./engines` at the version the game's `game.json` names, switch2mac's front end (overlay and key-2 settings) is added to it, and the engine's own builder makes the app.
- `install` moves the app to `/Applications`, replacing an older one.

### The first start waits

After every install macOS scans the new app (tens of GB) before it lets it run: **1-3 minutes with no window and no Dock icon**. Wait; do not open it a second time. Later starts are immediate. The app is signed ad hoc (not notarized), so the very first time macOS may ask: right-click the app → Open.

## Controls

Controllers map by position (right button = A, bottom = B, top = X, left = Y; Nintendo pads by label). Keyboard: WASD left stick, arrow keys D-pad, J K U I = A B X Y, Q E = L R, Z C = ZL ZR, Return = +, Tab = −, F / G stick presses, 1 overlay, 2 settings, ⌃⌘F full screen, ⌘Q quit. The mouse is the touchscreen.

## Problems

- The log: `~/Library/Logs/nxnative/<title ID>.log` (`.prev.log` is the run before). Lines with `[RED]` are things the runtime does not handle.
- Each game's known issues are on its page.
- When you report a problem, attach the log and a screenshot, never game files, shader dumps or the app.

## How it works

The runtime loads the game's modules into memory, rewrites their system calls and SDK functions into calls to native code (file system, audio, input, threads, time), and implements NVN2, the Switch 2 graphics API, on Metal. Switch 2 shaders (NVIDIA Ampere code) are translated by a modified Ryujinx shader translator into Metal Shading Language and compiled into Metal libraries: in switch2mac's engine they are first lowered to Maxwell code by `nx2_lower`, and Switch 2 mesh and task shaders become Metal object and mesh shaders. The story of getting Mario Kart World from a black screen to 58 fps: [docs/mario-kart-world.md](docs/mario-kart-world.md).

## Repository layout

| Path | What |
|---|---|
| `switch2mac.py` | setup, build, run, refresh, install |
| `games/<game>/` | one folder per game: `game.json` (title ID, name, version; the engine and its commit for a game built with another engine), its page (`README.md`: dump, build, settings, known issues) and, for Mario Kart World, the app's settings (`launcher.py`, `env.txt`) and the run-time shader list (`runtime_shaders.tsv`) |
| `games/<game>/shader_list.tsv` | that game's shared shader list (see Contributing): one per game, for the engine its app is built with |
| `tools/shader_list.py` | the shared shader lists: stats, merge, collect the lists players send, ship each build's list |
| `tools/engine/` | switch2mac's front end for the games built with another engine: the overlay and settings panel (`s2m_ui.m`), the script that adds it to that engine (`patch.py`) and the one that moves those games to their build's newest commit (`update.py`) |
| `tools/porting/` | helpers for bringing up a game: run-time shader finder, NSO disassembly helper, pass tracer, performance summary |
| `nxnative/` | switch2mac's engine: nxnative with switch2mac's Switch 2 changes (upstream's iOS app sources are kept because the shader tools share them) |
| `nxnative/dm/games/<title ID>/` | Mario Kart World's game profile: build IDs, memory layout, shader tables, shared pipeline list |
| `docs/` | [porting.md](docs/porting.md) (bringing up a game), [mario-kart-world.md](docs/mario-kart-world.md) (how the first port was made) |
| `AGENTS.md` | notes for AI coding assistants |
| `CHANGELOG.md` | what changed, release by release |

Made by the build, never committed: `work/` (the build), `engines/` (the fetched engines), `.venv/`.

## Contributing

**No code needed: send your shaders and pipelines.** Every game has its own shared shader list, `games/<game>/shader_list.tsv`: the shaders and Metal pipelines players have met, which each build prepares before the first frame so new places don't stutter. A list belongs to one game and to the engine its app is built with (its first line says which), so rows never mix between games. It holds identifiers only: no game data.

You don't need to do anything while you play. The app keeps what it built that the list lacks in `~/Library/Application Support/nxnative/<title ID>/shader-list-contribution.txt`, and each time 100 new rows have built up it asks when you close the game:

- **Send** opens the **Shader list** form on GitHub and shows the file in Finder: drag it into the form and press Submit. The game never uploads anything by itself.
- **Remind me later** asks again after 100 more; **Stop reminding** never asks again.

Maintainers collect the forms with `./tools/shader_list.py collect` (it checks every file belongs to that game and engine and refuses anything else), then `--apply --close`, and commit; later builds carry the new rows. `./tools/shader_list.py stats` shows each list. This works the way [MacNativeGames](https://github.com/ly05010419/MacNativeGames) shares Tears of the Kingdom's shader list, by ly05010419.

Other improvements are welcome too: speed-ups, fixes, testing on other Macs, game updates and new games. Open an issue with the log and screenshots, or a pull request. Give speed-ups an off switch and check that the picture is unchanged. Never attach game files, shader dumps, Metal libraries, saves or built apps.

## Licences and credits

MIT, except `nxnative/dm/gfx/tools/nx2_lower/` (GPL-3.0-or-later) and the third-party code in `nxnative/dm/third_party/`. Built on nxnative by seedds, the Switch 2 patch series by potentialad9091, Eglantine's shader lowering, Ryujinx's shader translator and xFractals' pokopia-native; the shared pipeline list and the overlay / settings panel design follow MacNativeGames by ly05010419. Details: [NOTICE.md](NOTICE.md), [LEGAL.md](LEGAL.md).
