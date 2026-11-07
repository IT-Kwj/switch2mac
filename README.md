# switch2mac

**Play your Nintendo Switch and Switch 2 games natively on your Mac.** switch2mac is a Mac app that turns **your own game dump** into a normal, double-clickable Mac game: choose your game, press Build, play.

It is not an emulator. The game's own Arm code runs directly on Apple silicon, its system calls go to a native runtime, and its graphics are translated to Metal ahead of time. switch2mac picks the best build of each game for your Mac (chip and memory), based on how each build ran on players' Macs.

## The switch2mac app

A Mac app that builds your games for you: choose your game, press **Build**, and it lands in Applications.

- **Library:** your games as 3D game cases (Carousel, Flipbook or Stack), as covers or as a row of banners. Click a case to open it (its cartridge and booklet slide out), click again to play. Drag, scroll, use the arrow keys or a controller. Box fronts and eShop banners are downloaded onto your Mac when the app runs (see [LEGAL.md](LEGAL.md)); none are stored here.
- **Several builds per game:** nxnative, switch2mac's own engine, MacNativeGames and community ports. The app picks the one that runs best on **Your Mac** (chip, memory, macOS), from how each build ran on players' Macs.
- **Switch and Switch 2:** Switch 2 dumps need no keys; Switch games are built with your own `prod.keys`, with their update and DLC.
- **What's New, Performance and updates:** game fixes arrive by themselves; every play session's frame rate and memory is kept, and can be shared as a report.
- **Light while you play:** switch2mac lets go of its pictures while a game runs, or closes and opens again after (Settings › While you play).

1. **Download** `switch2mac-macOS-arm64.zip` from [Releases](https://github.com/azmasm/switch2mac/releases/latest). Unzip it and move **switch2mac** to your Applications folder.
2. **Open it.** The first time, macOS says it cannot verify the app (it is not signed with a paid Apple Developer ID): click **Done**, open **System Settings → Privacy & Security**, scroll down and click **Open Anyway**. You only do this once.
3. **Follow the setup.** It checks your Mac and tells you what to install: **Xcode** (free, App Store) with its **Metal Toolchain**, and the **.NET 10 SDK** ([dot.net](https://dot.net)). Python and the other build tools are inside the app.
4. **Build a game.** Press **+ Build game** and choose your game (a dump folder, a `.nup`, or a Switch game's `.nsp` / `.xci`). The app names the game, shows **Your Mac** and the build it recommends, and how that build ran on other Macs. Press **Build**. It takes 20 minutes to a few hours the first time, depending on the game, and needs 20-250 GB free while it builds (each game's page says).
5. **Play** from the app's **Library** or from Applications. The very first start waits 1-3 minutes with no window while macOS checks the new app: wait, don't open it twice. In the game, **1** shows the performance overlay and **2** the settings.

The app keeps itself and its game list up to date: new games and fixes arrive when you open it.

> **You need:** a Mac with Apple silicon and **macOS 26 or later**, and a dump of a game you own. Switch 2 games need no keys; Switch 1 games are built with your own `prod.keys`, which switch2mac only passes to the builder (see [LEGAL.md](LEGAL.md)). switch2mac itself decrypts nothing. This repository holds no game content, and what the build makes must not be shared. See [LEGAL.md](LEGAL.md).

## Games

| Game | Version | Built with | Status | Page |
|---|---|---|---|---|
| Mario Kart World | 1.0.0 | switch2mac's engine ([switch2mac-engine](https://github.com/azmasm/switch2mac-engine)) | Plays start to finish: menus, Grand Prix, free roam, traffic, movies; ~58 fps in races on an M1 Max (Performance mode), 2560x1440. **16 GB Macs may not run it smoothly** (see below) | [games/mario-kart-world](games/mario-kart-world) |
| Donkey Kong Bananza | update v458752 | [nxnative](https://github.com/seedds/nxnative)'s builder | nxnative reports: plays at **60 fps on an M4 Pro** through the first level's opening areas (busy scenes dip to 30 for a few seconds). | [games/donkey-kong-bananza](games/donkey-kong-bananza) |
| Pokémon Pokopia | v327680, 2.0.1 | [pokopia-native](https://github.com/xFractals/pokopia-native) by xFractals (default), or [nxnative](https://github.com/seedds/nxnative)'s (2.0.1 only, hours of shader building) | pokopia-native reports: plays on its author's **M4 Mac** past the first wake-up with no issues found. A player reports **30 fps on a MacBook Air M3 (16 GB)** at 3440x1440, "runs well". | [games/pokemon-pokopia](games/pokemon-pokopia) |
| Yoshi and the Mysterious Book | update v131072 (1.0.2) | [nxnative](https://github.com/seedds/nxnative)'s builder | nxnative reports: plays at **60 fps on a 16 GB M6** through the first habitat, a save and a reload. About 133,000 shaders: a full build can take many hours. | [games/yoshi-and-the-mysterious-book](games/yoshi-and-the-mysterious-book) |
| Splatoon Raiders | update v65536 | [nxnative](https://github.com/seedds/nxnative)'s builder | nxnative reports: plays at **60 fps on an M4 Pro** through the first level. A player's **16 GB M2 Air** swapped and slowed to about 1 fps after 5 minutes (open). | [games/splatoon-raiders](games/splatoon-raiders) |
| Hyrule Warriors: Age of Imprisonment | update v196608 | [nxnative](https://github.com/seedds/nxnative)'s builder | nxnative reports: plays into the first field on a **16 GB M6** (frame median 16.6 ms, frequent long frames); battles not reached. A **Mac Studio M5 Max** froze the display (open). About 102,000 shaders. | [games/hyrule-warriors-age-of-imprisonment](games/hyrule-warriors-age-of-imprisonment) |
| Fire Emblem Fortune's Weave | v131072 | [nxnative](https://github.com/seedds/nxnative)'s builder | nxnative reports: plays through the first battle map at **60 fps** (120 offered; 30 as shipped). | [games/fire-emblem-fortunes-weave](games/fire-emblem-fortunes-weave) |
| Mario Tennis Fever | update v327680 (1.1.1) | [nxnative](https://github.com/seedds/nxnative)'s builder | nxnative reports: **60 fps on an M4 Pro** in Free Play matches. A player's **M3 Pro (18 GB)** gets 30-45 fps in Adventure exploration, with black outdoor textures (open). | [games/mario-tennis-fever](games/mario-tennis-fever) |
| Star Fox | update v131072 | [nxnative](https://github.com/seedds/nxnative)'s builder | nxnative reports: plays on an **M4 Pro (48 GB)** through the title, the prologue and the tutorial flight at **56-60 fps**. About 2,900 shaders, a short build. | [games/star-fox](games/star-fox) |
| Kirby Air Riders | update v458752 | [nxnative](https://github.com/seedds/nxnative)'s builder | Added from nxnative's profile: see [its notes](https://github.com/seedds/nxnative/tree/8feddfeeb6268923d66b64a6e15efeb9b2901cf9/dm/games/040077201BE50000). | [games/kirby-air-riders](games/kirby-air-riders) |
| The Legend of Zelda: Ocarina of Time | update v131072 | [nxnative](https://github.com/seedds/nxnative)'s builder | Added from nxnative's profile: see [its notes](https://github.com/seedds/nxnative/tree/6121fd75312cb4d1af404a01921d437741fea91e/dm/games/0400486024DEC000). | [games/the-legend-of-zelda-ocarina-of-time](games/the-legend-of-zelda-ocarina-of-time) |
| The Legend of Zelda: Tears of the Kingdom (Switch) | 1.4.3 (update v720896) | [MacNativeGames](https://github.com/ly05010419/MacNativeGames) by ly05010419 (default), or nxnative's builder | New in switch2mac, **not built here yet**: MacNativeGames reports it runs well on Apple silicon. Built with your own `prod.keys`. | [games/the-legend-of-zelda-tears-of-the-kingdom](games/the-legend-of-zelda-tears-of-the-kingdom) |
| The Legend of Zelda: Breath of the Wild (Switch) | 1.9.0 (update v1114112) | [MacNativeGames](https://github.com/ly05010419/MacNativeGames) (default), or nxnative's builder | New in switch2mac, **not built here yet**. Built with your own `prod.keys`. | [games/the-legend-of-zelda-breath-of-the-wild](games/the-legend-of-zelda-breath-of-the-wild) |
| Other Switch games | | nxnative's builder, with the profile nxnative has for the game or one guessed from its files (untested) | Super Mario Bros. Wonder built and played at 60 fps here (M1 Max). Games with no profile may stop partway. | |
| Your game? | | | | [docs/porting.md](docs/porting.md) |

> **Mario Kart World on a 16 GB Mac:** Macs with less than 24 GB now get nxnative's build of Mario Kart World automatically, which needs much less memory (about 11 GB): players report 60 fps on a 16 GB M6 and 36-40 fps on a 16 GB M1 Pro. switch2mac's own build can grow past 20 GB in long sessions, so it is kept for Macs with 24 GB or more ([both builds](games/mario-kart-world/README.md#two-builds)).

### Your dump folder

The files your dump tool wrote, for example:

| Game | The folder you choose holds |
|---|---|
| Mario Kart World 1.0.0 | `exefs/` and `romfs/` (or `base/exefs` and `base/romfs`) |
| Donkey Kong Bananza | `base/` and `updates/458752/` (and `dlc/`, if you have it) |
| Pokémon Pokopia | `base/exefs` and `updates/<version>/` |
| Yoshi and the Mysterious Book | `base/` and `updates/131072/` |
| Splatoon Raiders | `base/` and `updates/65536/` |
| Hyrule Warriors: Age of Imprisonment | `base/` and `updates/196608/` |
| Fire Emblem Fortune's Weave | `exefs/` and `romfs/` |
| Mario Tennis Fever | `base/` and `updates/327680/` |
| Star Fox | `base/` and `updates/131072/` |
| Kirby Air Riders | `base/` and `updates/458752/` |
| The Legend of Zelda: Ocarina of Time | `base/` and `updates/131072/` |

**A `.nup` file works too** (a NUP container: the base game, updates and DLC in one file, no keys needed): choose the file itself, or a folder holding it. Every build that runs on nxnative's builder opens it directly; switch2mac's own engine (Mario Kart World's `switch2mac` build) needs a dump folder, so the app recommends another build for a `.nup`.

**Switch games:** choose the game's `.nsp` or `.xci` file, or the folder with its base game, update and DLC, then your own `prod.keys` when the app asks. The app recognises the game from the file names dump tools write (`Game [0100F2C0115B6000][v0].nsp`); nxnative's builder opens the files. Tested builds for Switch 1 games, and more of them, are coming.

Copied off your console over FTP? Use **binary** transfer mode, or the files get damaged. A damaged dump is named in the app before you build.

## What you get

`<Game>.app`: a normal, double-clickable Mac app that carries everything it needs (it keeps working after you delete the build folder). Every game's app works the same way:

- Opens straight into the game, windowed or full screen (no settings window first).
- **Key 1**: the performance overlay (top right). Compact (FPS + resolution) → detailed (30-second FPS graph, GPU time, frame time, CPU, memory, the game's frame pacing) → off.
- **Key 2**: the settings panel (Esc closes it): the game's settings, the overlay and full screen change at once, the rest at the next launch.
- Controllers (Xbox, PlayStation, Switch Pro and others macOS recognises) and the keyboard.
- Saves in `~/Library/Application Support/nxnative/<title ID>/save`, the log in `~/Library/Logs/nxnative/<title ID>.log`.

## Without the app: Terminal

The app runs the same script as these commands; they are the same for every game, and `build` reads which game the dump is. You also need **Python 3.12 or newer** and **git** (which comes with Xcode's command line tools).

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
- `build` writes only into `./work`. Mario Kart World is built step by step here ([its page](games/mario-kart-world/README.md#build)). The other games: their engine is fetched once into `./engines` at the version the game's `game.json` names, switch2mac's front end (overlay and key-2 settings) is added to it, and the engine's own builder makes the app.
- `build` first checks there is enough free disk space for that game.
- `install` moves the app to `/Applications`, replacing an older one.
- `./switch2mac.py builds <game>` shows a game's builds, the one your Mac gets and why, and how each ran on players' Macs; `build --engine <id>` builds another one.

### The first start waits

After every install macOS scans the new app (tens of GB) before it lets it run: **1-3 minutes with no window and no Dock icon**. Wait; do not open it a second time. Later starts are immediate.

## Controls

Controllers map by position (right button = A, bottom = B, top = X, left = Y; Nintendo pads by label). Keyboard: WASD left stick, arrow keys D-pad, J K U I = A B X Y, Q E = L R, Z C = ZL ZR, Return = +, Tab = −, F / G stick presses, 1 overlay, 2 settings, ⌃⌘F full screen, ⌘Q quit. The mouse is the touchscreen.

## Problems

| What you see | What to do |
|---|---|
| "Apple could not verify switch2mac" (or a game) | **System Settings → Privacy & Security** → scroll down → **Open Anyway**. Only needed the first time. |
| The app's setup says something is missing | Install what it names (Xcode, its Metal Toolchain, .NET 10), then open the app again. |
| "not enough free disk space" | Free up the space it names (empty the Trash too), then try again. |
| "cut short or damaged", or the build stops while reading the game's files | The dump was damaged while copying. Copy it off the console again in **binary** mode, and check the folder is the right one ([Your dump folder](#your-dump-folder)). |
| "title ... is not supported yet" or "not a version this profile knows" | That folder is another game, or another version than the one listed above. |
| The game doesn't open after installing | The first start waits 1-3 minutes with no window. Wait; don't open it twice. |
| It stutters in a new place | It is building something for the first time; it is smooth after. When you close the game it may offer to **Send** what it built, so others don't stutter there (see Contributing). |

Still stuck? Open an issue on this page with a screenshot and the game's log: in Finder, **Go → Go to Folder…** and paste `~/Library/Logs/nxnative`, then attach the `.log` file named after your game's title ID (Mario Kart World `0400C3F00006E000`, Donkey Kong Bananza `040074A01BF12000`, Pokémon Pokopia `0400A3A01EE4C000`). Never attach game files, the app or saves. Each game's own known issues are on its page.

## How it works

The runtime loads the game's modules into memory, rewrites their system calls and SDK functions into calls to native code (file system, audio, input, threads, time), and implements NVN2, the Switch 2 graphics API, on Metal. Switch 2 shaders (NVIDIA Ampere code) are translated into Metal Shading Language ahead of time and compiled into Metal libraries.

Each game is built with the engine its port was made with, pinned in its `game.json`: switch2mac's own engine ([switch2mac-engine](https://github.com/azmasm/switch2mac-engine), a fork of nxnative) for Mario Kart World, upstream [nxnative](https://github.com/seedds/nxnative) for most games, and xFractals' [pokopia-native](https://github.com/xFractals/pokopia-native) for Pokopia. switch2mac adds the same front end to every one (overlay, settings, the shared shader list), and when a game has more than one build it picks the one that suits your Mac from players' reports. A daily check moves each game to its engine's newest version. The story of getting Mario Kart World from a black screen to 58 fps on switch2mac's engine: [docs/mario-kart-world.md](docs/mario-kart-world.md).

## Repository layout

| Path | What |
|---|---|
| `switch2mac.py` | what the app runs: setup, identify, build, install (and run, refresh, builds for developers) |
| `games/<game>/` | one folder per game: `game.json` (title ID, name, version; the engine and its commit for a game built with another engine, or several builds and which Mac gets which, as for Mario Kart World), its page (`README.md`: dump, build, settings, known issues) and, for Mario Kart World, the app's settings (`launcher.py`, `env.txt`) and the run-time shader list (`runtime_shaders.tsv`) |
| `games/<game>/shader_list.tsv` | that game's shared shader list (see Contributing): one per game and build, for the engine its app is built with (a second build's: `shader_list-<build>.tsv`) |
| `app/` | the switch2mac app (SwiftPM; `app/tools/make_app.sh` makes `app/build/switch2mac.app`, `--bundle-tools` the download with Python and tools inside), adapted from [NX2Apple](https://github.com/LNPANDY/NX2Apple) (MIT) |
| `tools/shader_list.py` | the shared shader lists: stats, merge, collect the lists players send, ship each build's list |
| `tools/engine/` | switch2mac's front end for the games built with another engine: the overlay and settings panel (`s2m_ui.m`), the script that adds it to that engine (`patch.py`) and the one that moves those games to their build's newest commit (`update.py`) |
| `tools/porting/` | helpers for bringing up a game: run-time shader finder, NSO disassembly helper, pass tracer, performance summary |
| `docs/` | [porting.md](docs/porting.md) (bringing up a game), [mario-kart-world.md](docs/mario-kart-world.md) (how the first port was made) |
| `AGENTS.md` | notes for AI coding assistants |
| `CHANGELOG.md` | what changed, release by release |

Made by the build, never committed: `work/` (the build), `engines/` (each game's engine, fetched at the commit its `game.json` names), `.venv/`.

Mario Kart World's engine, switch2mac's own fork of nxnative with its Switch 2 work and the game's profile, is its own repository: [switch2mac-engine](https://github.com/azmasm/switch2mac-engine). Engine bugs and fixes (graphics, crashes, speed) go there; everything else here. Not sure? Open it here, and it is moved if it belongs there.

## Contributing

**Tell us how a game ran on your Mac.** Each game's reports table, and the build switch2mac picks for each Mac, come from players' reports. Use the [How it ran](https://github.com/azmasm/switch2mac/issues/new?template=how-it-ran.yml) form: the game, your Mac (model, chip, memory), macOS, the frame rate and how far you played. Nothing about you is recorded. The form is read automatically: a maintainer checks the row it makes and adds it to the game's reports.

**No code needed: send your shaders and pipelines.** Every game has its own shared shader list, `games/<game>/shader_list.tsv`: the shaders and Metal pipelines players have met, which each build prepares before the first frame so new places don't stutter. A list belongs to one game and to the engine its app is built with (its first line says which), so rows never mix between games. It holds identifiers only: no game data.

You don't need to do anything while you play. The app keeps what it built that the list lacks in `~/Library/Application Support/nxnative/<title ID>/shader-list-contribution.txt`, and each time 100 new rows have built up it asks when you close the game:

- **Send** opens the **Shader list** form on GitHub and shows the one file to send in Finder (`shader-list-<title ID>-<date>.txt`): drag it into the form and press **Create**. The game never uploads anything by itself.
- Within a minute or two the list is checked and added to the game's shared list, and the issue is closed with a thank-you: everyone's next build of the game prepares those shaders. If something is wrong (no file came through, another game), a comment on the issue says so, and dragging the file into a comment tries again.
- **Remind me later** asks again after 100 more; **Stop reminding** never asks again.

### Is sending safe?

Yes. The file is **a list of shader IDs, not shaders**: like sending library book numbers instead of the books.

- Each line is a short code of letters and numbers, a fingerprint of a shader or of a render setup (which two shaders go together, colour formats, blending). Nobody can rebuild a shader, or anything of the game, from it.
- When another player's app reads the list, it finds those codes among the shaders built from **their own** copy of the game and prepares them early. Nothing of yours reaches them but the codes.
- It holds no game files, no shader code (the game's shaders the app saves in its `shdump` folder stay on your Mac), no saves, no file paths, and nothing about you or your Mac.
- The list only takes lines of that exact form: anything else in a file is thrown away.
- The game never uploads anything by itself: you see the file, you choose to send it, and it appears publicly on this repository under your GitHub account.

Each form is read by a GitHub workflow (`.github/workflows/shader-lists.yml`, running `./tools/shader_list.py collect --issue <n> --apply`): it checks the file belongs to that game, and every shader it names to that build's shader map, refuses anything else, and commits the new rows to `main`; later builds carry them. Maintainers can run `collect` by hand too (`--apply --close`). `./tools/shader_list.py stats` shows each list. This works the way [MacNativeGames](https://github.com/ly05010419/MacNativeGames) shares Tears of the Kingdom's shader list, by ly05010419.

Other improvements are welcome too: speed-ups, fixes, testing on other Macs, game updates and new games. Open an issue with the log and screenshots, or a pull request. Give speed-ups an off switch and check that the picture is unchanged. Never attach game files, shader dumps, Metal libraries, saves or built apps.

## Licences and credits

MIT. The engines are separate repositories under their own licences ([switch2mac-engine](https://github.com/azmasm/switch2mac-engine): MIT, except its `nx2_lower` (GPL-3.0-or-later) and third-party code). Built on nxnative by seedds, the Switch 2 patch series by potentialad9091, Eglantine's shader lowering, Ryujinx's shader translator and xFractals' pokopia-native; the shared pipeline list and the overlay / settings panel design follow MacNativeGames by ly05010419. Details: [NOTICE.md](NOTICE.md), [LEGAL.md](LEGAL.md).
