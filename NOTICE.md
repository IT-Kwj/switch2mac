# Notices and credits

switch2mac is built on other people's work. Thank you to all of them.

| Part | Where | Licence | Credit |
|---|---|---|---|
| nxnative (host runtime, code rewriter, shader pipeline, Mac launcher) | [switch2mac-engine](https://github.com/azmasm/switch2mac-engine), a fork of nxnative fetched at build time (not in this repository) | MIT | [seedds/nxnative](https://github.com/seedds/nxnative), forked at `6a787668`, with switch2mac's changes |
| nxnative engine and builder for every game built with it (not copied: fetched at build time into `engines/`) | each game's `game.json` names the commit | MIT | [seedds/nxnative](https://github.com/seedds/nxnative) at the commit each game pins, with its game profiles; switch2mac adds its overlay and settings panel at build time (`tools/engine/patch.py`) |
| pokopia-native (Pokémon Pokopia builder, Switch 2 patch for nxnative, shader lowering) (not copied: fetched at build time into `engines/`) | `games/pokemon-pokopia/game.json` names the commit | MIT | [xFractals/pokopia-native](https://github.com/xFractals/pokopia-native) at `6eed8c8`; switch2mac adds its overlay and settings panel at build time |
| Switch 2 groundwork: NVN2 entry points, Ampere-to-Maxwell lowering hookup, hid / oe / chat stubs, VP9 movies, sparse textures, the first Mario Kart World profile | in switch2mac-engine | as nxnative | the 8-patch series posted by Reddit user potentialad9091 (r/macgaming), written for update 1.8.0 |
| `nx2_lower` (SM86 → Maxwell shader lowering) | switch2mac-engine's `dm/gfx/tools/nx2_lower/` | GPL-3.0-or-later | [Eglantine](https://github.com/djihads80/eglantine) (Eden-based); switch2mac added opcodes 0x59f, 0x2bf, 0x923 / 0x927 |
| Ryujinx shader translator (with switch2mac's task / mesh shader support) | switch2mac-engine's `dm/third_party/ryujinx/` | MIT | [Ryujinx](https://github.com/Ryujinx/Ryujinx) |
| libvpx, stb_vorbis, Vulkan headers, NVIDIA FLIP | switch2mac-engine's `dm/third_party/` | their own (see switch2mac-engine's `dm/third_party/README.md`) | their authors |
| SM86 opcode table used to decode SURED / UPOPC | not included | — | [CuAssembler](https://github.com/cloudcores/CuAssembler) |
| Shared shader lists (one per game; players send the shaders and pipelines their app built, through a GitHub form, so new installs build them up front) | the idea and the way it works: `tools/shader_list.py`, switch2mac-engine's `dm/host/s2m_share.m` (copy: `tools/engine/s2m_share.m`), `.github/ISSUE_TEMPLATE/shader-list.yml`, `games/<game>/shader_list.tsv`; own code | MIT | from [MacNativeGames](https://github.com/ly05010419/MacNativeGames) by ly05010419 and its [shared shader list](https://github.com/ly05010419/MacNativeGames/blob/main/docs/shader-list.md) (Tears of the Kingdom's) |
| The switch2mac app (`app/`): its design, screens and build progress | `app/`, adapted from NX2Apple's Mac launcher at `668c1131` | MIT (`app/LICENSE-NX2Apple`, `app/NOTICE-NX2Apple`) | [NX2Apple](https://github.com/LNPANDY/NX2Apple) by LNPANDY and its contributors; Manrope font by Mikhail Sharanda (SIL OFL, `app/fonts/Manrope-OFL.txt`) |
| Settings panel and overlay look | own code, switch2mac-engine's `dm/host/front_mac.m` and `dm/mac/Launcher.swift`, `tools/engine/s2m_ui.m` | MIT | inspired by [MacNativeGames](https://github.com/ly05010419/MacNativeGames) by ly05010419 (MIT) |

Nintendo, Nintendo Switch 2 and the names of the games are trademarks of Nintendo and their other owners (Pokémon: Nintendo, Creatures and GAME FREAK; Hyrule Warriors: Nintendo and Koei Tecmo). This project is not affiliated with or endorsed by Nintendo.
