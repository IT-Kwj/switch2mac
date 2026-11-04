import AppKit
import SwiftUI
import Vision

/// Where a banner's title sits, so the hero frames it with the title in the middle (as NX2Apple shows its key art) instead of cutting a
/// centred slice that can lose a title near the top. macOS's own text recognition (Vision) finds the title's words; small text (a shop
/// sign in the picture) is ignored, and the biggest words with the ones beside them are the title. Nothing leaves the Mac.
enum BannerFocus {
    /// The title's centre as fractions of the picture from its top-left corner; nil when no title text is found (the hero then centres the picture).
    static func find(_ image: NSImage) -> CGPoint? {
        var rect = CGRect(origin: .zero, size: image.size)
        guard let cg = image.cgImage(forProposedRect: &rect, context: nil, hints: nil) else { return nil }
        let read = VNRecognizeTextRequest(); read.recognitionLevel = .accurate; read.usesLanguageCorrection = false
        let shapes = VNDetectTextRectanglesRequest()   // stylised lettering recognition cannot read is often still seen as text
        try? VNImageRequestHandler(cgImage: cg).perform([read, shapes])
        let boxes = ((read.results ?? []).map(\.boundingBox) + (shapes.results ?? []).map(\.boundingBox)).filter { $0.height >= 0.04 }   // Vision: 0-1, origin bottom-left
        guard let biggest = boxes.max(by: { $0.width * $0.height < $1.width * $1.height }) else { return nil }
        let title = boxes.filter { b in
            b.width * b.height >= biggest.width * biggest.height * 0.2 && abs(b.midX - biggest.midX) < 0.3 && abs(b.midY - biggest.midY) < 0.2
        }.reduce(biggest) { $0.union($1) }
        return CGPoint(x: title.midX, y: 1 - title.midY)
    }
}

/// A banner filling `width` × `height`, moved so its title (BannerFocus) sits at the frame's centre as far as the picture allows; centred without one.
struct FocusedBanner: View {
    let image: NSImage
    let focus: CGPoint?
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        let size = image.size, scale = max(width / max(size.width, 1), height / max(size.height, 1))
        let w = size.width * scale, h = size.height * scale
        let f = focus ?? CGPoint(x: 0.5, y: 0.5)
        let x = min(max(f.x * w - width / 2, 0), w - width), y = min(max(f.y * h - height / 2, 0), h - height)
        Image(nsImage: image).resizable().interpolation(.high)
            .frame(width: w, height: h)
            .offset(x: -x, y: -y)
            .frame(width: width, height: height, alignment: .topLeading)
            .clipped()
    }
}
