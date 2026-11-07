import AppKit
import SwiftUI

/// A game's portrait cover (2:3, a game case's shape), cut from its eShop banner (1920 × 1080, Artwork.swift) at the banner's own resolution: 720 × 1080 around
/// the game's title (BannerFocus), so the name and key art stay in the middle and nothing is enlarged. Made on the player's Mac from the banner it already has:
/// no other download. A game without a banner gets switch2mac's own cover (GameCover) in the same shape.
enum CoverArt {
    static let aspect: CGFloat = 184.0 / 300.0   // width / height of a cover: a Switch case front (retail box scans are about 0.62)
    private static let cache = NSCache<NSString, NSImage>()
    static func purge() { cache.removeAllObjects() }   // MemoryTrim

    /// The portrait cut of `image`, its centre at `focus` (fractions of the picture, BannerFocus) as far as the picture allows; nil when it cannot be read
    static func portrait(_ image: NSImage, focus: CGPoint?, key: String) -> NSImage? {
        let ck = "\(key)-\(focus.map { "\(Int($0.x * 1000))" } ?? "c")" as NSString
        if let hit = cache.object(forKey: ck) { return hit }
        var rect = CGRect(origin: .zero, size: image.size)
        guard let cg = image.cgImage(forProposedRect: &rect, context: nil, hints: nil) else { return nil }
        guard let crop = rectangle(width: CGFloat(cg.width), height: CGFloat(cg.height), focusX: focus?.x),
              let cut = cg.cropping(to: crop) else { return nil }
        let out = NSImage(cgImage: cut, size: NSSize(width: crop.width, height: crop.height))
        cache.setObject(out, forKey: ck)
        return out
    }

    /// The 2:3 rectangle (pixels) of a width × height picture whose middle is at focusX (a fraction, nil: the centre), kept inside the picture. A picture
    /// narrower than 2:3 keeps its width and is cut in height instead.
    static func rectangle(width: CGFloat, height: CGFloat, focusX: CGFloat?) -> CGRect? {
        guard width > 0, height > 0 else { return nil }
        if width / height <= aspect {
            let h = (width / aspect).rounded(.down)
            return CGRect(x: 0, y: ((height - h) / 2).rounded(.down), width: width, height: h)
        }
        let w = (height * aspect).rounded(.down)
        let x = min(max((focusX ?? 0.5) * width - w / 2, 0), width - w).rounded(.down)
        return CGRect(x: x, y: 0, width: w, height: height)
    }
}

/// A game as a cover: its portrait cut, or switch2mac's own cover in the same shape, with a fine edge. Used by the Library's Covers view.
struct CoverImage: View {
    let game: LibraryGame
    let image: NSImage?
    let focus: CGPoint?
    let width: CGFloat
    var box: NSImage? = nil   // the retail box front (BoxArt.swift), shown whole when there is one

    var body: some View {
        let height = width / CoverArt.aspect
        ZStack {
            if let box {
                Image(nsImage: box).resizable().interpolation(.high).scaledToFill()
            } else if let image, let cover = CoverArt.portrait(image, focus: focus, key: game.titleID) {
                Image(nsImage: cover).resizable().interpolation(.high).scaledToFill()
            } else {
                GameCover(name: game.name, titleID: game.titleID)
            }
        }
        .frame(width: width, height: height).clipped()
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(Color.white.opacity(0.10)))
    }
}

/// How the Library lays out its games under the hero: one row of wide cards (the original), or every game as a cover in a grid. Remembered between launches.
enum LibraryLayout: String, CaseIterable, Identifiable {
    case carousel, flipbook, stack, covers, row
    var id: String { rawValue }
    var label: String { ["carousel": "Carousel", "flipbook": "Flipbook", "stack": "Stack", "covers": "Covers", "row": "Row"][rawValue] ?? rawValue }
    /// How the 3D cases stand (CaseScene.swift), nil for the flat views.
    var cases: CaseLayout? { ["carousel": CaseLayout.carousel, "flipbook": .flipbook, "stack": .stack][rawValue] }
    static func load(_ defaults: UserDefaults = .standard) -> LibraryLayout { LibraryLayout(rawValue: defaults.string(forKey: "libraryLayout") ?? "") ?? .row }
    func save(_ defaults: UserDefaults = .standard) { defaults.set(rawValue, forKey: "libraryLayout") }
}
