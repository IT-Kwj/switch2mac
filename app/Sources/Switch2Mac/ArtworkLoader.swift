import AppKit

// The Library's pictures, read in one place: each game's banner (small, GameLibrary.artworkThumbnail), its retail box front (BoxArtStore.load) and
// where its title sits in the banner (BannerFocus). The Library asks again whenever its games change, and during a build that is often: each ask used
// to read and measure every picture again, in a task of its own, and dozens ran at once, each holding all the pictures (1.9 GB once). Now a new ask
// cancels the one under way, a picture already read is kept until its file changes, and only new or changed pictures are read.
@MainActor final class ArtworkLoader {
    static let shared = ArtworkLoader()

    private struct Read { let stamp: Date; let image: NSImage }
    private var banners: [String: Read] = [:]   // file path → its small picture, as of the file's date
    private var boxes: [String: Read] = [:]
    private var focus: [String: CGPoint] = [:]  // "path|date" → where the title sits
    private var task: Task<Void, Never>?

    /// Lets every picture go (MemoryTrim): the next ask reads them again.
    func purge() { task?.cancel(); task = nil; banners = [:]; boxes = [:] }

    /// The pictures of `games`: `pictures` once read (banners and box fronts by game), `places` once measured.
    func load(_ games: [LibraryGame], repo: String, boxArt: Bool,
              pictures: @escaping ([UUID: NSImage], [UUID: NSImage]) -> Void, places: @escaping ([UUID: CGPoint]) -> Void) {
        task?.cancel()
        let known = (banners, boxes, focus)
        task = Task.detached(priority: .userInitiated) {
            func stamp(_ url: URL) -> Date { (try? url.resourceValues(forKeys: [.contentModificationDateKey]).contentModificationDate) ?? .distantPast }
            var newBanners = known.0, newBoxes = known.1, newFocus = known.2
            var art: [UUID: NSImage] = [:], box: [UUID: NSImage] = [:], paths: [UUID: String] = [:]
            for g in games {
                if Task.isCancelled { return }
                if let url = GameLibrary.artworkURL(for: g, repo: repo) {
                    let d = stamp(url)
                    if let r = newBanners[url.path], r.stamp == d { art[g.id] = r.image }
                    else if let image = BoxArtStore.load(url, maxPixels: 960) { newBanners[url.path] = Read(stamp: d, image: image); art[g.id] = image }
                    paths[g.id] = "\(url.path)|\(d.timeIntervalSince1970)"
                }
                if boxArt, let url = BoxArtStore.cached(g.titleID) {
                    let d = stamp(url)
                    if let r = newBoxes[url.path], r.stamp == d { box[g.id] = r.image }
                    else if let image = BoxArtStore.load(url) { newBoxes[url.path] = Read(stamp: d, image: image); box[g.id] = image }
                }
            }
            let (a, b, nb, nx) = (art, box, newBanners, newBoxes)
            await MainActor.run { guard !Task.isCancelled else { return }; ArtworkLoader.shared.banners = nb; ArtworkLoader.shared.boxes = nx; pictures(a, b) }
            var found: [UUID: CGPoint] = [:]
            for (id, key) in paths {
                if Task.isCancelled { return }
                if let p = newFocus[key] { found[id] = p }
                else if let image = art[id], let p = BannerFocus.find(image) { newFocus[key] = p; found[id] = p }
            }
            let (f, nf) = (found, newFocus)
            await MainActor.run { guard !Task.isCancelled else { return }; ArtworkLoader.shared.focus = nf; places(f) }
        }
    }
}
