import AppKit
import SwiftUI
import Vision

/// Where a banner's title sits, so the hero frames it with the title in the middle (as the original launcher shows its key art) instead of cutting a
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

/// The whole banner at its own shape (16:9, 1920 × 1080 from the eShop), never cut or enlarged past its height, on the right of the hero; a blurred, darkened copy
/// fills the width behind it and the picture fades into it on its left, where the game's name and buttons sit. A hero wider than 16:9 used to fill its width with
/// the picture, cutting its top and bottom and enlarging it (softer); this keeps every pixel of the art and its sharpness.
struct FullBanner: View {
    let image: NSImage
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        let size = image.size, aspect = max(size.width, 1) / max(size.height, 1)
        let fitW = min(width, height * aspect), fitH = fitW / aspect
        ZStack(alignment: .trailing) {
            Image(nsImage: image).resizable().interpolation(.medium).scaledToFill()
                .frame(width: width, height: height).blur(radius: 40).overlay(Color.black.opacity(0.45)).clipped()
                .allowsHitTesting(false)
            Image(nsImage: image).resizable().interpolation(.high)
                .frame(width: fitW, height: fitH)
                .mask(LinearGradient(stops: [.init(color: .clear, location: 0), .init(color: .black, location: fitW < width ? 0.28 : 0)],
                                     startPoint: .leading, endPoint: .trailing))
        }
        .frame(width: width, height: height).clipped()
    }
}
