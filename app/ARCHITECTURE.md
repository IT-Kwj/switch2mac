# The switch2mac app

The Mac app players download (`switch2mac-macOS-arm64.zip` on Releases). It is a front end: the work happens in `switch2mac.py`, which the app runs from its own copy of this repository. It began from [NX2Apple](https://github.com/LNPANDY/NX2Apple)'s launcher (MIT; its licence and notice are kept in `LICENSE-NX2Apple` and `NOTICE-NX2Apple`, as the licence requires) and is its own app: its own name, bundle, folders and release channel, sharing nothing with NX2Apple on a player's Mac.

## The four parts

One SwiftPM package. Each target may only import the ones above it in this table; `Package.swift` enforces it.

| Target | Holds | May import |
|---|---|---|
| `NXCore` | pure logic and services: version checks, release download, process running, the toolchain checks, the bundled tools | Foundation |
| `NXModel` | the stores the screens observe: the build (`BuildStore`), the repository copy (`RepoStore`), the dependencies, app updates | `NXCore`, Foundation, Combine |
| `NXLauncher` | shared views: cards, rows, buttons, the palette and fonts | `NXModel`, `NXCore`, SwiftUI, AppKit |
| `Switch2Mac` (the app) | the window, its pages and the wiring (`LauncherStores`) | all |

Everything the app keeps on a Mac is its own: `~/Library/Application Support/switch2mac/` (its repository copy, builds, engines), its preferences (`io.github.azmasm.switch2mac`), and its update channel (this repository's Releases).

## The Library

| Part | Files |
|---|---|
| The 3D shelves (Carousel, Flipbook, Stack): SceneKit cases, hover, drag and scroll, drawn only while something moves | `CaseScene.swift`, `CaseCarousel.swift` |
| Open case (cover, booklet, cartridge; click to play, click off to go back) | `OpenCase.swift` |
| Covers and the Row; box fronts (GameTDB, LaunchBox) and eShop banners | `CoverArt.swift`, `BoxArt.swift`, `Artwork.swift` |
| One loader for every picture (a new ask cancels the last; pictures kept until their file changes) | `ArtworkLoader.swift` |
| Light while a game runs: pictures let go, the load watcher, While you play | `MemoryTrim.swift`, `PlayLoad.swift`, `ReturnAfterPlay.swift` |
| Interface sounds, made in code | `InterfaceSound.swift` |

## How it drives switch2mac

- **Its copy of the repository.** At first start the app clones `azmasm/switch2mac` into `~/Library/Application Support/switch2mac/repo` and pulls `main` each time it opens (`RepoStore`). New games, builds and fixes in `games/`, `switch2mac.py` and `tools/` reach players this way, with no new app release.
- **Identifying a dump.** The Builds page runs `switch2mac.py identify <folder>`, which answers with one JSON line: the game, its builds, the one this Mac gets and why, and players' reports (`DumpInfo`, `BuildStore+Switch2Mac.swift`). A damaged dump is named here.
- **Building.** `switch2mac.py build <folder> --progress json [--engine <id>]` writes one event per line (stage, step, progress, time left); `BuildStore` reads them into the progress card. Then `switch2mac.py install --to <Output folder>` (Settings, `/Applications` by default). Each game builds in its own work folder under `~/Library/Application Support/switch2mac/builds/<title ID>`.
- **Several builds of a game.** The Build card (`BuildPage.swift`) shows the recommended build and its reports; the choice is kept per game and passed as `--engine`. The Library names the installed build, and Manage offers the others (`GameBuilds.swift`).
- **Your Mac.** `MacSpecs.swift` reads the chip, cores, memory and macOS for the Your Mac card; nothing leaves the Mac.
- **Banners.** Official eShop banners are downloaded onto the player's Mac at run time (`Artwork.swift`); `BannerFocus.swift` frames each around its title. Games without one get an original cover (`GameCover.swift`).

## What it does not do

No keys and no decryption (switch2mac reads extracted dumps), no cheats. The original launcher's iPhone and iPad install and signing code is still in the source but switch2mac never reaches it (the app is Mac only); it is kept for a possible iPhone version.

## Building and testing

```bash
tools/make_app.sh
```

makes `build/switch2mac.app` for this Mac, using the Python and tools it finds. A release adds Python and the build tools inside the app and must hold no path of the Mac that built it (the script checks):

```bash
tools/make_app.sh release --bundle-tools
```

```bash
tools/check_bundle.sh release/switch2mac.app
```

```bash
swift test
```

Tests of pure logic go in `NXCoreTests`, which links nothing but `NXCore`. Tests of NX2Apple flows switch2mac never reaches are skipped with their reason. The app's texts are in `l10n/en.json` (English only for now).

## Releases

The version is `appVersion` in `Sources/NXModel/AppUpdateStore.swift`. A release on GitHub carries `switch2mac-macOS-arm64.zip`; installed apps find it through `releases/latest` (so never mark it a pre-release) and offer to update themselves. The app is signed ad hoc, not with a Developer ID: the first open needs **Open Anyway** in Privacy & Security.
