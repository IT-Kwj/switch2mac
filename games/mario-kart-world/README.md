# Mario Kart World

Title ID `0400C3F00006E000`. Profile: [`dm/games/0400C3F00006E000` in hermit-engine](https://github.com/azmasm/hermit-engine/tree/switch2mac/dm/games/0400C3F00006E000).

| Version | Title version | Status |
|---|---|---|
| 1.0.0 | 0 | Tested on an M1 Max (64 GB, macOS 26): title, menus, Grand Prix, free roam, traffic and movies; ~58 fps in races with Performance mode on, 2560x1440. Handheld console mode tested on an M1 Pro (16-core GPU, 32 GB, macOS 27): races at a locked 60 fps (GPU ~14.3 ms a frame); docked on the M1 Pro: ~26 ms, so the game paces at 30 |
| any update | — | **Untested** |

> **16 GB Macs:** Mario Kart World currently needs about 13-16 GB of memory, up to about 20 GB in long free roam, so on a 16 GB Mac it may not run smoothly. Optimizations are under way ([Known issues](#known-issues)).

## Four builds

Mario Kart World can be built four ways. Same game, same save; each has its own shared shader list.

| Build (`--engine`) | Engine | Game version | Suits | Why |
|---|---|---|---|---|
| `switch2mac` (in the app: azmasm's build) | [hermit-engine](https://github.com/azmasm/hermit-engine) | 1.0.0 | M1 and M2 with 24 GB or more | Faster there (about 58 fps against 47 on an M1 Max); Performance mode; the run-time shaders taken from the dump |
| `nxnative` | upstream nxnative (commit in `game.json`) | 1.0.0 | M3 and newer, and Macs with 17-23 GB | nxnative's own Switch 2 shader translator runs better on newer chips; shares terrain tiles, so it needs less memory |
| `mkw-neo` | [MenAtCafe/mkw-neo](https://github.com/MenAtCafe/mkw-neo) (MIT) | 1.0.0 | 16 GB or less, and every MacBook Air | Tuned to fit 8 GB: a race holds about 4 GB (40-58 fps on a MacBook Neo, every course played) |
| `nxnative-mkw` | [Thijs2004/nxnative-mkw](https://github.com/Thijs2004/nxnative-mkw) (MIT) | 1.8.0 (update v917504) | any Mac whose dump has the 1.8.0 update | The only build here with a 1.8.0 profile |

`./switch2mac.py build` picks one for your dump and your Mac (`game.json` "choose", first rule that fits): a dump with the 1.8.0 update gets `nxnative-mkw`; otherwise 16 GB or less or a MacBook Air gets `mkw-neo`, less than 24 GB or an M3 and newer `nxnative`, and the rest `switch2mac` (azmasm's build). `./switch2mac.py builds <dump>` shows the choice, why, and how each ran on players' Macs (`reports.tsv`). `--engine <id>` builds another one; the Hermit app has a Build menu for it. Installing another build keeps your save; the old build's pipeline record is put aside, since the engines name shaders differently.

## Build

azmasm's build uses [hermit-engine](https://github.com/azmasm/hermit-engine), fetched at the commit `game.json` names. Your dump of 1.0.0: a folder with `exefs/` (main, main.npdm, sdk, subsdk0, rtld) and `romfs/`, or `base/exefs` and `base/romfs`. About 50 GB free disk during the build (the game image is 22 GB; on the same APFS disk the app shares it instead of copying it). The shader step takes 10-20 minutes the first time, on every core.

In the Hermit app: choose your dump folder on the **Builds** page and press **Build** (it shows which of the [two builds](#two-builds) your Mac gets). In Terminal:

```bash
./switch2mac.py build "<your dump folder>"
```

```bash
./switch2mac.py install
```

`build` writes only into `./work`:

1. **Game files**: the code modules and one RomFS image (dump-tool leftovers such as `.listing` files are left out).
2. **Code**: rewrites the game's modules so they run on the Mac.
3. **Shaders**: takes the shaders from the game's archives and the ones it builds at run time from the dump (`runtime_shaders.tsv`), lowers them, translates them to Metal and compiles them.
4. **Host** (the native runtime) and **app**.

### First start: a short "preparing" screen

The first launch is complete: about 320 of the game's shaders (among them all its mesh shaders for roads and ground) are not in its shader archives because the game builds them while it runs, and `build` takes them straight out of your dump (`runtime_shaders.tsv`).

The repository also carries this game's **shared shader list** ([`shader_list.tsv`](shader_list.tsv), shipped as the app's `pso_manifest.tsv`): the ~12,000 shaders and Metal pipelines met while playing Grand Prix, free roam and the menus. The app builds them all behind a progress screen before the first frame, once; later starts take about 10 seconds. Without it every new place stutters the first time. Places nobody has recorded yet can still stutter once.

If something still looks missing after a while (a shader the list does not cover, e.g. in a mode not tested), the app saves it; then:

```bash
./switch2mac.py refresh
```

```bash
./switch2mac.py install
```

## Settings (key 2)

| Setting | Default | What it does |
|---|---|---|
| Performance overlay | Compact | Same as key 1 |
| Display mode | Window | Window or full screen |
| Console mode | Docked | What the game is told |
| Upscaling | Standard | MetalFX for the final picture on large screens |
| Performance mode | On | Skips one environment-reflection update (~4 ms a frame); off = full reflections, a few fps lower |
| Encode thread | On | Encodes GPU work on its own thread (~10 fps) |
| Frame buffering, Metal 4 pipelines, Pipeline prebuild | tested defaults | Advanced |
| Rumble, strength, cutoff | On | Controller rumble |

## Files here

| File | What |
|---|---|
| `game.json` | title ID, name, version and RomFS marker: how `switch2mac.py` knows this game; its two builds (`builds`: engine, commit, shader list) and which Mac gets which (`choose`) |
| `reports.tsv` | how the game ran on players' Macs, per build (Mac, chip, memory, macOS, fps, peak memory, notes, source): what `choose` is decided from. Only reports that name the Mac |
| `shader_list.tsv`, `shader_list-nxnative.tsv` | the shared shader list of each build |
| `launcher.py` | writes the app's settings list (`Resources/dm/launcher.json`): nxnative's generic settings plus Performance overlay, Performance mode and this game's defaults |
| `runtime_shaders.tsv` | where each of the 321 shaders the game builds at run time sits in the dump (file, offset, size, checked by its key); `build` extracts them so the first launch has no black screen, black minimap, frozen intro movie or missing models |
| `env.txt` | switches baked into the app (`DM_FPS=60`: frame pacing statistics fixed at 60 so macOS's 30 Hz power-saving pacing never starts) |

## Known issues

- **Lamp lights shine through walls at night** (local-light shadows are ignored). Not investigated yet.
- **Not a locked 60**: about 58 fps in races. The game's own frame-rate controller switches to 30 fps pacing whenever a frame takes longer than 16.7 ms, so heavy moments feel uneven.
- **Performance mode** skips the update of one environment-reflection chain (pixel shader `83ea368cd702b9de`, ~4 ms a frame on the Mac for reasons not found yet). No visible difference was seen in play; turn it off in the settings for full reflections.
- **Shadows / detail in the distance** can flicker when driving fast (may be the game's own detail switching).
- **Memory: 16 GB Macs may not run it smoothly.** It uses 13-16 GB in races and up to about 20 GB in long free-roam sessions, so a 16 GB Mac can stutter, slow down or ask you to quit other apps. Optimizing it is under way (Hermit never frees parts of the big terrain textures once loaded: the first fix). Macs with 24 GB or more have run it fine so far (tested on 64 GB, reported on 24 GB).
- **First start** shows a progress screen while the shared pipeline list (~12,000 entries) is built; a place the list lacks can still stutter once.
- **First start after each install** waits 1-3 minutes for macOS's scan of the app.
- Only the US English language list is offered (the dump has no control data).

## Other versions

The profile's `game.tsv` names version 1.0.0 by the build IDs of its modules (first 16 bytes each):

```
build	v0	1.0.0	main=9e244438c3d8ef1c703a6a85ef99c4f0	subsdk0=d39a7a3d44530bb61b35690e5b0383d5	sdk=90ebba182862b9ecdc21fcb87b999012
```

An update has other build IDs, and from 1.8.0 on also a `subsdk1` module and a newer SDK. To try one:

1. Pack the update's own `exefs/` and `romfs/` (an update dump's RomFS is the full patched tree) as the dump folder.
2. Add a `build` line for it in `game.tsv` (the IDs are printed when `build` stops) and the modules in its `modules` line, then run `build` again.
3. Expect differences: the update may move functions the rewriter patches, and the original 1.8.0 patch series found the movie player changed (1.8.0 decodes through `movie::VideoDecoder`, 1.0.0 through `nn::codec`; both are handled in hermit-engine's `dm/host`).

Please report what happens (log + screenshots, no game files). Mark such builds as untested. For 1.8.0 there is now a tested build, `nxnative-mkw` (above).
