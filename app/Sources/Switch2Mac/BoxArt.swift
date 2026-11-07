import AppKit
import Foundation
import ImageIO

/// Retail box fronts for the Library's case views, downloaded onto the player's Mac at run time and kept there (never in the repository or the app):
/// - GameTDB's Switch database (www.gametdb.com: a list of its game codes and names, then art.gametdb.com/switch/coverHQ/<region>/<code>.jpg),
///   for Switch games;
/// - the LaunchBox Games Database (gamesdb.launchbox-app.com/Metadata.zip, about 110 MB, refreshed daily: every game and image file name), for
///   Switch 2 games and the Switch games GameTDB lacks; the box fronts themselves come from images.launchbox-app.com.
/// The way to read LaunchBox's database (the zip once, boiled down to a small index of the platforms wanted, "Box - Front" by region) follows
/// PyroCade (Pyrodrifter/PyroCade, MIT, launchbox.js); the code is switch2mac's own. Neither site matches by title ID, so games are matched by
/// name (BoxArtMatch). Settings → Box art turns it off; the Library then draws covers from the eShop banners (CoverArt.swift).
actor BoxArtStore {
    static let shared = BoxArtStore(directory: FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        .appendingPathComponent("switch2mac/boxart"))
    static let enabledKey = "s2m.boxArt"
    nonisolated static var enabled: Bool { UserDefaults.standard.object(forKey: enabledKey) as? Bool ?? true }

    static let gametdbList = URL(string: "https://www.gametdb.com/switchtdb.txt?LANG=EN")!
    static let launchboxZip = URL(string: "https://gamesdb.launchbox-app.com/Metadata.zip")!
    static let hosts: Set<String> = ["www.gametdb.com", "art.gametdb.com", "gamesdb.launchbox-app.com", "images.launchbox-app.com"]
    static let indexVersion = 1
    static let platforms = ["Nintendo Switch": "switch", "Nintendo Switch 2": "switch2"]

    let directory: URL
    private var index: Index?
    private var failed = false   // one attempt per launch
    private var running = false

    struct Index: Codable {
        var version: Int
        var fetched: Date
        var gametdb: [String: String]     // normalised name → GameTDB code (Switch)
        var launchbox: [String: String]   // "<console>|<normalised name>" → image file name (Box - Front, best region)
    }

    init(directory: URL) { self.directory = directory }

    /// A saved box front read at the size the Library shows it (scans are up to 1166 × 1888, about 9 MB each once opened; this is a quarter of
    /// that), opened right away so drawing it later costs nothing. Safe off the main thread.
    nonisolated static func load(_ url: URL, maxPixels: Int = 1000) -> NSImage? {
        guard let src = CGImageSourceCreateWithURL(url as CFURL, nil),
              let cg = CGImageSourceCreateThumbnailAtIndex(src, 0, [kCGImageSourceCreateThumbnailFromImageAlways: true, kCGImageSourceThumbnailMaxPixelSize: maxPixels,
                                                                    kCGImageSourceCreateThumbnailWithTransform: true, kCGImageSourceShouldCacheImmediately: true] as CFDictionary)
        else { return nil }
        return NSImage(cgImage: cg, size: NSSize(width: cg.width, height: cg.height))
    }

    /// The saved box front of a title, nil while it has none.
    nonisolated static func cached(_ titleID: String, in directory: URL = BoxArtStore.shared.directory) -> URL? {
        let u = directory.appendingPathComponent(titleID.uppercased() + ".jpg")
        return FileManager.default.fileExists(atPath: u.path) ? u : nil
    }

    /// Download the box fronts of the given games that have none yet; returns the title IDs that got one.
    @discardableResult func fetchMissing(_ games: [(titleID: String, name: String, switch2: Bool)]) async -> [String] {
        guard Self.enabled, !running else { return [] }
        let wanted = games.filter { Self.cached($0.titleID, in: directory) == nil }
        guard !wanted.isEmpty else { return [] }
        running = true
        defer { running = false; index = nil }   // the name tables (thousands of entries) are let go after each fetch: read again next time from index.json
        guard let index = await loadIndex() else { return [] }
        var added: [String] = []
        let tried = directory.appendingPathComponent("tried.json")
        var none = (try? JSONDecoder().decode([String: String].self, from: Data(contentsOf: tried))) ?? [:]   // title ID → the index date it found nothing in
        let stamp = ISO8601DateFormatter().string(from: index.fetched)
        for g in wanted where none[g.titleID] != stamp {
            var urls: [URL] = []
            if !g.switch2, let code = BoxArtMatch.find(g.name, in: index.gametdb) {
                urls += ["US", "EN"].compactMap { URL(string: "https://art.gametdb.com/switch/coverHQ/\($0)/\(code).jpg") }
            }
            let lb = index.launchbox.filter { $0.key.hasPrefix(g.switch2 ? "switch2|" : "switch|") }
            let keys = Dictionary(uniqueKeysWithValues: lb.map { (String($0.key.split(separator: "|", maxSplits: 1)[1]), $0.value) })
            if let file = BoxArtMatch.find(g.name, in: keys), let u = URL(string: "https://images.launchbox-app.com/" + (file.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? file)) {
                urls.append(u)
            }
            var got = false
            for u in urls where Self.hosts.contains(u.host ?? "") && u.scheme == "https" {
                guard let (data, response) = try? await URLSession.shared.data(from: u),
                      (response as? HTTPURLResponse)?.statusCode == 200, data.count < 30 << 20, let img = NSImage(data: data) else { continue }
                if u.host == "art.gametdb.com", BoxArtMatch.isEshopTemplate(img) { continue }   // GameTDB's red download-only sleeve: try LaunchBox's front
                try? FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
                if (try? data.write(to: directory.appendingPathComponent(g.titleID.uppercased() + ".jpg"), options: .atomic)) != nil { got = true; break }
            }
            if got { added.append(g.titleID) } else { none[g.titleID] = stamp }
        }
        try? JSONEncoder().encode(none).write(to: tried, options: .atomic)
        return added
    }

    /// The index: the saved one while it is under a month old, else built again from both sources.
    private func loadIndex() async -> Index? {
        let file = directory.appendingPathComponent("index.json")
        let decoder = JSONDecoder(); decoder.dateDecodingStrategy = .iso8601
        if index == nil, let data = try? Data(contentsOf: file) { index = try? decoder.decode(Index.self, from: data) }
        if let index, index.version == Self.indexVersion, failed || Date().timeIntervalSince(index.fetched) < 30 * 86400 { return index }
        guard !failed else { return index }
        do {
            try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
            let (list, _) = try await URLSession.shared.data(from: Self.gametdbList)
            let gametdb = BoxArtMatch.gametdbNames(String(decoding: list, as: UTF8.self))
            let (zip, response) = try await URLSession.shared.download(from: Self.launchboxZip)
            defer { try? FileManager.default.removeItem(at: zip) }
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw URLError(.badServerResponse) }
            let xml = directory.appendingPathComponent("Metadata.xml")
            defer { try? FileManager.default.removeItem(at: xml) }
            let unzip = Process(); unzip.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
            unzip.arguments = ["-o", "-q", zip.path, "Metadata.xml", "-d", directory.path]
            try unzip.run(); unzip.waitUntilExit()
            guard unzip.terminationStatus == 0 else { throw URLError(.cannotDecodeContentData) }
            let launchbox = try LaunchBoxIndex.read(xml)
            let fresh = Index(version: Self.indexVersion, fetched: Date(), gametdb: gametdb, launchbox: launchbox)
            let encoder = JSONEncoder(); encoder.dateEncodingStrategy = .iso8601
            try encoder.encode(fresh).write(to: file, options: .atomic)
            index = fresh
            return fresh
        } catch {
            failed = true
            fputs("boxart: index: \(error.localizedDescription)\n", stderr)
            return index
        }
    }
}

/// LaunchBox's Metadata.xml read as a stream (it is hundreds of MB): the Switch and Switch 2 games, and for each its best "Box - Front"
/// (North America first, then the world, Europe, others), as "<console>|<normalised name>" → image file name.
final class LaunchBoxIndex: NSObject, XMLParserDelegate {
    private var games: [String: (name: String, console: String)] = [:]   // database ID → game
    private var fronts: [String: (file: String, rank: Int)] = [:]         // database ID → best front
    private var element = "", text = "", record: [String: String] = [:], inRecord = ""

    static func read(_ url: URL) throws -> [String: String] {
        guard let parser = XMLParser(contentsOf: url) else { throw URLError(.cannotOpenFile) }
        let d = LaunchBoxIndex(); parser.delegate = d
        guard parser.parse() else { throw parser.parserError ?? URLError(.cannotDecodeContentData) }
        return d.result()
    }

    static func rank(_ region: String) -> Int {
        if region.isEmpty { return 1 }
        if region.range(of: "North America|United States|World|Canada", options: .regularExpression) != nil { return 0 }
        if region.range(of: "Europe|United Kingdom|Australia|Oceania", options: .regularExpression) != nil { return 2 }
        return 3
    }

    func result() -> [String: String] {
        var out: [String: String] = [:]
        for (id, g) in games {
            guard let f = fronts[id] else { continue }
            let key = g.console + "|" + BoxArtMatch.normalise(g.name)
            if out[key] == nil { out[key] = f.file }
        }
        return out
    }

    func parser(_ parser: XMLParser, didStartElement name: String, namespaceURI: String?, qualifiedName: String?, attributes: [String: String] = [:]) {
        if name == "Game" || name == "GameImage" { inRecord = name; record = [:] }
        element = name; text = ""
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) { if !inRecord.isEmpty { text += string } }
    func parser(_ parser: XMLParser, didEndElement name: String, namespaceURI: String?, qualifiedName: String?) {
        if name == inRecord {
            if name == "Game", let id = record["DatabaseID"], let p = record["Platform"], let console = BoxArtStore.platforms[p], let n = record["Name"] {
                games[id] = (n, console)
            } else if name == "GameImage", let id = record["DatabaseID"], let file = record["FileName"],
                      let type = record["Type"], type == "Box - Front" || type == "Box - Front - Reconstructed" {
                let r = Self.rank(record["Region"] ?? "") * 2 + (type == "Box - Front" ? 0 : 1)
                if fronts[id].map({ r < $0.rank }) ?? true { fronts[id] = (file, r) }
            }
            inRecord = ""
        } else if !inRecord.isEmpty {
            record[name] = text.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        text = ""
    }
}

/// Matching a game's name against a database's names, which neither GameTDB nor LaunchBox keys by title ID.
enum BoxArtMatch {
    /// Lower case, no accents, no ™ ® ©, no bracketed tags (dump tools' "[0100…][v0]"), "&" as "and", only letters, digits and single spaces.
    static func normalise(_ name: String) -> String {
        var s = name.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: Locale(identifier: "en_US")).lowercased()
        s = s.replacingOccurrences(of: #"[\[\(][^\]\)]*[\]\)]"#, with: " ", options: .regularExpression)
        s = s.replacingOccurrences(of: "&", with: " and ")
        s = s.replacingOccurrences(of: #"[^a-z0-9]+"#, with: " ", options: .regularExpression)
        return s.trimmingCharacters(in: .whitespaces)
    }

    /// GameTDB's sleeve for download-only games: a plain red cover with a small picture in the middle and the shop's name, which PyroCade also sets
    /// apart (eshop-covers.js). Told by its border: nearly every sample along the edges and down the middle line is the sleeve's red.
    static func isEshopTemplate(_ image: NSImage) -> Bool {
        var rect = CGRect(origin: .zero, size: image.size)
        guard let cg = image.cgImage(forProposedRect: &rect, context: nil, hints: nil) else { return false }
        let ratio = CGFloat(cg.width) / CGFloat(max(cg.height, 1))
        guard ratio > 0.57, ratio < 0.66 else { return false }
        let w = 64, h = 104
        var px = [UInt8](repeating: 0, count: w * h * 4)
        guard let ctx = CGContext(data: &px, width: w, height: h, bitsPerComponent: 8, bytesPerRow: w * 4, space: CGColorSpaceCreateDeviceRGB(),
                                  bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else { return false }
        ctx.draw(cg, in: CGRect(x: 0, y: 0, width: w, height: h))
        func red(_ x: Int, _ y: Int) -> Bool {   // y from the top
            let i = ((h - 1 - y) * w + x) * 4; let r = Int(px[i]), g = Int(px[i + 1]), b = Int(px[i + 2])
            return r > 140 && g < 65 && b < 80 && r > g * 2
        }
        var hit = 0, n = 0
        for x in [2, 4, 59, 61] { for y in [18, 25, 35, 45, 55, 65, 90, 99] { n += 1; if red(x, y) { hit += 1 } } }
        for y in [13, 20, 25, 67, 71, 94] { n += 1; if red(32, y) { hit += 1 } }
        return Double(hit) / Double(n) >= 0.91
    }

    /// GameTDB's "CODE = Name" lines → normalised name → code (the first code for a name wins).
    static func gametdbNames(_ text: String) -> [String: String] {
        var out: [String: String] = [:]
        for line in text.split(whereSeparator: \.isNewline) {
            let parts = line.split(separator: "=", maxSplits: 1).map { $0.trimmingCharacters(in: .whitespaces) }
            guard parts.count == 2, parts[0].range(of: "^[A-Z0-9]{4,6}$", options: .regularExpression) != nil else { continue }
            let n = normalise(parts[1])
            if !n.isEmpty, out[n] == nil { out[n] = parts[0] }
        }
        return out
    }

    /// The value whose name matches: the same normalised name, else the same without "the", else the closest by shared words, where every word of
    /// the shorter name is in the longer and the longer has at most three more ("Legends ZA Switch 2 Edition" and "Pokemon Legends Z-A Nintendo Switch 2 Edition").
    static func find(_ name: String, in table: [String: String]) -> String? {
        let n = normalise(name)
        guard !n.isEmpty else { return nil }
        if let v = table[n] { return v }
        let bare = n.hasPrefix("the ") ? String(n.dropFirst(4)) : "the " + n
        if let v = table[bare] { return v }
        var words = Set<String>()
        for w in n.split(separator: " ") {
            if w == "za" { words.insert("z"); words.insert("a") } else { words.insert(String(w)) }   // "Z-A" reads as two words in a database
        }
        var best: (score: Double, value: String, extra: Int)?
        for (k, v) in table {
            let kw = Set(k.split(separator: " ").map(String.init))
            let shared: Double = Double(words.intersection(kw).count)
            let small: Double = Double(min(words.count, kw.count))
            let extra: Int = abs(words.count - kw.count)
            guard small > 0, extra <= 3, shared >= small else { continue }
            let score: Double = shared / Double(max(words.count, kw.count))
            if let b = best, score < b.score || (score == b.score && extra >= b.extra) { continue }
            best = (score, v, extra)
        }
        guard let b = best, b.score >= 0.55 else { return nil }
        return b.value
    }
}
