#!/usr/bin/env python3
# NSO helper: unpack an NSO, map PLT stubs to their imported symbol names, disassemble around an offset.
# Usage: nso_syms.py <nso> dis <hex offset> [count]   |   nso_syms.py <nso> plt <name regex>   |   nso_syms.py <nso> calls <name regex>
import sys, struct, re, lz4.block, capstone
def load(p):
    d = open(p, 'rb').read(); fl = struct.unpack_from('<I', d, 0xc)[0]
    segs = [struct.unpack_from('<III', d, 0x10 + 0x10 * i) for i in range(3)]; csz = struct.unpack_from('<3I', d, 0x60)
    img = bytearray(segs[2][1] + segs[2][2] + struct.unpack_from('<I', d, 0x3c)[0])
    for i, (o, m, s) in enumerate(segs):
        r = d[o:o + csz[i]]; img[m:m + s] = lz4.block.decompress(r, uncompressed_size=s) if fl >> i & 1 else r
    return bytes(img), segs
def dyn(img):
    mod = struct.unpack_from('<I', img, 4)[0]; dynoff = mod + struct.unpack_from('<i', img, mod + 4)[0]
    t = {}; o = dynoff
    while True:
        k, v = struct.unpack_from('<qQ', img, o); o += 16
        if k == 0: break
        t.setdefault(k, v)
    return t
def got_names(img):
    t = dyn(img); strtab, symtab = t[5], t[6]; out = {}
    for rel, sz in ((t.get(23), t.get(2)), (t.get(7), t.get(8))):
        if not rel: continue
        for o in range(rel, rel + sz, 24):
            off, info, add = struct.unpack_from('<QQq', img, o); si = info >> 32
            if si:
                n = struct.unpack_from('<I', img, symtab + 24 * si)[0]; e = img.index(b'\0', strtab + n)
                out[off] = img[strtab + n:e].decode()
    return out
def plt_map(img, segs):
    g = got_names(img); md = capstone.Cs(capstone.CS_ARCH_ARM64, capstone.CS_MODE_ARM); md.detail = True; out = {}
    text = img[:segs[0][2]]
    for a in range(0, len(text) - 16, 4):
        w = struct.unpack_from('<4I', text, a)
        if w[0] & 0x9f00001f == 0x90000010 and w[1] & 0xffc003ff == 0xf9400211 and w[3] == 0xd61f0220:
            ins = list(md.disasm(text[a:a + 8], a)); page = ins[0].operands[1].imm; slot = page + ins[1].operands[1].mem.disp
            if slot in g: out[a] = g[slot]
    return out
img, segs = load(sys.argv[1]); cmd = sys.argv[2]
md = capstone.Cs(capstone.CS_ARCH_ARM64, capstone.CS_MODE_ARM); md.detail = True
if cmd == 'dis':
    a = int(sys.argv[3], 16); n = int(sys.argv[4]) if len(sys.argv) > 4 else 40; plt = plt_map(img, segs)
    for i in md.disasm(img[a:a + 4 * n], a):
        x = ''
        if i.mnemonic == 'bl' and i.operands[0].imm in plt: x = '  ; ' + plt[i.operands[0].imm]
        print(f'{i.address:x}: {i.mnemonic} {i.op_str}{x}')
elif cmd == 'plt':
    for a, n in sorted(plt_map(img, segs).items()):
        if re.search(sys.argv[3], n): print(f'{a:x} {n}')
elif cmd == 'calls':
    plt = {a: n for a, n in plt_map(img, segs).items() if re.search(sys.argv[3], n)}
    text = img[:segs[0][2]]
    for a in range(0, len(text), 4):
        w = struct.unpack_from('<I', text, a)[0]
        if w >> 26 == 0x25:
            d = w & 0x3ffffff; d -= (d & 0x2000000) << 1; t = a + 4 * d
            if t in plt: print(f'{a:x} -> {plt[t]}')
if cmd == 'funcs':   # function starts (pacibsp / first instruction after a ret) in [lo, hi), with the imports and local functions each calls, and outside callers of each
    lo, hi = int(sys.argv[3], 16), int(sys.argv[4], 16); plt = plt_map(img, segs); text = img[:segs[0][2]]
    starts = [a for a in range(lo, hi, 4) if struct.unpack_from('<I', text, a)[0] == 0xd503237f]
    callers = {}
    for a in range(0, len(text), 4):
        w = struct.unpack_from('<I', text, a)[0]
        if w >> 26 in (0x25, 0x05):
            d = w & 0x3ffffff; d -= (d & 0x2000000) << 1; t = a + 4 * d
            if lo <= t < hi: callers.setdefault(t, []).append(a)
    for k, s in enumerate(starts):
        e = starts[k + 1] if k + 1 < len(starts) else hi; out = []
        for a in range(s, e, 4):
            w = struct.unpack_from('<I', text, a)[0]
            if w >> 26 == 0x25:
                d = w & 0x3ffffff; d -= (d & 0x2000000) << 1; t = a + 4 * d
                out.append(re.sub(r'^_ZN2nn5codec\d+|^_ZN2nn\d*', '', plt.get(t, f'{t:x}'))[:40])
        ext = [f'{c:x}' for c in callers.get(s, []) if not (lo <= c < hi)]
        print(f'{s:x} len {e - s:#x} ext-callers {ext[:4]}{"+" if len(ext) > 4 else ""} calls {out[:8]}')
if cmd == 'sym':   # the exported symbol at or before each offset
    t = dyn(img); strtab, symtab = t[5], t[6]; syms = []
    o = symtab + 24
    while o + 24 <= strtab:
        n, info, oth, sh, val, sz = struct.unpack_from('<IBBHQQ', img, o); o += 24
        if sh and val: e = img.index(b'\0', strtab + n); syms.append((val, sz, img[strtab + n:e].decode(errors='replace')))
    syms.sort()
    import bisect
    for a in sys.argv[3:]:
        a = int(a, 16); i = bisect.bisect_right(syms, (a, 1 << 64, '')) - 1
        v, s, n = syms[i] if i >= 0 else (0, 0, '?'); print(f'{a:x}: {n}+{a - v:#x} (size {s:#x})')
