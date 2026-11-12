# Mario Kart World on the Mac: how the port was made

A record of the problems found on the way from the first boot to a playable app, for anyone porting the next Switch 2 game. Version 1.0.0, Apple M1 Max. All fixes are in hermit-engine's ``.

## Starting point

- nxnative `main` (`8c0b8083`) plus its jump-table fix (`6a787668`), and the 8-patch Switch 2 series by potentialad9091 (NVN2 entry points, Eglantine's SM86 → Maxwell lowering via `nx2_lower`, hid / oe stubs, VP9 movies, sparse textures, a 1.8.0 profile).
- The profile was moved to 1.0.0: its build IDs, modules (`main subsdk0 sdk`) and a fresh shader split. Every one of 1.0.0's 6,546 packaged shaders already appeared in 1.8.0's table, so the shaders had not changed between versions.
- The rewriter's jump-table check counted float registers (`s1` read as `w1`); it now looks at `w` / `x` registers only.

## Boot and movies

- First run: menus rendered, but the window was black. The game itself presented correctly; the window showed it after a front-end fix.
- **Movies crashed** the game: 1.0.0 decodes VP9 through the low-level `nn::codec` API, not the `movie::VideoDecoder` class the 1.8.0 patches handle. New `hle_nx2_codec.c` takes over `nv::InitCheck`, `nn::codec::video`, the VP9 decoder, the image pool and `nn::syncpt` with libvpx, decoding on a worker thread per decoder.
- The Grand Prix intro froze on its first picture: the movie's frames went into an RGBA8 texture while the screen sampled the same memory as RGBA8_sRGB, which the host held as a second texture. A linear / sRGB twin is now a format view of one texture.

## The white world

The 3D world was pure white. Traced end to end:

1. The ambient-light compute shader read a dispatch size from its driver constants at NVN2's layout (`c0 +4 / +8`), which the host filled with NVN1's: 1 / 0 = inf → NaN in every record. Fixed in the host (`C0_NX2_DISPATCH`).
2. Then one thread in 256 still produced NaN: the Ryujinx translator dropped the branch after a subroutine call (`CAL`), so NVIDIA's slow-path square root fell through into the fast path (`rsqrt(0) × 0`). Fixed in the translator's decoder (the block after a `CAL` keeps its fall-through edge); 144 shaders with calls were affected.
3. Missing SM86 opcode `0x59f` (SURED, surface reduction) was added to the lowering.

## Ground, roads and mesh shaders

- **Mesh and task shaders** (Switch 2's mesh pipeline, used for roads, trails and ground details) were not supported anywhere. Added end to end: stage detection from the control section, lowering of the stage-memory opcodes `0x923` / `0x927` into shared-memory windows, Ryujinx → SPIR-V `TaskEXT` / `MeshEXT` (with `SPV_EXT_mesh_shader` added to Spv.Generator) → SPIRV-Cross → Metal object / mesh functions, per-primitive outputs, and `DrawMeshTasks` in the host as Metal `drawMeshThreadgroups`.
- A pass made only of mesh draws was stored "don't care" (Apple's tile memory dropped it); the mesh draw path now records its writes.
- **Invisible ground**: the terrain height tiles are filled by the CPU, some before their texture is even created, so the host never uploaded them. Texture flush / dirty uploads on, plus "filled before its init" detection.

## Traffic cars vanishing

Free-roam traffic flickered and vanished, also on the minimap. Long hunt (occlusion, depth, timing, readbacks, game logic all ruled out), then found in the GPU: the compute shader that builds the cars' bone matrices keeps 144 bytes per car in 48 KB of shared memory, but the split declared Ryujinx's 4 KB default, so only ~28 cars had bones and the rest collapsed to a point. The split now reads the shared-memory size from the control section (capped at Metal's 32 KB).

## Speed: 20 → 58 fps

- **Switch 2 system clock**: the game reads a 31.25 MHz tick; the host served the Switch 1's 19.2 MHz, so every time span the game measured was off by 1.6×. Ported from upstream: from a locked 30 to 41 fps, at normal game speed.
- Sparse-texture page-table walks dominated the submit thread: per-pool generations, range max-generation and a run cache.
- **Shader constants hoisted**: Apple's compiler re-loaded uniform buffer entries at every use through the argument buffer; each function now loads them once (with the unused border-colour emulation removed): GPU time 23 → 18 ms.
- **Encode thread**: Metal encoding moved off the game's render thread (`DM_NVN_ENC_THREAD`): 50 fps.
- **Load skipping**: a pass whose first draw provably covers every pixel no longer loads its attachments (full-screen draws use half-float positions and 8-bit indices, which the proof now reads): 51 fps.
- **Performance mode**: one reflection chain costs ~4 ms on the Mac (its shader is fast offline; the cause is still open); skipping its update gave ~58 fps with no visible difference in play.

Tried and dropped: render-resolution changes (the game sizes its 3D targets from data), asynchronous submission (bloom regressions), a newer Eglantine lowering (binding layout incompatible), refreshing the reflection chain every Nth frame.

## A complete first launch

About 320 shaders (the final screen copy, the movie colour conversion, the minimap, character models, all mesh shaders) are created by the game at run time, so a fresh build showed a black screen until they were captured. They are in the dump after all, inside `BAHS` containers (`Lib/agl`, `Lib/gsys`, `Lib/Terrain`, `Shader/Drive…sarc`) and loose in `main`, which the BNSH-only split does not read; their control sections are templates shared by many programs, so the pairing cannot be read from the files alone. `games/mario-kart-world/runtime_shaders.tsv` records where each control section and code block sits (key = first 16 bytes of SHA-256 over control `[:0xd8]` + code, checked on extraction), and `build` feeds them to the split as captures.

## Smaller fixes

- Boot crash when the window was not in focus: the game's focus handler read a global still null at boot. The host reports "in focus" until the game's 300th frame.
- A `RED_ONCE` table overflow (140 entries, ids up to 921) wrote past its array.
- "Press L+R" at the title also takes A: the game's own rule for Pro Controller / handheld, left as is.

## App

`dm/mac/pack_app.py` packs the host, rewritten modules, Metal libraries, RomFS image and fonts into one app (APFS clones on the same disk). Hermit added the in-game overlay (key 1) and settings panel (key 2), a no-window launch that applies every setting, and run-time shader capture into the app's support folder for `hermit.py refresh`.
