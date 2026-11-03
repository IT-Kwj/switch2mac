#!/usr/bin/env python3
# Walk a DM_NVN_PASSDUMP frame backwards from one texture: the passes that write it (colour attachments P, compute image writes W, copies C/T),
# their shaders and the textures they read, to a given depth. With a TEXDUMP folder, each texture's mean colour and white share.
# Usage: pass_trace.py <frame lines> <serial> [depth] [texdump dir]
import sys, re, glob, os, collections
lines = open(sys.argv[1], errors='replace').read().splitlines(); start = sys.argv[2]; depth = int(sys.argv[3]) if len(sys.argv) > 3 else 4
tdir = sys.argv[4] if len(sys.argv) > 4 else None
order, writes, reads, keys = [], collections.defaultdict(list), collections.defaultdict(set), collections.defaultdict(set)
for l in lines:
    f = l.split()
    if len(f) < 5: continue
    t, p = f[2], f[3]
    if not p.isdigit(): continue
    if p not in order: order.append(p)
    m = re.search(r'ser=(\d+)', l)
    if t == 'P' and m: writes[m.group(1)].append(p)
    elif t == 'W' and m: writes[m.group(1)].append(p)
    elif t == 'R' and m: reads[p].add(m.group(1))
    elif t == 'K': keys[p].add(re.search(r'key=(\w+)', l).group(1) + ':' + f[4])
stats = {}
if tdir:
    from PIL import Image, ImageStat
    for fn in glob.glob(os.path.join(tdir, 't_*.png')):
        n = int(re.findall(r'\d+', os.path.basename(fn))[0])
        if n % 100: continue
        im = Image.open(fn).convert('RGB'); s = ImageStat.Stat(im); g = im.convert('L').histogram(); px = im.size[0] * im.size[1]
        stats[str(n // 100)] = f'{im.size[0]}x{im.size[1]} mean {[round(x) for x in s.mean]} white {sum(g[250:]) / px:.0%}'
def show(ser, d, seen, before=None):
    pre = '  ' * (depth - d)
    ws = [p for p in writes.get(ser, []) if before is None or order.index(p) < order.index(before)]
    print(f'{pre}ser {ser} {stats.get(ser, "")}  written by {sorted(set(ws), key=order.index)[-3:] or "nothing in this frame"}')
    if d == 0 or not ws: return
    p = ws[-1]
    if p in seen: return
    seen.add(p)
    print(f'{pre}  pass {p} shaders {sorted(keys[p])}')
    for r in sorted(reads[p] - {ser}): show(r, d - 1, seen, p)
show(start, depth, set())
