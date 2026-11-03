# Notices and credits

switch2mac is built on other people's work. Thank you to all of them.

| Part | Where | Licence | Credit |
|---|---|---|---|
| nxnative (host runtime, code rewriter, shader pipeline, Mac launcher) | `nxnative/` | MIT (`nxnative/LICENSE`) | [seedds/nxnative](https://github.com/seedds/nxnative), branch `main` at `8c0b8083` + `6a787668`, with switch2mac's changes |
| Switch 2 groundwork: NVN2 entry points, Ampere-to-Maxwell lowering hookup, hid / oe / chat stubs, VP9 movies, sparse textures, the first Mario Kart World profile | folded into `nxnative/` | as nxnative | the 8-patch series posted by Reddit user potentialad9091 (r/macgaming), written for update 1.8.0 |
| `nx2_lower` (SM86 → Maxwell shader lowering) | `nxnative/dm/gfx/tools/nx2_lower/` | GPL-3.0-or-later | [Eglantine](https://github.com/djihads80/eglantine) (Eden-based); switch2mac added opcodes 0x59f, 0x2bf, 0x923 / 0x927 |
| Ryujinx shader translator (with switch2mac's task / mesh shader support) | `nxnative/dm/third_party/ryujinx/` | MIT | [Ryujinx](https://github.com/Ryujinx/Ryujinx) |
| libvpx, stb_vorbis, Vulkan headers, NVIDIA FLIP | `nxnative/dm/third_party/` | their own (see `nxnative/dm/third_party/README.md`) | their authors |
| SM86 opcode table used to decode SURED / UPOPC | not included | — | [CuAssembler](https://github.com/cloudcores/CuAssembler) |
| Shared shader / pipeline list (players share the pipelines they meet so new installs build them up front) | the idea behind `tools/pipelines.py` and the profile's shared `pso_manifest.tsv`; own code | MIT | from [MacNativeGames](https://github.com/ly05010419/MacNativeGames) by ly05010419 and its [shared shader list](https://github.com/ly05010419/MacNativeGames/blob/main/docs/shader-list.md) |
| Settings panel and overlay look | own code, `nxnative/dm/host/front_mac.m`, `nxnative/dm/mac/Launcher.swift` | MIT | inspired by [MacNativeGames](https://github.com/ly05010419/MacNativeGames) by ly05010419 (MIT) |

Nintendo, Nintendo Switch 2 and Mario Kart are trademarks of Nintendo. This project is not affiliated with or endorsed by Nintendo.
