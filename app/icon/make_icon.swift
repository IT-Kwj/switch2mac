// switch2mac's app icon ("Studio"): a laptop whose black screen (since 0.4.0 without the "2" it showed) sits between a green and a red grip, so the Mac's
// display reads as a handheld. Shaded grips with sticks and buttons, a black bezel with an aluminium rim, an aluminium base, on a
// charcoal squircle lit from behind (a warm halo, the grips' green and red at its sides) with a lit floor edge under the laptop.
// Our own drawing: no logo or artwork from anywhere else.
// Usage: swift icon/make_icon.swift <out.png> [size]   (tools/make_app.sh turns the PNG into AppIcon.icns)
import AppKit

let cs = CGColorSpace(name: CGColorSpace.sRGB)!
func c(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1) -> CGColor { CGColor(colorSpace: cs, components: [r, g, b, a])! }
func grad(_ cols: [CGColor], _ locs: [CGFloat]? = nil) -> CGGradient { CGGradient(colorsSpace: cs, colors: cols as CFArray, locations: locs)! }
let headerMode = ProcessInfo.processInfo.environment["ICON_HEADER"] == "1"
// the grips' green and red; richer in the header mark, where they are small
// ICON_LEFT=blue: the left grip blue instead of green
let leftBlue = ProcessInfo.processInfo.environment["ICON_LEFT"] == "blue"
let G = leftBlue ? (headerMode ? (r: 0.0 as CGFloat, g: 0.62 as CGFloat, b: 1.0 as CGFloat) : (r: 0.16 as CGFloat, g: 0.62 as CGFloat, b: 0.95 as CGFloat))
    : headerMode ? (r: 0.10 as CGFloat, g: 0.90 as CGFloat, b: 0.38 as CGFloat) : (r: 0.25 as CGFloat, g: 0.84 as CGFloat, b: 0.47 as CGFloat)
let R = headerMode ? (r: 1.0 as CGFloat, g: 0.14 as CGFloat, b: 0.16 as CGFloat) : (r: 0.92 as CGFloat, g: 0.27 as CGFloat, b: 0.27 as CGFloat)

func rr(_ r: CGRect, _ rad: CGFloat) -> CGPath { CGPath(roundedRect: r, cornerWidth: rad, cornerHeight: rad, transform: nil) }
// a grip: rounded on its outer side only
func grip(_ r: CGRect, left: Bool) -> CGPath {
    let p = CGMutablePath(), rad = min(r.width * 0.98, r.height / 2)
    if left {
        p.move(to: CGPoint(x: r.maxX, y: r.minY)); p.addLine(to: CGPoint(x: r.minX + rad, y: r.minY))
        p.addArc(tangent1End: CGPoint(x: r.minX, y: r.minY), tangent2End: CGPoint(x: r.minX, y: r.minY + rad), radius: rad)
        p.addLine(to: CGPoint(x: r.minX, y: r.maxY - rad))
        p.addArc(tangent1End: CGPoint(x: r.minX, y: r.maxY), tangent2End: CGPoint(x: r.minX + rad, y: r.maxY), radius: rad)
        p.addLine(to: CGPoint(x: r.maxX, y: r.maxY))
    } else {
        p.move(to: CGPoint(x: r.minX, y: r.minY)); p.addLine(to: CGPoint(x: r.maxX - rad, y: r.minY))
        p.addArc(tangent1End: CGPoint(x: r.maxX, y: r.minY), tangent2End: CGPoint(x: r.maxX, y: r.minY + rad), radius: rad)
        p.addLine(to: CGPoint(x: r.maxX, y: r.maxY - rad))
        p.addArc(tangent1End: CGPoint(x: r.maxX, y: r.maxY), tangent2End: CGPoint(x: r.maxX - rad, y: r.maxY), radius: rad)
        p.addLine(to: CGPoint(x: r.minX, y: r.maxY))
    }
    p.closeSubpath(); return p
}
func fill(_ ctx: CGContext, _ p: CGPath, _ col: CGColor) { ctx.addPath(p); ctx.setFillColor(col); ctx.fillPath() }
func fillGrad(_ ctx: CGContext, _ p: CGPath, _ g: CGGradient, from: CGPoint, to: CGPoint) {
    ctx.saveGState(); ctx.addPath(p); ctx.clip(); ctx.drawLinearGradient(g, start: from, end: to, options: [.drawsBeforeStartLocation, .drawsAfterEndLocation]); ctx.restoreGState()
}
func stick(_ ctx: CGContext, _ center: CGPoint, _ r: CGFloat) {   // a thumbstick: dark well, a domed cap with a highlight
    ctx.setFillColor(c(0, 0, 0, 0.55)); ctx.fillEllipse(in: CGRect(x: center.x - r * 1.18, y: center.y - r * 1.18, width: r * 2.36, height: r * 2.36))
    let cap = CGPath(ellipseIn: CGRect(x: center.x - r, y: center.y - r, width: r * 2, height: r * 2), transform: nil)
    fillGrad(ctx, cap, grad([c(0.24, 0.24, 0.27), c(0.07, 0.07, 0.08)]), from: CGPoint(x: center.x, y: center.y + r), to: CGPoint(x: center.x, y: center.y - r))
    ctx.setStrokeColor(c(1, 1, 1, 0.10)); ctx.setLineWidth(r * 0.12)
    ctx.strokeEllipse(in: CGRect(x: center.x - r * 0.62, y: center.y - r * 0.62, width: r * 1.24, height: r * 1.24))
}
func buttons(_ ctx: CGContext, _ center: CGPoint, _ d: CGFloat, _ r: CGFloat) {   // four face buttons in a diamond
    for (dx, dy) in [(0.0, 1.0), (-1.0, 0.0), (1.0, 0.0), (0.0, -1.0)] as [(CGFloat, CGFloat)] {
        let p = CGPoint(x: center.x + dx * d, y: center.y + dy * d)
        let b = CGPath(ellipseIn: CGRect(x: p.x - r, y: p.y - r, width: r * 2, height: r * 2), transform: nil)
        fillGrad(ctx, b, grad([c(0.22, 0.22, 0.25), c(0.06, 0.06, 0.07)]), from: CGPoint(x: p.x, y: p.y + r), to: CGPoint(x: p.x, y: p.y - r))
        ctx.setFillColor(c(1, 1, 1, 0.16)); ctx.fillEllipse(in: CGRect(x: p.x - r * 0.45, y: p.y + r * 0.15, width: r * 0.6, height: r * 0.4))
    }
}
func two(_ ctx: CGContext, center: CGPoint, size: CGFloat, color: CGColor, glow: CGColor? = nil) {
    let font = CTFontCreateWithName("SFProRounded-Heavy" as CFString, size, nil)
    let f = CTFontCopyFamilyName(font) as String == "SF Pro Rounded" ? font : CTFontCreateWithName("Helvetica-Bold" as CFString, size, nil)
    let line = CTLineCreateWithAttributedString(NSAttributedString(string: "2", attributes: [.font: f, .foregroundColor: color]))
    let b = CTLineGetBoundsWithOptions(line, .useGlyphPathBounds)
    ctx.saveGState()
    if let glow { ctx.setShadow(offset: .zero, blur: size * 0.35, color: glow) }
    ctx.textPosition = CGPoint(x: center.x - b.midX, y: center.y - b.midY); CTLineDraw(line, ctx)
    ctx.restoreGState()
}

// Mac cues for the screen, none of them a logo: the Command key sign, a window with its three dots, a Dock, a menu bar
func macScreen(_ ctx: CGContext, _ r: CGRect, _ mark: String, _ s: CGFloat) {
    let lights = [c(1, 0.37, 0.34), c(1, 0.74, 0.18), c(0.16, 0.79, 0.25)]
    func dots(_ x: CGFloat, _ y: CGFloat, _ d: CGFloat) { for (i, col) in lights.enumerated() { ctx.setFillColor(col); ctx.fillEllipse(in: CGRect(x: x + CGFloat(i) * d * 1.7, y: y, width: d, height: d)) } }
    func dock(_ y: CGFloat, _ n: Int, _ tile: CGFloat) {
        let w = CGFloat(n) * tile * 1.28 + tile * 0.6, x = r.midX - w / 2
        fill(ctx, rr(CGRect(x: x, y: y, width: w, height: tile * 1.6), tile * 0.45), c(1, 1, 1, 0.16))
        let cols = [c(G.r, G.g, G.b), c(0.30, 0.55, 0.98), c(1, 0.74, 0.18), c(R.r, R.g, R.b), c(0.62, 0.42, 0.95), c(0.9, 0.9, 0.92)]
        for i in 0..<n { fill(ctx, rr(CGRect(x: x + tile * 0.43 + CGFloat(i) * tile * 1.28, y: y + tile * 0.3, width: tile, height: tile), tile * 0.24), cols[i % cols.count]) }
    }
    switch mark {
    case "cmd":
        let font = CTFontCreateWithName("Helvetica" as CFString, 190 * s, nil)
        let line = CTLineCreateWithAttributedString(NSAttributedString(string: "\u{2318}", attributes: [.font: font, .foregroundColor: c(0.96, 0.97, 0.98)]))
        let b = CTLineGetBoundsWithOptions(line, .useGlyphPathBounds)
        ctx.textPosition = CGPoint(x: r.midX - b.midX, y: r.midY - b.midY); CTLineDraw(line, ctx)
    case "window":
        let w = CGRect(x: r.midX - 130 * s, y: r.midY - 82 * s, width: 260 * s, height: 170 * s)
        ctx.saveGState(); ctx.setShadow(offset: CGSize(width: 0, height: -6 * s), blur: 16 * s, color: c(0, 0, 0, 0.6))
        fill(ctx, rr(w, 16 * s), c(0.20, 0.20, 0.22)); ctx.restoreGState()
        fill(ctx, rr(CGRect(x: w.minX, y: w.maxY - 34 * s, width: w.width, height: 34 * s), 16 * s), c(0.27, 0.27, 0.30))
        fill(ctx, CGPath(rect: CGRect(x: w.minX, y: w.maxY - 34 * s, width: w.width, height: 16 * s), transform: nil), c(0.27, 0.27, 0.30))
        dots(w.minX + 16 * s, w.maxY - 24 * s, 14 * s)
        for (i, wd) in [0.62, 0.44, 0.54].enumerated() {
            fill(ctx, rr(CGRect(x: w.minX + 24 * s, y: w.maxY - (70 + CGFloat(i) * 30) * s, width: w.width * wd, height: 12 * s), 6 * s), c(1, 1, 1, 0.22))
        }
    case "dock":
        dock(r.minY + 18 * s, 6, 26 * s)
        let sun = CGPoint(x: r.midX, y: r.midY + 30 * s)
        ctx.drawRadialGradient(grad([c(G.r, G.g, G.b, 0.35), c(G.r, G.g, G.b, 0)]), startCenter: sun, startRadius: 0, endCenter: sun, endRadius: 170 * s, options: [])
    default:   // desktop: a menu bar and a Dock
        fill(ctx, CGPath(rect: CGRect(x: r.minX, y: r.maxY - 22 * s, width: r.width, height: 22 * s), transform: nil), c(1, 1, 1, 0.14))
        for (i, wd) in [22.0, 30.0, 26.0].enumerated() { fill(ctx, rr(CGRect(x: r.minX + (16 + CGFloat(i) * 44) * s, y: r.maxY - 15 * s, width: wd * s, height: 8 * s), 4 * s), c(1, 1, 1, 0.45)) }
        fill(ctx, rr(CGRect(x: r.maxX - 70 * s, y: r.maxY - 15 * s, width: 54 * s, height: 8 * s), 4 * s), c(1, 1, 1, 0.45))
        let w = CGRect(x: r.midX - 95 * s, y: r.midY - 40 * s, width: 190 * s, height: 120 * s)
        fill(ctx, rr(w, 12 * s), c(0.22, 0.22, 0.24)); dots(w.minX + 12 * s, w.maxY - 20 * s, 11 * s)
        dock(r.minY + 14 * s, 6, 22 * s)
    }
}

// Lit backdrops (ICON_LIGHT), drawn over the default background inside the squircle, before the device: a charcoal lifted from black,
// then light that falls off into it, in the grips' green and red
func lighting(_ ctx: CGContext, _ kind: String, _ body: CGRect, _ s: CGFloat, base: Bool = true) {   // base: the charcoal and the rim (the first of combined lights)
    func radial(_ at: CGPoint, _ r: CGFloat, _ cols: [CGColor], _ locs: [CGFloat]? = nil, sx: CGFloat = 1, sy: CGFloat = 1) {
        ctx.saveGState(); ctx.translateBy(x: at.x, y: at.y); ctx.scaleBy(x: sx, y: sy)
        ctx.drawRadialGradient(grad(cols, locs), startCenter: .zero, startRadius: 0, endCenter: .zero, endRadius: r, options: [])
        ctx.restoreGState()
    }
    // a lifted charcoal base: a top-to-bottom gradient instead of near-black
    if base { ctx.drawLinearGradient(grad([c(0.115, 0.118, 0.13), c(0.045, 0.046, 0.052), c(0.02, 0.02, 0.024)], [0, 0.55, 1]),
                           start: CGPoint(x: 0, y: body.maxY), end: CGPoint(x: 0, y: body.minY), options: []) }
    switch kind {
    case "spotlight":   // a key light from above, the grips' colours spilling sideways, a soft floor
        radial(CGPoint(x: 512 * s, y: 900 * s), 560 * s, [c(1, 1, 1, 0.20), c(1, 1, 1, 0.06), c(1, 1, 1, 0)], [0, 0.45, 1], sx: 1.0, sy: 1.25)
        radial(CGPoint(x: 210 * s, y: 560 * s), 330 * s, [c(G.r, G.g, G.b, 0.34), c(G.r, G.g, G.b, 0)])
        radial(CGPoint(x: 814 * s, y: 560 * s), 330 * s, [c(R.r, R.g, R.b, 0.32), c(R.r, R.g, R.b, 0)])
        radial(CGPoint(x: 512 * s, y: 300 * s), 420 * s, [c(1, 1, 1, 0.07), c(1, 1, 1, 0)], sx: 1.3, sy: 0.32)
    case "streaks":   // long-exposure light streaks sweeping behind the device, green from the lower left, red from the upper right
        ctx.saveGState(); ctx.setBlendMode(.screen)
        for (i, (col, from, to)) in [(G, CGPoint(x: -80, y: 140), CGPoint(x: 1100, y: 760)), (G, CGPoint(x: -60, y: 260), CGPoint(x: 1080, y: 880)),
                                     (R, CGPoint(x: -100, y: 40), CGPoint(x: 1120, y: 640)), (R, CGPoint(x: 1120, y: 960), CGPoint(x: -80, y: 380))].enumerated() {
            let a = CGPoint(x: from.x * s, y: from.y * s), b = CGPoint(x: to.x * s, y: to.y * s)
            let width = [26, 10, 16, 8][i] * s, alpha: CGFloat = [0.55, 0.40, 0.45, 0.35][i]
            for (w, k) in [(width * 6, 0.10), (width * 2.2, 0.35), (width * 0.55, 1.0)] as [(CGFloat, CGFloat)] {   // halo, body, hot core
                ctx.setLineCap(.round); ctx.setLineWidth(w)
                ctx.setStrokeColor(k == 1 ? c(min(1, col.r + 0.45), min(1, col.g + 0.3), min(1, col.b + 0.45), alpha) : c(col.r, col.g, col.b, alpha * k))
                ctx.move(to: a); ctx.addQuadCurve(to: b, control: CGPoint(x: 512 * s, y: (a.y + b.y) / 2 + 60 * s)); ctx.strokePath()
            }
        }
        ctx.restoreGState()
        radial(CGPoint(x: 512 * s, y: 560 * s), 520 * s, [c(0, 0, 0, 0.45), c(0, 0, 0, 0)])   // darker behind the device, so it stands out
    case "vignette":   // a soft light at the centre falling off to pure black at the edges
        ctx.setFillColor(c(0, 0, 0)); ctx.fill(body)
        radial(CGPoint(x: 512 * s, y: 560 * s), 620 * s, [c(0.30, 0.30, 0.32), c(0.14, 0.14, 0.15), c(0.04, 0.04, 0.045), c(0, 0, 0)], [0, 0.35, 0.72, 1], sx: 1.0, sy: 0.95)
    case "amber":   // near-black with a gentle warm amber glow behind the screen, dark edges (the manner of NX2Apple's icon)
        ctx.setFillColor(c(0.035, 0.03, 0.028)); ctx.fill(body)
        radial(CGPoint(x: 512 * s, y: 560 * s), 560 * s, [c(0.78, 0.52, 0.24, 0.80), c(0.50, 0.31, 0.13, 0.45), c(0.18, 0.10, 0.04, 0.14), c(0, 0, 0, 0)], [0, 0.32, 0.68, 1], sx: 1.15, sy: 0.95)
        radial(CGPoint(x: 512 * s, y: 512 * s), 760 * s, [c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0.55)], [0, 0.6, 1])
    case "duo":   // near-black, the two grips' colours glowing behind the device and blending where they meet, dark edges
        ctx.setFillColor(c(0.03, 0.03, 0.035)); ctx.fill(body)
        ctx.saveGState(); ctx.setBlendMode(.screen)
        radial(CGPoint(x: 360 * s, y: 570 * s), 470 * s, [c(G.r, G.g, G.b, 0.62), c(G.r, G.g, G.b, 0.26), c(G.r, G.g, G.b, 0.06), c(G.r, G.g, G.b, 0)], [0, 0.35, 0.7, 1], sx: 1.05, sy: 0.95)
        radial(CGPoint(x: 664 * s, y: 570 * s), 470 * s, [c(R.r, R.g, R.b, 0.62), c(R.r, R.g, R.b, 0.26), c(R.r, R.g, R.b, 0.06), c(R.r, R.g, R.b, 0)], [0, 0.35, 0.7, 1], sx: 1.05, sy: 0.95)
        radial(CGPoint(x: 512 * s, y: 600 * s), 260 * s, [c(1, 1, 1, 0.10), c(1, 1, 1, 0)])   // a soft white where they meet
        ctx.restoreGState()
        radial(CGPoint(x: 512 * s, y: 512 * s), 760 * s, [c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0.6)], [0, 0.6, 1])
    case "halo":   // a warm-white halo behind the screen, as NX2Apple's amber glow, falling off into charcoal; green and red at its edges
        radial(CGPoint(x: 512 * s, y: 600 * s), 430 * s, [c(1, 0.94, 0.84, 0.70), c(0.85, 0.74, 0.58, 0.34), c(0.35, 0.30, 0.25, 0.10), c(0, 0, 0, 0)], [0, 0.42, 0.75, 1],
               sx: 1.05, sy: 0.9)
        radial(CGPoint(x: 200 * s, y: 540 * s), 280 * s, [c(G.r, G.g, G.b, 0.30), c(G.r, G.g, G.b, 0)])
        radial(CGPoint(x: 824 * s, y: 540 * s), 280 * s, [c(R.r, R.g, R.b, 0.30), c(R.r, R.g, R.b, 0)])
    default:   // horizon: a stage floor whose edge is a thin bright beam, its reflection and a haze above it ("beam": the beam alone, for the header mark)
        if kind != "beam" {
            radial(CGPoint(x: 512 * s, y: 330 * s), 470 * s, [c(1, 1, 1, 0.16), c(1, 1, 1, 0)], sx: 1.15, sy: 0.55)
            ctx.drawLinearGradient(grad([c(1, 1, 1, 0.07), c(1, 1, 1, 0)]), start: CGPoint(x: 0, y: 330 * s), end: CGPoint(x: 0, y: 100 * s), options: [])
        }
        for (w, a) in [(60.0, 0.12), (18.0, 0.35), (4.0, 1.0)] as [(CGFloat, CGFloat)] {   // the beam: a wide glow, a body, a hot line
            ctx.saveGState(); ctx.clip(to: CGRect(x: 0, y: (330 - w / 2) * s, width: 1024 * s, height: w * s))
            ctx.setBlendMode(.screen)
            ctx.drawLinearGradient(grad([c(G.r, G.g, G.b, 0), c(G.r, G.g, G.b, a), c(1, 1, 1, a), c(R.r, R.g, R.b, a), c(R.r, R.g, R.b, 0)], [0, 0.25, 0.5, 0.75, 1]),
                                   start: CGPoint(x: 110 * s, y: 0), end: CGPoint(x: 914 * s, y: 0), options: [])
            ctx.restoreGState()
        }
    }
    // a light rim at the top of the squircle, as glass catching the light
    guard base else { return }
    ctx.saveGState(); ctx.addPath(rr(body.insetBy(dx: 1.5 * s, dy: 1.5 * s), 185 * s)); ctx.setLineWidth(3 * s); ctx.replacePathWithStrokedPath(); ctx.clip()
    ctx.drawLinearGradient(grad([c(1, 1, 1, 0.35), c(1, 1, 1, 0.0)], [0, 0.5]), start: CGPoint(x: 0, y: body.maxY), end: CGPoint(x: 0, y: body.minY), options: [])
    ctx.restoreGState()
}

func icon(_ style: Int, size S: CGFloat = 1024) -> CGImage {
    let ctx = CGContext(data: nil, width: Int(S), height: Int(S), bitsPerComponent: 8, bytesPerRow: 0, space: cs, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
    let s = S / 1024
    ctx.interpolationQuality = .high; ctx.setShouldAntialias(true)
    let isMark = ProcessInfo.processInfo.environment["ICON_MARK"] == "1"   // the device alone on transparency
    let isHeader = ProcessInfo.processInfo.environment["ICON_HEADER"] == "1"   // the app's header mark: the icon without its squircle, fading out at the edges
    // the squircle
    let body = CGRect(x: 100 * s, y: 100 * s, width: 824 * s, height: 824 * s)
    let shape = rr(body, 186 * s)
    if !isMark && !isHeader { ctx.saveGState(); ctx.setShadow(offset: CGSize(width: 0, height: -12 * s), blur: 30 * s, color: c(0, 0, 0, 0.5)); fill(ctx, shape, c(0.05, 0.05, 0.06)); ctx.restoreGState() }
    ctx.saveGState(); if !isMark && !isHeader { ctx.addPath(shape); ctx.clip() }
    if !isMark && !isHeader {
    let bgTop = style == 2 ? c(0.07, 0.08, 0.09) : c(0.13, 0.13, 0.145), bgBottom = style == 2 ? c(0.01, 0.015, 0.02) : c(0.03, 0.03, 0.035)
    ctx.drawLinearGradient(grad([bgTop, bgBottom]), start: CGPoint(x: 0, y: body.maxY), end: CGPoint(x: 0, y: body.minY), options: [])
    let floor = CGPoint(x: 512 * s, y: (style == 4 ? 300 : 280) * s)
    ctx.drawRadialGradient(grad([c(G.r, G.g, G.b, style == 2 ? 0.30 : 0.13), c(G.r, G.g, G.b, 0)]), startCenter: floor, startRadius: 0, endCenter: floor, endRadius: 440 * s, options: [])
    // a fade-to-black vignette: the light gathers on the device and the edges melt into black
    let mid = CGPoint(x: 512 * s, y: 520 * s)
    ctx.drawRadialGradient(grad([c(0, 0, 0, 0), c(0, 0, 0, 0.15), c(0, 0, 0, 0.88), c(0, 0, 0, 1)], [0, 0.30, 0.66, 0.88]),
                           startCenter: mid, startRadius: 0, endCenter: mid, endRadius: 600 * s, options: [.drawsAfterEndLocation])
    }
    // The lighting: "halo+horizon" (chosen 2026-11-05), or another of lighting()'s kinds to compare (ICON_LIGHT=spotlight, streaks, halo,
    // horizon, or several joined by "+"; ICON_LIGHT=none: the earlier plain black squircle)
    let light = ProcessInfo.processInfo.environment["ICON_LIGHT"] ?? "amber"   // 0.4.0: the gold glow (chosen 2026-11-07); "halo+horizon" before
    if !isMark && !isHeader && light != "none" { for (i, k) in light.split(separator: "+").enumerated() { lighting(ctx, String(k), body, s, base: i == 0) } }   // "halo+horizon": both
    if isHeader {   // no background (it showed as a dark box on the bar): a small warm glow behind the screen and the floor beam, as the icon has them,
        // gentler and well inside the fade (the icon's wide halo and side glows showed their edges on the bar)
        let behind = CGPoint(x: 512 * s, y: 600 * s)
        ctx.drawRadialGradient(grad([c(1, 0.94, 0.84, 0.30), c(1, 0.94, 0.84, 0)]), startCenter: behind, startRadius: 0, endCenter: behind, endRadius: 260 * s, options: [])
        lighting(ctx, "beam", body, s, base: false)
    }
    if style == 2 && !isMark {   // a faint red counter-glow top right
        let p = CGPoint(x: 800 * s, y: 820 * s)
        ctx.drawRadialGradient(grad([c(R.r, R.g, R.b, 0.16), c(R.r, R.g, R.b, 0)]), startCenter: p, startRadius: 0, endCenter: p, endRadius: 380 * s, options: [])
    }

    // geometry: the screen block (bezel), the grips beside it, the base below
    let big = style == 3
    let lid = big ? CGRect(x: 292 * s, y: 380 * s, width: 440 * s, height: 312 * s) : CGRect(x: 302 * s, y: 404 * s, width: 420 * s, height: 296 * s)
    let gw = (big ? 112 : 100) * s
    let lg = CGRect(x: lid.minX - gw, y: lid.minY, width: gw, height: lid.height), rg = CGRect(x: lid.maxX, y: lid.minY, width: gw, height: lid.height)
    let base = big ? CGRect(x: 200 * s, y: 318 * s, width: 624 * s, height: 52 * s) : CGRect(x: 214 * s, y: 344 * s, width: 596 * s, height: 46 * s)

    // contact shadow under the base
    ctx.saveGState()
    ctx.setShadow(offset: CGSize(width: 0, height: -6 * s), blur: 26 * s, color: c(0, 0, 0, 0.7))
    fill(ctx, rr(base.insetBy(dx: 20 * s, dy: 8 * s), 20 * s), c(0, 0, 0, 0.6))
    ctx.restoreGState()

    // the base: aluminium with a darker front lip and a notch for opening the lid
    if style == 2 {
        fillGrad(ctx, rr(base, base.height / 2), grad([c(0.22, 0.23, 0.25), c(0.10, 0.10, 0.11)]), from: CGPoint(x: 0, y: base.maxY), to: CGPoint(x: 0, y: base.minY))
        ctx.addPath(rr(base, base.height / 2)); ctx.setStrokeColor(c(G.r, G.g, G.b, 0.45)); ctx.setLineWidth(3 * s); ctx.strokePath()
    } else {
        fillGrad(ctx, rr(base, base.height / 2), grad([c(0.86, 0.87, 0.89), c(0.62, 0.63, 0.66), c(0.48, 0.49, 0.52)], [0, 0.55, 1]),
                 from: CGPoint(x: 0, y: base.maxY), to: CGPoint(x: 0, y: base.minY))
        ctx.saveGState(); ctx.addPath(rr(base, base.height / 2)); ctx.clip()
        fill(ctx, CGPath(rect: CGRect(x: base.minX, y: base.maxY - 3 * s, width: base.width, height: 3 * s), transform: nil), c(1, 1, 1, 0.55))   // the top edge catching light
        ctx.restoreGState()
    }
    let notch = CGRect(x: base.midX - 64 * s, y: base.midY - 4 * s, width: 128 * s, height: 14 * s)
    fill(ctx, rr(notch, 7 * s), style == 2 ? c(0, 0, 0, 0.5) : c(0.40, 0.41, 0.44))

    // the grips: shaded, with a light top edge; a glow in Neon
    for (r, left, col) in [(lg, true, G), (rg, false, R)] {
        let p = grip(r, left: left)
        ctx.saveGState()
        ctx.setShadow(offset: CGSize(width: 0, height: -10 * s), blur: style == 2 ? 46 * s : 24 * s,
                      color: style == 2 ? c(col.r, col.g, col.b, 0.85) : c(0, 0, 0, 0.55))
        fill(ctx, p, c(col.r, col.g, col.b))
        ctx.restoreGState()
        fillGrad(ctx, p, grad([c(min(1, col.r * 1.18 + 0.08), min(1, col.g * 1.12 + 0.06), min(1, col.b * 1.15 + 0.06)),
                                   c(col.r, col.g, col.b), c(col.r * 0.72, col.g * 0.72, col.b * 0.72)], [0, 0.5, 1]),
                 from: CGPoint(x: 0, y: r.maxY), to: CGPoint(x: 0, y: r.minY))
        // a soft highlight along the outer edge
        ctx.saveGState(); ctx.addPath(p); ctx.clip()
        let hx = left ? r.minX + r.width * 0.28 : r.maxX - r.width * 0.28
        ctx.drawRadialGradient(grad([c(1, 1, 1, 0.30), c(1, 1, 1, 0)]), startCenter: CGPoint(x: hx, y: r.maxY - r.height * 0.18), startRadius: 0,
                               endCenter: CGPoint(x: hx, y: r.maxY - r.height * 0.18), endRadius: r.width * 0.75, options: [])
        ctx.restoreGState()
        // the seam where the grip meets the screen
        ctx.setStrokeColor(c(0, 0, 0, 0.35)); ctx.setLineWidth(3 * s)
        let sx = left ? r.maxX - 1.5 * s : r.minX + 1.5 * s
        ctx.move(to: CGPoint(x: sx, y: r.minY + 6 * s)); ctx.addLine(to: CGPoint(x: sx, y: r.maxY - 6 * s)); ctx.strokePath()
    }
    // controls: left grip stick high, buttons low; right grip buttons high, stick low
    let sr = (big ? 27 : 24) * s, br = (big ? 10 : 9) * s, bd = (big ? 22 : 20) * s
    stick(ctx, CGPoint(x: lg.midX + 2 * s, y: lg.minY + lg.height * 0.70), sr)
    buttons(ctx, CGPoint(x: lg.midX + 2 * s, y: lg.minY + lg.height * 0.30), bd, br)
    buttons(ctx, CGPoint(x: rg.midX - 2 * s, y: rg.minY + rg.height * 0.70), bd, br)
    stick(ctx, CGPoint(x: rg.midX - 2 * s, y: rg.minY + rg.height * 0.30), sr)
    // small + and − buttons near the screen's top corners
    ctx.setFillColor(c(0, 0, 0, 0.45))
    fill(ctx, rr(CGRect(x: lg.maxX - 30 * s, y: lg.maxY - 30 * s, width: 16 * s, height: 5 * s), 2.5 * s), c(0, 0, 0, 0.45))
    fill(ctx, rr(CGRect(x: rg.minX + 14 * s, y: rg.maxY - 30 * s, width: 16 * s, height: 5 * s), 2.5 * s), c(0, 0, 0, 0.45))
    fill(ctx, rr(CGRect(x: rg.minX + 19.5 * s, y: rg.maxY - 35.5 * s, width: 5 * s, height: 16 * s), 2.5 * s), c(0, 0, 0, 0.45))

    // the screen block: black bezel with an aluminium rim, the black screen, its camera notch
    ctx.saveGState(); ctx.setShadow(offset: CGSize(width: 0, height: -8 * s), blur: 22 * s, color: c(0, 0, 0, 0.6))
    fill(ctx, rr(lid, 12 * s), c(0.06, 0.06, 0.07)); ctx.restoreGState()
    ctx.addPath(rr(lid.insetBy(dx: 1.5 * s, dy: 1.5 * s), 11 * s))
    ctx.setStrokeColor(style == 2 ? c(0.30, 0.32, 0.35) : c(0.52, 0.53, 0.56)); ctx.setLineWidth(4 * s); ctx.strokePath()
    let screen = lid.insetBy(dx: 18 * s, dy: 18 * s)
    fillGrad(ctx, rr(screen, 8 * s), grad([c(0.07, 0.07, 0.085), c(0.015, 0.015, 0.02)]), from: CGPoint(x: screen.minX, y: screen.maxY), to: CGPoint(x: screen.maxX, y: screen.minY))
    fill(ctx, rr(CGRect(x: lid.midX - 30 * s, y: lid.maxY - 14 * s, width: 60 * s, height: 10 * s), 5 * s), c(0.06, 0.06, 0.07))
    ctx.setFillColor(c(0.16, 0.18, 0.22)); ctx.fillEllipse(in: CGRect(x: lid.midX - 3 * s, y: lid.maxY - 11.5 * s, width: 6 * s, height: 6 * s))   // the camera

    // the "2": soft white, or glowing green in Neon
    let noTwo = ProcessInfo.processInfo.environment["NO_TWO"] != "0"   // 0.4.0: no "2" on the screen (NO_TWO=0 brings it back)
    let mark = ProcessInfo.processInfo.environment["SCREEN"] ?? ""   // cmd | window | dock | desktop: a Mac cue on the screen instead of the "2"
    if !mark.isEmpty { macScreen(ctx, screen, mark, s) } else if noTwo {} else if style == 2 { two(ctx, center: CGPoint(x: screen.midX, y: screen.midY), size: 170 * s, color: c(0.55, 1, 0.70), glow: c(G.r, G.g, G.b, 1)) }
    else { two(ctx, center: CGPoint(x: screen.midX, y: screen.midY), size: (big ? 180 : 160) * s, color: c(0.96, 0.97, 0.98)) }
    _ = noTwo

    // a shine across the screen
    ctx.saveGState(); ctx.addPath(rr(screen, 8 * s)); ctx.clip()
    let shine = CGMutablePath()
    shine.move(to: CGPoint(x: screen.minX, y: screen.maxY)); shine.addLine(to: CGPoint(x: screen.minX + screen.width * 0.42, y: screen.maxY))
    shine.addLine(to: CGPoint(x: screen.minX + screen.width * 0.18, y: screen.minY)); shine.addLine(to: CGPoint(x: screen.minX, y: screen.minY)); shine.closeSubpath()
    ctx.addPath(shine); ctx.clip()
    ctx.drawLinearGradient(grad([c(1, 1, 1, style == 2 ? 0.06 : 0.10), c(1, 1, 1, 0.0)]), start: CGPoint(x: screen.minX, y: screen.maxY), end: CGPoint(x: screen.midX, y: screen.minY), options: [])
    ctx.restoreGState()

    if style == 4 {   // light from above: a soft top light on the squircle and a highlight on the bezel's top edge
        let top = CGPoint(x: 512 * s, y: 930 * s)
        ctx.drawRadialGradient(grad([c(1, 1, 1, 0.10), c(1, 1, 1, 0)]), startCenter: top, startRadius: 0, endCenter: top, endRadius: 520 * s, options: [])
        fill(ctx, rr(CGRect(x: lid.minX + 14 * s, y: lid.maxY - 3 * s, width: lid.width - 28 * s, height: 2 * s), 1 * s), c(1, 1, 1, 0.35))
    }
    ctx.restoreGState()
    // the squircle's rim light
    if isHeader {   // fade everything out in an oval around the device, so it melts into the bar behind it
        ctx.saveGState(); ctx.setBlendMode(.destinationIn)
        ctx.translateBy(x: 512 * s, y: 510 * s); ctx.scaleBy(x: 1, y: 0.75)
        ctx.drawRadialGradient(grad([c(0, 0, 0, 1), c(0, 0, 0, 1), c(0, 0, 0, 0)], [0, 0.62, 1]), startCenter: .zero, startRadius: 0,
                               endCenter: .zero, endRadius: 450 * s, options: [])
        ctx.restoreGState()
        return ctx.makeImage()!.cropping(to: CGRect(x: 62 * s, y: 173 * s, width: 900 * s, height: 674 * s))!
    }
    if !isMark { ctx.addPath(rr(body.insetBy(dx: 1 * s, dy: 1 * s), 185 * s)); ctx.setStrokeColor(c(1, 1, 1, style == 2 ? 0.10 : 0.07)); ctx.setLineWidth(2 * s); ctx.strokePath() }
    return ctx.makeImage()!
}


let args = CommandLine.arguments
let img = icon(1, size: CGFloat(Double(args.count > 2 ? args[2] : "1024") ?? 1024))
try! NSBitmapImageRep(cgImage: img).representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: args[1]))
print("icon:", args[1])
