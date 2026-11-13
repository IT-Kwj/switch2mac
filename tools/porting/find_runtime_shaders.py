#!/usr/bin/env python3
"""Make games/<game>/runtime_shaders.tsv: where in the dump each shader the game builds at run time sits.

Some Switch 2 shaders are not in the containers the shader split reads (BNSH): the game assembles them while it runs from parts kept in other
containers (e.g. BAHS in Lib/agl, Lib/gsys, Lib/Terrain, Shader/*.sarc) or in main. The host saves each one it meets (DM_NVN_SHDUMP) as
<key>.ctl (control section) + <key>.code, key = sha256(control[:0xd8] + code)[:16]. This tool finds both parts in the game files and writes
their positions (no game data), so `hermit.py build` can take them straight from the next person's dump.

Usage: find_runtime_shaders.py <romfs folder> <main.img> <out.tsv> <capture folder> [capture folder ...] [--name SUBSTRING ...]
  romfs folder   work/input/romfs after a build;  main.img   work/shader/main.img (main unpacked by the build)
  capture folders: shdump folders from play sessions (the app's ~/Library/Application Support/nxnative/<title ID>/shdump, work/run/shdump)
  --name: only search RomFS files whose name contains this text (default: Nin_Ounce_NVN2, Switch 2 graphics resources). Plain search: can take an hour.
"""
import collections, glob, hashlib, os, sys
import zstandard

args = sys.argv[1:]; names = []
while '--name' in args:
    i = args.index('--name'); names.append(args[i + 1]); del args[i:i + 2]
if len(args) < 4: sys.exit(__doc__)
rom, main_img, out, dumps = args[0], args[1], args[2], args[3:]
names = names or ['Nin_Ounce_NVN2']

caps = {}
for d in dumps:
    for c in glob.glob(os.path.join(d, '*.code')):
        k = os.path.basename(c)[:-5]
        if k not in caps and os.path.exists(c[:-5] + '.ctl'):
            caps[k] = (open(c[:-5] + '.ctl', 'rb').read(0xd8), open(c, 'rb').read())
print(f'{len(caps)} captured shaders')

dz = zstandard.ZstdDecompressor(); blobs = {}
for root, _, fs in os.walk(rom):
    for f in sorted(fs):
        if f.startswith('.') or f.endswith('.json') or not any(n in f for n in names): continue
        p = os.path.join(root, f); b = open(p, 'rb').read()
        blobs[os.path.relpath(p, rom)] = dz.stream_reader(b).read(1 << 31) if f.endswith('.zs') else b
blobs['main'] = open(main_img, 'rb').read()
print(f'{len(blobs)} files to search')

rows, miss = [], []
for k, (ctl, code) in sorted(caps.items()):
    if hashlib.sha256(ctl + code).hexdigest()[:16] != k: miss.append((k, 'key')); continue
    loc = None
    for n, b in blobs.items():   # the control section is usually next to its code
        j = b.find(code)
        if j >= 0:
            i = b.find(ctl)
            loc = (n, i, n, j) if i >= 0 else next(((n2, b2.find(ctl), n, j) for n2, b2 in blobs.items() if b2.find(ctl) >= 0), None)
            if loc: break
    if loc: rows.append((k,) + loc + (len(code),))
    else: miss.append((k, 'not found'))
print(f'{len(rows)} located, {len(miss)} not', dict(collections.Counter(m[1] for m in miss)))
with open(out, 'w') as f:
    f.write('# key\tcontrol file\tcontrol offset\tcode file\tcode offset\tcode bytes\n')
    for r in rows: f.write('%s\t%s\t%#x\t%s\t%#x\t%d\n' % r)
print(out)
