# The Legend of Zelda: Ocarina of Time

Title ID `0400486024DEC000`, update v131072. Added automatically when [nxnative](https://github.com/seedds/nxnative) added its profile: see [nxnative's notes on it](https://github.com/seedds/nxnative/tree/5636e7a7cfe67745f2eacedabc02c298290b44ab/dm/games/0400486024DEC000) for how far it plays and on which Mac.

Built with nxnative's own builder at the commit `game.json` names (fetched once into `./engines`), with switch2mac's front end added (`tools/engine/patch.py`): the game starts at once, **key 1** is the performance overlay and **key 2** the settings.

| What | |
|---|---|
| Profile and notes | [nxnative `dm/games/0400486024DEC000`](https://github.com/seedds/nxnative/tree/5636e7a7cfe67745f2eacedabc02c298290b44ab/dm/games/0400486024DEC000) |
| Dump folder | `base/` and `updates/131072/` |

## Shared shader list

[`shader_list.tsv`](shader_list.tsv): this game's own list of shaders and pipelines players have met, for this engine version only. It starts empty: when you close the game, the app offers to send what it built.

## How it runs on players' Macs

[`reports.tsv`](reports.tsv): every report that names the Mac. Tell others how it ran with the [How it ran](https://github.com/azmasm/switch2mac/issues/new?template=how-it-ran.yml) form.

## Build

In the switch2mac app: choose your dump folder on the **Builds** page and press **Build**. In Terminal:

```bash
./switch2mac.py build "<your dump folder>"
```

## Second build: kid-with-sword-remake

[cheemu21/kid-with-sword-remake](https://github.com/cheemu21/kid-with-sword-remake) (MIT) is an nxnative fork made for this game, on iPhone and Mac: nxnative's Ocarina of Time branch with Ocarina pull requests merged ahead of upstream (foliage, the Hyrule Field crash, the freeze after the talk with Saria, terrain holes, faster GPU memory tables), fewer render-pass splits, a 30 / 60 fps frame step through the game's own frame-rate controller, MetalFX in place of the game's upscaler and a texture memory release. Its author reports a steady 60 fps at 720p on a MacBook Air M5 (16 GB) using about 9.5 GB; see [its notes](https://github.com/cheemu21/kid-with-sword-remake/blob/kid-with-sword-remake/docs/games/kid-with-sword-remake.md).

switch2mac builds it as it builds nxnative (`--engine kid-with-sword`), with the same front end added, and bakes in the port's recommended Mac switches (`"switches"` in `game.json`: MetalFX upscaling, a fixed frame rate, its 8 GB alias region). Its shader list is [`shader_list-kid-with-sword.tsv`](shader_list-kid-with-sword.tsv). The port's fixed-resolution files (`scripts/oot_res_overlay.py`, 720p handheld / about 1080p docked) are not made by switch2mac yet, so it renders at the game's own dynamic resolution. The app recommends it on a MacBook Air, where it was made and tested, and on Macs with 16 GB or less (it releases texture memory); other Macs get nxnative's build.
