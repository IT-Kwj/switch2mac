// Hermit's mark (shortlisted 2026-11-12, for the rename; not used by make_app.sh yet): a macOS window coiling into a shell, with a command-line prompt inside it.
// Usage: swift make_hermit_icon.swift <kind> <out.png> [size]
//   kind: icon-charcoal | icon-orange | icon-light | mark | mark-small | template | lockup
import AppKit
let cs = CGColorSpace(name: CGColorSpace.sRGB)!
func c(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1) -> CGColor { CGColor(colorSpace: cs, components: [r, g, b, a])! }
func hex(_ h: UInt32, _ a: CGFloat = 1) -> CGColor { c(CGFloat((h >> 16) & 255) / 255, CGFloat((h >> 8) & 255) / 255, CGFloat(h & 255) / 255, a) }
let ORANGE = hex(0xFF6A1F), ORANGE_LT = hex(0xFF9A4A), ORANGE_DK = hex(0xE8421A), CHAR_TOP = hex(0x2A292E), CHAR_BOT = hex(0x141316), CREAM = hex(0xF7F2EA)

// The spiral on a 256 grid (y up in CG, so it is built y-down and flipped): sides S, S, S, S-p, S-p, S-2p, S-2p, S-3p.
// Corners of the outer turn have radius r0, the inner turn's r0 - p, so every corner is concentric with the one outside it.
// The shell coils one and a half turns; inside it waits a command-line prompt, ">" and the cursor "_": a shell inside a shell.
func spiralPath(small: Bool) -> CGPath {
    let W: CGFloat = small ? 28 : 24, g: CGFloat = small ? 24 : 22, p = W + g
    let S: CGFloat = 200, k: CGFloat = 0.235, colH: CGFloat = small ? 104 : 118
    let lens: [CGFloat] = [S, S, S, S - p, colH]
    let rads: [CGFloat] = [S * k, S * k, S * k, (S - 2 * p) * k * 0.9, 0]
    var x = 128 - S / 2, y = 128 + S / 2, dir = CGPoint(x: 0, y: -1)
    let path = CGMutablePath(); path.move(to: CGPoint(x: x, y: 256 - y))
    for (i, L) in lens.enumerated() {
        let last = i == lens.count - 1, rin = i > 0 ? rads[i - 1] : 0, rout = last ? 0 : rads[i]
        x += dir.x * (L - rin - rout); y += dir.y * (L - rin - rout); path.addLine(to: CGPoint(x: x, y: 256 - y))
        if !last {
            let nd = CGPoint(x: -dir.y, y: dir.x), corner = CGPoint(x: x + dir.x * rout, y: y + dir.y * rout)
            let e = CGPoint(x: corner.x + nd.x * rout, y: corner.y + nd.y * rout)
            path.addArc(tangent1End: CGPoint(x: corner.x, y: 256 - corner.y), tangent2End: CGPoint(x: e.x, y: 256 - e.y), radius: rout)
            x = e.x; y = e.y; dir = nd
        }
    }
    // the prompt, centred in the space the coil leaves
    let cy: CGFloat = 138, h: CGFloat = small ? 28 : 26, cx0 = 128 - S / 2 + p + W / 2 + g + W / 2 + 2
    path.move(to: CGPoint(x: cx0, y: 256 - (cy - h))); path.addLine(to: CGPoint(x: cx0 + h, y: 256 - cy)); path.addLine(to: CGPoint(x: cx0, y: 256 - (cy + h)))
    let cx1 = cx0 + h + W * 0.5 + g * 1.05
    path.move(to: CGPoint(x: cx1, y: 256 - (cy + h))); path.addLine(to: CGPoint(x: cx1 + (small ? 12 : 16), y: 256 - (cy + h)))
    return path.copy(strokingWithWidth: W, lineCap: .round, lineJoin: .round, miterLimit: 4)
}

func draw(_ kind: String, _ S: CGFloat) -> CGImage {
    let lockup = kind == "lockup"
    let w = lockup ? S * 3.3 : S
    let ctx = CGContext(data: nil, width: Int(w), height: Int(S), bitsPerComponent: 8, bytesPerRow: 0, space: cs, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
    ctx.interpolationQuality = .high
    let small = kind == "mark-small" || (kind == "template" && S <= 40)
    func mark(in rect: CGRect, color: CGColor, gradient: CGGradient? = nil, shadow: Bool = false) {
        let k = rect.width / 256
        var t = CGAffineTransform(translationX: rect.minX, y: rect.minY).scaledBy(x: k, y: k)
        guard let p = spiralPath(small: small).copy(using: &t) else { return }
        if shadow { ctx.saveGState(); ctx.setShadow(offset: CGSize(width: 0, height: -rect.width * 0.018), blur: rect.width * 0.05, color: c(0, 0, 0, 0.35)); ctx.addPath(p); ctx.setFillColor(color); ctx.fillPath(); ctx.restoreGState() }
        if let gr = gradient { ctx.saveGState(); ctx.addPath(p); ctx.clip(); ctx.drawLinearGradient(gr, start: CGPoint(x: 0, y: rect.maxY), end: CGPoint(x: 0, y: rect.minY), options: []); ctx.restoreGState() }
        else { ctx.addPath(p); ctx.setFillColor(color); ctx.fillPath() }
    }
    switch kind {
    case "icon-charcoal", "icon-orange", "icon-light":
        // macOS icon grid: the tile is 824 of 1024 with a 185.4 radius, centred, with a soft drop shadow
        let s = S / 1024, tile = CGRect(x: 100 * s, y: 100 * s, width: 824 * s, height: 824 * s)
        let shape = CGPath(roundedRect: tile, cornerWidth: 185.4 * s, cornerHeight: 185.4 * s, transform: nil)
        ctx.saveGState(); ctx.setShadow(offset: CGSize(width: 0, height: -10 * s), blur: 28 * s, color: c(0, 0, 0, 0.35)); ctx.addPath(shape); ctx.setFillColor(CHAR_BOT); ctx.fillPath(); ctx.restoreGState()
        ctx.saveGState(); ctx.addPath(shape); ctx.clip()
        let bg: [CGColor] = kind == "icon-orange" ? [ORANGE_LT, ORANGE, ORANGE_DK] : kind == "icon-light" ? [hex(0xFFFFFF), CREAM, hex(0xEDE6DB)] : [CHAR_TOP, hex(0x1D1C20), CHAR_BOT]
        ctx.drawLinearGradient(CGGradient(colorsSpace: cs, colors: bg as CFArray, locations: [0, 0.5, 1])!, start: CGPoint(x: 0, y: tile.maxY), end: CGPoint(x: 0, y: tile.minY), options: [])
        // a soft sheen at the top, as on Apple's own icons
        ctx.drawRadialGradient(CGGradient(colorsSpace: cs, colors: [c(1, 1, 1, kind == "icon-light" ? 0 : 0.10), c(1, 1, 1, 0)] as CFArray, locations: nil)!, startCenter: CGPoint(x: tile.midX, y: tile.maxY), startRadius: 0, endCenter: CGPoint(x: tile.midX, y: tile.maxY), endRadius: tile.width * 0.75, options: [])
        let m = tile.width * 0.62, mr = CGRect(x: tile.midX - m / 2, y: tile.midY - m / 2 + tile.width * 0.005, width: m, height: m)
        if kind == "icon-orange" { mark(in: mr, color: c(1, 1, 1), gradient: CGGradient(colorsSpace: cs, colors: [c(1, 1, 1), hex(0xFFF1E6)] as CFArray, locations: nil), shadow: true) }
        else if kind == "icon-light" { mark(in: mr, color: ORANGE, gradient: CGGradient(colorsSpace: cs, colors: [ORANGE_LT, ORANGE_DK] as CFArray, locations: nil), shadow: false) }
        else { mark(in: mr, color: ORANGE, gradient: CGGradient(colorsSpace: cs, colors: [ORANGE_LT, ORANGE, ORANGE_DK] as CFArray, locations: [0, 0.5, 1]), shadow: true) }
        ctx.restoreGState()
        ctx.addPath(CGPath(roundedRect: tile.insetBy(dx: 1 * s, dy: 1 * s), cornerWidth: 184.4 * s, cornerHeight: 184.4 * s, transform: nil)); ctx.setStrokeColor(c(1, 1, 1, kind == "icon-light" ? 0 : 0.08)); ctx.setLineWidth(2 * s); ctx.strokePath()
    case "mark", "mark-small":
        mark(in: CGRect(x: 0, y: 0, width: S, height: S), color: ORANGE, gradient: CGGradient(colorsSpace: cs, colors: [ORANGE_LT, ORANGE_DK] as CFArray, locations: nil))
    case "template":   // the menu bar: black on clear, macOS tints it
        mark(in: CGRect(x: S * 0.06, y: S * 0.06, width: S * 0.88, height: S * 0.88), color: c(0, 0, 0))
    default:   // lockup: the mark, then the name
        mark(in: CGRect(x: S * 0.08, y: S * 0.14, width: S * 0.72, height: S * 0.72), color: ORANGE, gradient: CGGradient(colorsSpace: cs, colors: [ORANGE_LT, ORANGE_DK] as CFArray, locations: nil))
        let font = NSFont.systemFont(ofSize: S * 0.56, weight: .semibold)
        let line = CTLineCreateWithAttributedString(NSAttributedString(string: "Hermit", attributes: [.font: font, .foregroundColor: c(0.08, 0.075, 0.09), .kern: -S * 0.012]))
        ctx.textPosition = CGPoint(x: S * 0.94, y: S * 0.30); CTLineDraw(line, ctx)
    }
    return ctx.makeImage()!
}
let a = CommandLine.arguments
let img = draw(a[1], CGFloat(Double(a.count > 3 ? a[3] : "1024") ?? 1024))
try! NSBitmapImageRep(cgImage: img).representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: a[2]))
print(a[2])
