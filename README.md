# switch2mac

Native Mac builds of Nintendo Switch 2 games on Apple silicon, made from **your own dump** on your own Mac.

It is not an emulator: the game's own ARM64 code runs directly on the Mac, rewritten so its system calls land in a native runtime, and every shader is translated to Metal ahead of time. switch2mac is built on [nxnative](https://github.com/seedds/nxnative): Mario Kart World runs on switch2mac's own fork of it (NVN2 graphics on Metal, Switch 2 mesh and task shaders, movies, many shader translator fixes, and the performance work that took it from 20 to about 58 fps); other games are built with the engine their own port was made with, and switch2mac gives every app the same front end.

| Game | Version | Built with | Status | Page |
|---|---|---|---|---|
| Mario Kart World | 1.0.0 | switch2mac's engine ([switch2mac-engine](https://github.com/azmasm/switch2mac-engine)) | Plays start to finish: menus, Grand Prix, free roam, traffic, movies; ~58 fps in races on an M1 Max (Performance mode), 2560x1440. **16 GB Macs may not run it smoothly** (see below) | [games/mario-kart-world](games/mario-kart-world) |
| Donkey Kong Bananza | update v458752 | [nxnative](https://github.com/seedds/nxnative)'s builder | nxnative reports: plays at **60 fps on an M4 Pro** through the first level's opening areas (busy scenes dip to 30 for a few seconds). Not yet tested in switch2mac | [games/donkey-kong-bananza](games/donkey-kong-bananza) |
| Pokémon Pokopia | v327680, 2.0.1 | [pokopia-native](https://github.com/xFractals/pokopia-native) by xFractals | pokopia-native reports: plays on its author's **M4 Mac** past the first wake-up with no issues found. A player reports **30 fps on a MacBook Air M3 (16 GB)** at 3440x1440, "runs well". Not yet tested in switch2mac | [games/pokemon-pokopia](games/pokemon-pokopia) |
| Your game? | | | | [docs/porting.md](docs/porting.md) |

> This repository holds no game content. You need a dump of a game you own; what the build makes from it must not be shared. See [LEGAL.md](LEGAL.md).

> **Mario Kart World on a 16 GB Mac:** the game currently uses about 13-16 GB of memory, and up to about 20 GB in long free-roam sessions. On a Mac with 16 GB it may not run smoothly (stutters, slowdowns, or macOS asking you to quit other apps). Work to bring its memory down is under way. Macs with 24 GB or more have run it fine so far (tested on 64 GB, reported on 24 GB).

## Quick start (no experience needed)

> **1. Install the free tools (once).**
> - **Xcode** from the App Store. Open it once, then go to Xcode → Settings → Components and install **Metal Toolchain**.
> - **.NET 10 SDK** from [dot.net](https://dot.net) (the macOS Arm64 installer).
> - **Python** from [python.org](https://www.python.org/downloads) (only if step 3 says it is missing).
>
> **2. Get switch2mac.** Click the green **Code** button at the top of this page → **Download ZIP**, double-click the ZIP, and move the `switch2mac-main` folder somewhere roomy (Documents is fine). The game needs 20-50 GB free while it builds (see your game's page).
>
> **3. Double-click `Build a Game.command`** in that folder. The first time, macOS may say it is from an unidentified developer: right-click it → **Open** → **Open**. A Terminal window checks your Mac, then asks for your game: **drag your dump folder into the window** and press Return. Leave it running (20 minutes to over an hour the first time).
>
> **4. Play.** Open the game from **Applications**. The very first start waits 1-3 minutes with no window while macOS checks the app: wait, don't open it twice. In the game, **1** shows the performance overlay and **2** the settings.
>
> **Your dump folder** must be the files your dump tool wrote (no keys needed), for example:
>
> | Game | The folder you drag in holds |
> |---|---|
> | Mario Kart World 1.0.0 | `exefs/` and `romfs/` (or `base/exefs` and `base/romfs`) |
> | Donkey Kong Bananza | `base/` and `updates/458752/` (and `dlc/`, if you have it) |
> | Pokémon Pokopia | `base/exefs` and `updates/<version>/` |
>
> Copied off your console over FTP? Use **binary** transfer mode, or the files get damaged.
>
> **Updating later:** download the ZIP again (or `git pull` if you used git), double-click `Build a Game.command` again. Your saves are kept. **Stuck?** See [Problems](#problems).

Everything below is more detail, for when you want it.

## What you get

`<Game>.app`: a normal, double-clickable Mac app that carries everything it needs (it keeps working after you delete the build folder). Every game's app works the same way:

- Opens straight into the game, windowed or full screen (no settings window first).
- **Key 1**: the performance overlay (top right). Compact (FPS + resolution) → detailed (30-second FPS graph, GPU time, frame time, CPU, memory, the game's frame pacing) → off.
- **Key 2**: the settings panel (Esc closes it): the game's settings, the overlay and full screen change at once, the rest at the next launch.
- Controllers (Xbox, PlayStation, Switch Pro and others macOS recognises) and the keyboard.
- Saves in `~/Library/Application Support/nxnative/<title ID>/save`, the log in `~/Library/Logs/nxnative/<title ID>.log`.

## The switch2mac app (preview)

A Mac app that does the same with buttons: choose your dump folder, press Build, and the game lands in Applications, with a library of your built games (their eShop banners are downloaded onto your Mac at run time; none are in this repository). It reads your Mac's chip and memory and picks the build of each game that suits it: Mario Kart World has two, and the app says which one it recommends and why, with how each ran on players' Macs. A download comes with the first release; for now, build it from `app/` with `app/tools/make_app.sh` (needs Xcode). Its design comes from [NX2Apple](https://github.com/LNPANDY/NX2Apple) (MIT).

## What you need

- A Mac with Apple silicon and **macOS 26 or later** (the runtime draws with Metal 4, new in macOS 26). The app is built for the macOS version of the Mac that builds it (tested: M1 Max, 64 GB, macOS 26.6; reported working: M4 Pro, 24 GB, macOS 26.5).
- **Xcode** with the Metal toolchain (Xcode → Settings → Components), and its command line tools.
- **.NET 10 SDK** ([dot.net](https://dot.net)): the shader translator runs on it.
- **Python 3.12 or newer** (python.org or Homebrew).
- **git** (comes with Xcode's command line tools): Donkey Kong Bananza and Pokémon Pokopia fetch their engine once.
- Free disk space and your dump: each game's page says how much and how the dump folder must look. Dump tools write the files already extracted: switch2mac needs no keys and decrypts nothing.

## Build it in Terminal

`Build a Game.command` runs these same three steps for you. In Terminal they are the same for every game; `build` reads which game the dump is.

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

- `setup` checks macOS, Xcode, Metal, .NET, Python and git, and stops with the exact fix for anything missing; then it makes a Python environment in `.venv` (it finds a new enough Python by itself: macOS's own is too old).
- `build` writes only into `./work`. Mario Kart World is built step by step here ([its page](games/mario-kart-world/README.md#build)). Donkey Kong Bananza and Pokémon Pokopia: their engine is fetched once into `./engines` at the version the game's `game.json` names, switch2mac's front end (overlay and key-2 settings) is added to it, and the engine's own builder makes the app.
- `build` first checks there is enough free disk space for that game.
- `install` moves the app to `/Applications`, replacing an older one.

### The first start waits

After every install macOS scans the new app (tens of GB) before it lets it run: **1-3 minutes with no window and no Dock icon**. Wait; do not open it a second time. Later starts are immediate. The app is signed ad hoc (not notarized), so the very first time macOS may ask: right-click the app → Open.

## Controls

Controllers map by position (right button = A, bottom = B, top = X, left = Y; Nintendo pads by label). Keyboard: WASD left stick, arrow keys D-pad, J K U I = A B X Y, Q E = L R, Z C = ZL ZR, Return = +, Tab = −, F / G stick presses, 1 overlay, 2 settings, ⌃⌘F full screen, ⌘Q quit. The mouse is the touchscreen.

## Problems

| What you see | What to do |
|---|---|
| "cannot be opened because it is from an unidentified developer" (for `Build a Game.command` or the game) | Right-click it → **Open** → **Open**. Only needed the first time. |
| A **MISSING** line during the checks | Install what its **fix** line says, then double-click `Build a Game.command` again. |
| "not enough free disk space" | Free up the space it names (empty the Trash too), then try again. |
| "cut short or damaged", or the build stops while reading the game's files | The dump was damaged while copying. Copy it off the console again in **binary** mode, and check the folder is the right one (Quick start table). |
| "title ... is not supported yet" or "not a version this profile knows" | That folder is another game, or another version than the one listed above. |
| The game doesn't open after installing | The first start waits 1-3 minutes with no window. Wait; don't open it twice. |
| It stutters in a new place | It is building something for the first time; it is smooth after. When you close the game it may offer to **Send** what it built, so others don't stutter there (see Contributing). |

Still stuck? Open an issue on this page with a screenshot and the game's log: in Finder, **Go → Go to Folder…** and paste `~/Library/Logs/nxnative`, then attach the `.log` file named after your game's title ID (Mario Kart World `0400C3F00006E000`, Donkey Kong Bananza `040074A01BF12000`, Pokémon Pokopia `0400A3A01EE4C000`). Never attach game files, the app or saves. Each game's own known issues are on its page.

## How it works

The runtime loads the game's modules into memory, rewrites their system calls and SDK functions into calls to native code (file system, audio, input, threads, time), and implements NVN2, the Switch 2 graphics API, on Metal. Switch 2 shaders (NVIDIA Ampere code) are translated by a modified Ryujinx shader translator into Metal Shading Language and compiled into Metal libraries: in switch2mac's engine they are first lowered to Maxwell code by `nx2_lower`, and Switch 2 mesh and task shaders become Metal object and mesh shaders. The story of getting Mario Kart World from a black screen to 58 fps: [docs/mario-kart-world.md](docs/mario-kart-world.md).

## Repository layout

| Path | What |
|---|---|
| `Build a Game.command` | double-click: setup, build and install in one go (Quick start) |
| `switch2mac.py` | setup, build, run, refresh, install |
| `games/<game>/` | one folder per game: `game.json` (title ID, name, version; the engine and its commit for a game built with another engine, or several builds and which Mac gets which, as for Mario Kart World), its page (`README.md`: dump, build, settings, known issues) and, for Mario Kart World, the app's settings (`launcher.py`, `env.txt`) and the run-time shader list (`runtime_shaders.tsv`) |
| `games/<game>/shader_list.tsv` | that game's shared shader list (see Contributing): one per game and build, for the engine its app is built with (a second build's: `shader_list-<build>.tsv`) |
| `app/` | the switch2mac app (SwiftPM; `app/tools/make_app.sh` makes `app/build/switch2mac.app`), adapted from NX2Apple |
| `tools/shader_list.py` | the shared shader lists: stats, merge, collect the lists players send, ship each build's list |
| `tools/engine/` | switch2mac's front end for the games built with another engine: the overlay and settings panel (`s2m_ui.m`), the script that adds it to that engine (`patch.py`) and the one that moves those games to their build's newest commit (`update.py`) |
| `tools/porting/` | helpers for bringing up a game: run-time shader finder, NSO disassembly helper, pass tracer, performance summary |
| `docs/` | [porting.md](docs/porting.md) (bringing up a game), [mario-kart-world.md](docs/mario-kart-world.md) (how the first port was made) |
| `AGENTS.md` | notes for AI coding assistants |
| `CHANGELOG.md` | what changed, release by release |

Made by the build, never committed: `work/` (the build), `engines/` (each game's engine, fetched at the commit its `game.json` names), `.venv/`.

Mario Kart World's engine, switch2mac's own fork of nxnative with its Switch 2 work and the game's profile, is its own repository: [switch2mac-engine](https://github.com/azmasm/switch2mac-engine). Engine bugs and fixes (graphics, crashes, speed) go there; everything else here. Not sure? Open it here, and it is moved if it belongs there.

## Contributing

**No code needed: send your shaders and pipelines.** Every game has its own shared shader list, `games/<game>/shader_list.tsv`: the shaders and Metal pipelines players have met, which each build prepares before the first frame so new places don't stutter. A list belongs to one game and to the engine its app is built with (its first line says which), so rows never mix between games. It holds identifiers only: no game data.

You don't need to do anything while you play. The app keeps what it built that the list lacks in `~/Library/Application Support/nxnative/<title ID>/shader-list-contribution.txt`, and each time 100 new rows have built up it asks when you close the game:

- **Send** opens the **Shader list** form on GitHub and shows the file in Finder: drag it into the form and press **Create**. The game never uploads anything by itself.
- **Remind me later** asks again after 100 more; **Stop reminding** never asks again.

### Is sending safe?

Yes. The file is **a list of shader IDs, not shaders**: like sending library book numbers instead of the books.

- Each line is a short code of letters and numbers, a fingerprint of a shader or of a render setup (which two shaders go together, colour formats, blending). Nobody can rebuild a shader, or anything of the game, from it.
- When another player's app reads the list, it finds those codes among the shaders built from **their own** copy of the game and prepares them early. Nothing of yours reaches them but the codes.
- It holds no game files, no shader code (the game's shaders the app saves in its `shdump` folder stay on your Mac), no saves, no file paths, and nothing about you or your Mac.
- The list only takes lines of that exact form: anything else in a file is thrown away.
- The game never uploads anything by itself: you see the file, you choose to send it, and it appears publicly on this repository under your GitHub account.

Maintainers collect the forms with `./tools/shader_list.py collect` (it checks every file belongs to that game and engine and refuses anything else), then `--apply --close`, and commit; later builds carry the new rows. `./tools/shader_list.py stats` shows each list. This works the way [MacNativeGames](https://github.com/ly05010419/MacNativeGames) shares Tears of the Kingdom's shader list, by ly05010419.

Other improvements are welcome too: speed-ups, fixes, testing on other Macs, game updates and new games. Open an issue with the log and screenshots, or a pull request. Give speed-ups an off switch and check that the picture is unchanged. Never attach game files, shader dumps, Metal libraries, saves or built apps.

## Licences and credits

MIT. The engines are separate repositories under their own licences ([switch2mac-engine](https://github.com/azmasm/switch2mac-engine): MIT, except its `nx2_lower` (GPL-3.0-or-later) and third-party code). Built on nxnative by seedds, the Switch 2 patch series by potentialad9091, Eglantine's shader lowering, Ryujinx's shader translator and xFractals' pokopia-native; the shared pipeline list and the overlay / settings panel design follow MacNativeGames by ly05010419. Details: [NOTICE.md](NOTICE.md), [LEGAL.md](LEGAL.md).
