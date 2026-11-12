// Hermit "LED" icon: the shortlisted pixel terminal bug, hand-placed on a 32 x 20 grid of LED dots.
// Usage: swift led.swift <out.png> [size] [panel 0|1]
import AppKit
let a = CommandLine.arguments, S = CGFloat(Double(a.count > 2 ? a[2] : "2048")!), panel = a.count > 3 ? a[3] == "1" : true
let cs = CGColorSpace(name: CGColorSpace.sRGB)!
func hex(_ h: UInt32, _ al: CGFloat = 1) -> CGColor { CGColor(colorSpace: cs, components: [CGFloat((h >> 16) & 255) / 255, CGFloat((h >> 8) & 255) / 255, CGFloat(h & 255) / 255, al])! }

// the left half (cols 0-15) as rectangles of cells [col, row, w, h]; mirrored to cols 16-31
let half: [[Int]] = [
    [10, 0, 3, 3], [11, 3, 1, 3],          // eye on its stalk
    [0, 2, 2, 7], [0, 7, 6, 2], [4, 7, 2, 5], [4, 10, 4, 2],   // outer prong, step, arm into the body
    [4, 2, 2, 4],                          // inner prong
    [2, 14, 6, 2], [2, 14, 2, 6],          // leg
    [8, 6, 8, 11],                         // body (left half)
]
// cells cut out of the body: the ">" and the cursor
var cut = Set<[Int]>()
for (r, c) in [(8, 11), (9, 12), (10, 13), (11, 14), (12, 13), (13, 12), (14, 11)] { cut.insert([c, r]); cut.insert([c + 1, r]) }   // ">": two dots thick, seven rows
for c in 17...20 { cut.insert([c, 13]); cut.insert([c, 14]) }                                                   // the cursor on the same baseline
var lit = Set<[Int]>()
for r in half { for c in r[0]..<(r[0] + r[2]) { for y in r[1]..<(r[1] + r[3]) { lit.insert([c, y]); lit.insert([31 - c, y]) } } }
lit.subtract(cut)

let ctx = CGContext(data: nil, width: Int(S), height: Int(S), bitsPerComponent: 8, bytesPerRow: 0, space: cs, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
let k = S / 1024
let tile = CGRect(x: 100 * k, y: 100 * k, width: 824 * k, height: 824 * k)
let shape = CGPath(roundedRect: tile, cornerWidth: 185.4 * k, cornerHeight: 185.4 * k, transform: nil)
// tile with its shadow
ctx.saveGState(); ctx.setShadow(offset: CGSize(width: 0, height: -10 * k), blur: 28 * k, color: hex(0, 0.4)); ctx.addPath(shape); ctx.setFillColor(hex(0x18181A)); ctx.fillPath(); ctx.restoreGState()
ctx.saveGState(); ctx.addPath(shape); ctx.clip()
ctx.drawLinearGradient(CGGradient(colorsSpace: cs, colors: [hex(0x232326), hex(0x18181A), hex(0x111113)] as CFArray, locations: [0, 0.55, 1])!, start: CGPoint(x: 0, y: tile.maxY), end: CGPoint(x: 0, y: tile.minY), options: [])

// grid: 32 columns over 66 % of the tile, centred; the mark is rows 0-19
let cols = 32, rows = 20, cell = tile.width * 0.66 / CGFloat(cols), gap = cell * 0.16, rad = cell * 0.12
let ox = tile.midX - cell * CGFloat(cols) / 2, oy = tile.midY + cell * CGFloat(rows) / 2 + cell * 0.3   // top edge (CG y up)
func rect(_ c: Int, _ r: Int) -> CGRect { CGRect(x: ox + CGFloat(c) * cell + gap / 2, y: oy - CGFloat(r + 1) * cell + gap / 2, width: cell - gap, height: cell - gap) }
// the unlit panel: every dot faintly visible across the tile, as on a real LED board
if panel {
    let n0 = Int(((tile.minX - ox) / cell).rounded(.down)) - 1, n1 = Int(((tile.maxX - ox) / cell).rounded(.up)) + 1
    let m0 = Int(((oy - tile.maxY) / cell).rounded(.down)) - 1, m1 = Int(((oy - tile.minY) / cell).rounded(.up)) + 1
    ctx.setFillColor(hex(0xFFFFFF, 0.035))
    for c in n0...n1 { for r in m0...m1 where !lit.contains([c, r]) { ctx.addPath(CGPath(roundedRect: rect(c, r), cornerWidth: rad, cornerHeight: rad, transform: nil)) } }
    ctx.fillPath()
}
// a soft red glow behind the lit dots
ctx.saveGState(); ctx.setShadow(offset: .zero, blur: cell * 1.6, color: hex(0xFF2A10, 0.55))
ctx.setFillColor(hex(0xD0230F)); for p in lit { ctx.addPath(CGPath(roundedRect: rect(p[0], p[1]), cornerWidth: rad, cornerHeight: rad, transform: nil)) }; ctx.fillPath(); ctx.restoreGState()
// the prompt is unlit: wipe the glow from its cells and show them as dark dots
for p in cut { ctx.setFillColor(hex(0x18181A)); ctx.fill(rect(p[0], p[1]).insetBy(dx: -gap / 2, dy: -gap / 2)) }
ctx.setFillColor(hex(0xFFFFFF, 0.035)); for p in cut { ctx.addPath(CGPath(roundedRect: rect(p[0], p[1]), cornerWidth: rad, cornerHeight: rad, transform: nil)) }; ctx.fillPath()
// each lit dot: a slightly brighter top, like a lens
let dot = CGGradient(colorsSpace: cs, colors: [hex(0xF0401F), hex(0xD0230F), hex(0xB81C0B)] as CFArray, locations: [0, 0.5, 1])!
for p in lit { let r = rect(p[0], p[1]); ctx.saveGState(); ctx.addPath(CGPath(roundedRect: r, cornerWidth: rad, cornerHeight: rad, transform: nil)); ctx.clip(); ctx.drawLinearGradient(dot, start: CGPoint(x: 0, y: r.maxY), end: CGPoint(x: 0, y: r.minY), options: []); ctx.restoreGState() }
// sheen
ctx.drawRadialGradient(CGGradient(colorsSpace: cs, colors: [hex(0xFFFFFF, 0.07), hex(0xFFFFFF, 0)] as CFArray, locations: nil)!, startCenter: CGPoint(x: tile.midX, y: tile.maxY), startRadius: 0, endCenter: CGPoint(x: tile.midX, y: tile.maxY), endRadius: tile.width * 0.8, options: [])
ctx.restoreGState()
ctx.addPath(CGPath(roundedRect: tile.insetBy(dx: k, dy: k), cornerWidth: 184.4 * k, cornerHeight: 184.4 * k, transform: nil)); ctx.setStrokeColor(hex(0xFFFFFF, 0.08)); ctx.setLineWidth(2 * k); ctx.strokePath()
try! NSBitmapImageRep(cgImage: ctx.makeImage()!).representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: a[1]))
