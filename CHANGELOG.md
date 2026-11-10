# Changelog

## 2026-11-10 (3): switch2mac app 0.4.4

- **Games no longer start hidden:** with **Close switch2mac while playing** on, switch2mac now waits until the game is on screen before it closes. It closed half a second after starting the game, and a game that takes longer to go full screen (Tears of the Kingdom) was left running out of sight until its Dock icon was clicked. If a game hasn't shown after 45 seconds, switch2mac brings it to the front itself.

## 2026-11-10 (2)

- **Tears of the Kingdom 1.0.0 (MacNativeGames build):** loading a save near Zora's Domain and some other areas no longer crashes. switch2mac adds the fix lili2029 found on MacNativeGames #1742 (the game's own scenery memory made 64 KB) to every MacNativeGames build until MacNativeGames has it. Rebuild Tears of the Kingdom to get it.

## 2026-11-10 (1): switch2mac app 0.4.3

- **Quick try:** for nxnative builds with a shared shader list, the Build page offers a build of only the shaders players have actually used, in about half the time. It's handy for trying a game; a full build can follow later.
- **Every build says what it plays:** the Build page lists each build with the game version it plays. A build that doesn't fit your files is shown in red with the reason. A MacNativeGames build that is known to fail (wrong update, missing firmware) is stopped before it starts. You can leave an update out, choose a firmware folder, try **Your own build…** from a fork's link, or **Clear** the page.
- **MacNativeGames builds** show their four steps (game code, game data, startup shaders, the app) with the time left. Their Homebrew packages are optional rows in Build tools, installed during setup when Homebrew is there.
- **Library:** Switch files are recognised by name, and a file with no build yet is listed with a note instead of hidden. Apps made by MacNativeGames (Tears of the Kingdom and others) now show as built. An update file chosen by mistake switches to its base game.
- **Settings › Where your files are:** every place switch2mac and your games keep files (games, saves and settings, build leftovers, logs, your dumps and keys folders), with sizes and Show in Finder. Nothing there deletes. **Uninstall** now removes everything switch2mac put on your Mac except your games, their saves and your own files, and says so first.
- **Clearer words:** builds are named after their project (nxnative, switch2mac, MacNativeGames, a person's fork), with no more "engine". The library setting is called "Your games folder". What's New explains its coloured dots.
- **In game:** the performance overlay (key 1) shows the build's name at the right edge of the box. The settings panel (key 2) fits its rows to the window, so the last ones are no longer hidden.
- **Quitting during a build asks first:** "<game> is still building", with **Keep building** or **Quit and stop the build**.

## 2026-11-08 (3): switch2mac app 0.4.2

- **Storage:** a new **Settings › Storage** card shows what building leaves on your Mac (each game's build files and engine copies no build uses), with their sizes, and one **Clean up** button. Your games, saves, settings, the games' own shader caches, your dumps and keys always stay; a later rebuild only takes longer. Engine copies no build uses are now also removed after each build.
- **The Build page shows what's in your file:** the update or DLC inside an `.nsp`, a card image or a `.nup`, or a dump folder's update, read from the file's plain table of contents (nothing is decrypted). A `.nup` a build can't read directly is unpacked for it.
- **133 more Switch games:** every Switch game nxnative has a profile for gets a page with its tested build, shared shader list and reports, and the update bot checks them once a day. Smash Bros. Ultimate, Octopath Traveler 0, Metroid Dread, Kirby and the Forgotten Land and Mario vs. Donkey Kong offer nxnative's build beside MacNativeGames'.
- **Fixed:** an opened game case could get stuck and ignore every click while a game ran; app builds stopped with "run switch2mac setup first".

## 2026-11-08 (2)

- **Legal and housekeeping:** clearer LEGAL.md (what switch2mac is for, what it never does or helps with), licences shipped inside the app, an automatic guard against keys and game links in issues, a Problem form, and an up-to-date README and credits.

## 2026-11-08 (1): switch2mac app 0.4.1

- **Downloads open again:** the app now comes as an installer, `switch2mac-0.4.1.pkg`. macOS called the downloaded 0.4.0 (and 0.3.4) app "damaged" with no way to open it: switch2mac has no paid Apple Developer ID, and the zip's signature was also broken by files written into it after signing. The installer gets the usual **Open Anyway** in Privacy & Security once, and the app opens normally after that. The zip stays for the app's own updates, and its signature is checked before every release.
- **Settings:** "While you play" is now one switch, **Close switch2mac while playing**: on, it closes when a game starts and opens again when you quit; off, it stays open and comes back to the front.
- **Setup:** the first-start pages talk about Switch and Switch 2 games and what switch2mac needs them for (no iPhone or iOS SDK talk, Switch games' own prod.keys mentioned, + Build game instead of the old Builds page).

## 2026-11-07 (1): switch2mac app 0.4.0

- **Switch games:** build your Nintendo Switch games too, from their `.nsp` / `.xci` files and your own `prod.keys` (passed to the builder only, never copied, kept or uploaded: see LEGAL.md). Their update and DLC are found beside them by title ID, or added on the Build page; a cartridge with two games builds the one you pick. Super Mario Bros. Wonder built and played at 60 fps on an M1 Max.
- **More builds per game:** [MacNativeGames](https://github.com/ly05010419/MacNativeGames) (MIT, credited in NOTICE.md) is a new builder, recommended for **Tears of the Kingdom** and **Breath of the Wild** (new game pages, not built here yet), with nxnative's builder beside it.
- **A new Library:** your games as 3D game cases in a **Carousel**, a **Flipbook** or a **Stack**, or as **Covers**, or the **Row**. Click a case to open it (the booklet and cartridge slide out), click it again to play; drag, scroll, the arrow keys or a controller browse. Retail box fronts from GameTDB and the LaunchBox Games Database are downloaded onto your Mac (Settings › Box art turns them off). After [PyroCade](https://github.com/Pyrodrifter/PyroCade)'s look (MIT; idea only, no code or assets).
- **Sounds:** a soft glass tick as you move through your games, a lighter one on hover; the speaker in the Library's bar mutes them.
- **Controllers:** the 3D views, the open case, the view and console switches all work with a controller.
- **Light while you play:** switch2mac lets go of its pictures while a game runs. **Settings › While you play** chooses whether it stays open, comes back when the game quits, or closes and opens again after; if your Mac runs short of memory during a game, it offers to close.
- **Lighter overall:** pictures read at the size they're shown, one loader for all of them (a long build could push the app past a gigabyte), and the 3D views draw only while something moves.
- **New icon:** the same laptop between its green and red grips, now with a warm gold glow and no "2" on the screen.
- **Fixed:** a game from the Library opened the Build page as an iPhone build; the app no longer asks for the iOS SDK; Build updates in What's New show five, then Show more.

## 2026-11-06 (9): switch2mac app 0.3.4

- **`.nup` files in the app:** the Build page's **Choose folder or .nup…** takes a `.nup` file as well as a dump folder, and the app says so where you choose your dumps (one folder or `.nup` file per game).

## 2026-11-06 (8)

- **`.nup` dumps:** a game packed as one `.nup` file can be built as it is: choose the file, or a folder that holds it. The app reads which game and version it is and recommends a build that opens it (every build on nxnative's builder; Mario Kart World's switch2mac build still needs a dump folder). A copy cut short is caught before anything is built. Choosing the `.nup` file itself in the Build page needs the next app release; a folder holding it works now.

## 2026-11-06 (7): switch2mac app 0.3.3

- **What's New:** the News dates now show the day each change was published, wherever you are (west of UTC they showed the day before).
- **Shader lists:** after **Send**, only the file to drag in is left in the folder (an emptied file beside it was being sent instead), and every list sent is now checked and added within minutes, with a thank-you on the issue: everyone's next build prepares those shaders. Files attached in a comment count too.

## 2026-11-06 (6)

- New builds from other Mac ports (all MIT, credited in NOTICE.md): **Mario Kart World** gets [mkw-neo](https://github.com/MenAtCafe/mkw-neo) (a race in about 4 GB) and [nxnative-mkw](https://github.com/Thijs2004/nxnative-mkw) (the first build for update 1.8.0); **Donkey Kong Bananza** and **Pokémon Pokopia** get [horizon-nx2](https://github.com/joaoalvess/horizon-nx2), tuned on a fanless MacBook Air.
- The recommended build now looks at your dump first, then your Mac: a build is only recommended for game versions it plays (Mario Kart World 1.8.0 gets the 1.8.0 build), then 16 GB or less and MacBook Airs get the lightest build, and other Macs keep the builds they had. Ocarina of Time's kid-with-sword-remake is now also recommended on Macs with 16 GB or less.

## 2026-11-06 (5)

- The Legend of Zelda: Ocarina of Time: on a MacBook Air the app now recommends the kid-with-sword-remake build, which was made and tested on one; other Macs keep nxnative's build.

## 2026-11-06 (4)

- The Legend of Zelda: Ocarina of Time gets a second build: [kid-with-sword-remake](https://github.com/cheemu21/kid-with-sword-remake), cheemu21's nxnative port of the game (Ocarina fixes ahead of upstream, a 30 / 60 fps frame step, MetalFX upscaling). Pick it with **Build with…**; nxnative's build stays the default. Thanks to cheemu21.

## 2026-11-06 (3)

- Shader lists: The Legend of Zelda: Ocarina of Time's build gains 796 rows (#19, #21); Mario Kart World's nxnative build gains 246 rows (#20). A list recorded with an earlier nxnative commit is now taken when every shader it names is in the current build.

## 2026-11-06 (2)

- Shader lists: The Legend of Zelda: Ocarina of Time's build gains 10,067 rows (#18); Mario Kart World's nxnative build gains 2,246 rows (#16, #17).

## 2026-11-06 (1): switch2mac app 0.3.2

- **What's New:** a new game's line now says only when it was added and which engine builds it. The build page already marks untested builds.
- New game: The Legend of Zelda: Ocarina of Time, built with nxnative.

## 2026-11-05 (12): switch2mac app 0.3.1

- **A new icon:** the Mac-as-handheld, now lit from behind with a warm glow and standing on a lit floor.
- **What's New opens straight away**, and News shows five more at a time (Show more) instead of everything at once.
- **Performance:** a run's numbers line up in even columns.
- Shader lists: Mario Kart World's nxnative build gains 8,503 rows (#13, #14, #15). Lists sent for a game's second build now reach that build.

## 2026-11-05 (11)

- Shader lists: Mario Kart World's switch2mac build gains 1,049 rows (#11).

## 2026-11-05 (10): switch2mac app 0.3.0

- **New What's New tab.** News about switch2mac first (the newest five, Show all for the rest), then new games, every build update day by day, and nxnative's latest changes with the games each one names. A dot on the tab shows something arrived since you last looked.
- **Update available in the Library.** When a newer build of one of your games is out, its banner says so: click to see what changed since your build, and Rebuild (your saves are kept).
- **Performance shows your last 20 runs** as a history: the newest in full, the others one line each; click one for its numbers and Share.
- **+ Build game replaces the Builds tab.** It opens the build page, and shows a running build.
- Builds now update reliably: GitHub's updater runs on a Mac with Xcode 27, which nxnative's newest code needs.

## 2026-11-05 (9)

- Builds now check for updates every 5 minutes instead of every 30 (the shortest GitHub allows; GitHub sometimes starts a check a few minutes late).
- Shader lists: Mario Kart World's nxnative build gains 388 rows (#10).

## 2026-11-05 (8): switch2mac app 0.2.0

- **New Performance tab** in the app, between Builds and Settings. It shows your last three game runs: average, lowest and highest frame rate, 1% low, peak memory, and GPU and CPU use, read from the game's own log when it closes. Nothing leaves your Mac.
- **Share** on a run fills in the How it ran form for you (game, build, your Mac's model, chip and memory, macOS, frame rate, memory) and lets you add a comment; you check it on GitHub and press Create.
- The How it ran form's Game and Build questions are now text boxes, so the app can fill them in.

## 2026-11-05 (7)

- **Tell others how a game ran, and it's added for you.** Fill in the How it ran form (now with Star Fox, the build version and untested builds): it is read automatically and becomes a row in the game's reports, once a maintainer has checked it. Reports now record their date and build version.

## 2026-11-05 (6)

- **Builds now keep themselves up to date.** Every 30 minutes GitHub checks each game's engine for a newer version, and nxnative for new Switch 2 games; anything that passes a compile check is added here automatically, and your app picks it up when it opens.

## 2026-11-05 (5)

- New game: **Star Fox**, built with nxnative. nxnative reports it plays through the title, the prologue and the tutorial flight at 56–60 fps on an M4 Pro.

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
