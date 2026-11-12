// Hermit's mark (the original LED crab, every dot exactly where the approved draft has it) and its app icon.
// Dots: led-original.json (beside this file), [x, y, w, h] on a 256 grid.
// Usage: swift make_hermit_icon.swift mark <out.png> <width>     transparent background, the crab only
//        swift make_hermit_icon.swift icon <out.png> <size>      macOS app icon
//        swift make_hermit_icon.swift svg  <out.svg>             the crab as vector
import AppKit
let a = CommandLine.arguments
let dots = (try! JSONSerialization.jsonObject(with: Data(contentsOf: URL(fileURLWithPath: CommandLine.arguments[0].replacingOccurrences(of: "make_hermit_icon.swift", with: "led-original.json")))) as! [[Double]]).map { CGRect(x: $0[0], y: $0[1], width: $0[2], height: $0[3]) }
// Display P3: the Mac's own wide colour, so the red can be brighter and more saturated than sRGB allows
let cs = CGColorSpace(name: CGColorSpace.displayP3)!
func hex(_ h: UInt32, _ al: CGFloat = 1) -> CGColor { CGColor(colorSpace: cs, components: [CGFloat((h >> 16) & 255) / 255, CGFloat((h >> 8) & 255) / 255, CGFloat(h & 255) / 255, al])! }
let RED = CGColor(colorSpace: cs, components: [1.0, 0.13, 0.08, 1])!   // a vivid P3 red (about #FF2A1A in sRGB)
let bb = dots.reduce(dots[0]) { $0.union($1) }   // 30.65..227.35 x 54.65..185.35

func save(_ ctx: CGContext, _ path: String) { try! NSBitmapImageRep(cgImage: ctx.makeImage()!).representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: path)) }
// draw the dots with a transform from the 256 grid (y down) into the context (y up)
func drawDots(_ ctx: CGContext, scale k: CGFloat, ox: CGFloat, oy: CGFloat, H: CGFloat) {
    for d in dots { ctx.addRect(CGRect(x: ox + d.minX * k, y: H - (oy + d.maxY * k), width: d.width * k, height: d.height * k)) }
}

switch a[1] {
case "svg":
    var s = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"\(bb.minX) \(bb.minY) \(bb.width) \(bb.height)\" width=\"\(bb.width * 8)\" height=\"\(bb.height * 8)\">\n<g fill=\"#FF2A1A\">\n"
    for d in dots { s += "<rect x=\"\(d.minX)\" y=\"\(d.minY)\" width=\"\(d.width)\" height=\"\(d.height)\"/>\n" }
    s += "</g>\n</svg>\n"
    try! s.write(toFile: a[2], atomically: true, encoding: .utf8)
case "mark":
    let W = CGFloat(Double(a[3])!), k = W / bb.width, H = (bb.height * k).rounded()
    let ctx = CGContext(data: nil, width: Int(W), height: Int(H), bitsPerComponent: 8, bytesPerRow: 0, space: cs, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
    ctx.setShouldAntialias(true)
    drawDots(ctx, scale: k, ox: -bb.minX * k, oy: -bb.minY * k, H: H); ctx.setFillColor(RED); ctx.fillPath()
    save(ctx, a[2])
default:   // icon
    let S = CGFloat(Double(a[3])!), u = S / 1024
    let ctx = CGContext(data: nil, width: Int(S), height: Int(S), bitsPerComponent: 8, bytesPerRow: 0, space: cs, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
    let tile = CGRect(x: 100 * u, y: 100 * u, width: 824 * u, height: 824 * u)
    let shape = CGPath(roundedRect: tile, cornerWidth: 185.4 * u, cornerHeight: 185.4 * u, transform: nil)
    ctx.saveGState(); ctx.setShadow(offset: CGSize(width: 0, height: -12 * u), blur: 30 * u, color: hex(0, 0.45)); ctx.addPath(shape); ctx.setFillColor(hex(0x0E0C0C)); ctx.fillPath(); ctx.restoreGState()
    ctx.saveGState(); ctx.addPath(shape); ctx.clip()
    let style = a.count > 4 ? a[4] : "black"
    let mid = CGPoint(x: tile.midX, y: tile.midY)
    if style == "glow" {
        // NX2Apple's tile: near black, a warm light behind the mark, falling to black at the edges and darkest at the bottom
        ctx.drawLinearGradient(CGGradient(colorsSpace: cs, colors: [hex(0x171413), hex(0x0B0909), hex(0x020202)] as CFArray, locations: [0, 0.55, 1])!, start: CGPoint(x: 0, y: tile.maxY), end: CGPoint(x: 0, y: tile.minY), options: [])
        let c = CGPoint(x: mid.x, y: mid.y + tile.height * 0.04)
        ctx.drawRadialGradient(CGGradient(colorsSpace: cs, colors: [hex(0x7A1C0E, 0.9), hex(0x451009, 0.6), hex(0x180605, 0.25), hex(0x000000, 0)] as CFArray, locations: [0, 0.35, 0.7, 1])!, startCenter: c, startRadius: 0, endCenter: c, endRadius: tile.width * 0.58, options: [])
    } else {
        // plain black: the red at its most saturated
        ctx.setFillColor(hex(0x000000)); ctx.fill(tile)
    }
    // the crab, 66 % of the tile wide, centred on its own outline
    let k = 0.66 * tile.width / bb.width, ox = tile.midX - bb.midX * k, oy = (S - tile.midY) - bb.midY * k
    drawDots(ctx, scale: k, ox: ox, oy: oy, H: S); ctx.setFillColor(RED); ctx.fillPath()
    // sheen at the top (glow style only) and a hairline rim
    if style == "glow" { ctx.drawRadialGradient(CGGradient(colorsSpace: cs, colors: [hex(0xFFFFFF, 0.06), hex(0xFFFFFF, 0)] as CFArray, locations: nil)!, startCenter: CGPoint(x: tile.midX, y: tile.maxY), startRadius: 0, endCenter: CGPoint(x: tile.midX, y: tile.maxY), endRadius: tile.width * 0.75, options: []) }
    ctx.restoreGState()
    ctx.addPath(CGPath(roundedRect: tile.insetBy(dx: u, dy: u), cornerWidth: 184.4 * u, cornerHeight: 184.4 * u, transform: nil)); ctx.setStrokeColor(hex(0xFFFFFF, 0.09)); ctx.setLineWidth(2 * u); ctx.strokePath()
    save(ctx, a[2])
}
