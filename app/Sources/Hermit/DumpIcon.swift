import AppKit
import NXCore

// The game's own icon, for a game the shop's list has no banner for (a new release, a game the list never had): a .nup dump carries the
// icon in the clear, and tools/nup.py reads it. It is the player's own file's picture, kept beside the banners on their Mac
// (artwork/<title ID>.icon.jpg) and shown where the banner would be. A dump of plain folders (exefs, romfs) carries no icon; a built game
// falls back to its app's own icon (GameLibrary.artworkURL). Each .nup is asked once, in the background, and never again until it changes.
enum DumpIcon {
    static func file(_ titleID: String, in directory: URL = ArtworkStore.shared.directory) -> URL {
        directory.appendingPathComponent(titleID.uppercased() + ".icon.jpg")
    }

    static func cached(_ titleID: String, in directory: URL = ArtworkStore.shared.directory) -> URL? {
        let url = file(titleID, in: directory)
        return FileManager.default.fileExists(atPath: url.path) ? url : nil
    }

    /// The .nup a game's dump is: the file itself, or the one .nup in the folder chosen. Nil for a dump of folders.
    static func nup(_ dump: String) -> String? {
        var isDir: ObjCBool = false
        guard FileManager.default.fileExists(atPath: dump, isDirectory: &isDir) else { return nil }
        if !isDir.boolValue { return dump.lowercased().hasSuffix(".nup") ? dump : nil }
        let found = ((try? FileManager.default.contentsOfDirectory(atPath: dump)) ?? []).filter { $0.lowercased().hasSuffix(".nup") }
        return found.count == 1 ? dump + "/" + found[0] : nil
    }

    /// Reads the icons of the games that have no picture and a .nup dump. Returns the title IDs whose icon is new. Off the main thread.
    static func fetchMissing(_ games: [(titleID: String, dump: String)], repo: String, directory: URL = ArtworkStore.shared.directory,
                             python: () -> String = { Toolchain.findPython().path }) -> [String] {
        let fm = FileManager.default, triedFile = directory.appendingPathComponent("icons-tried.json")
        var tried = (try? Data(contentsOf: triedFile)).flatMap { try? JSONDecoder().decode([String: String].self, from: $0) } ?? [:]
        let before = tried
        var added: [String] = [], py: String?
        let tool = repo + "/tools/nup.py"
        for g in games where cached(g.titleID, in: directory) == nil {
            guard let nup = nup(g.dump), fm.fileExists(atPath: tool) else { continue }
            let date = ((try? fm.attributesOfItem(atPath: nup))?[.modificationDate] as? Date)?.timeIntervalSince1970 ?? 0
            let mark = "\(nup)|\(Int(date))"
            if tried[g.titleID] == mark { continue }
            tried[g.titleID] = mark
            if py == nil { py = python() }
            guard let py, !py.isEmpty else { break }
            let out = fm.temporaryDirectory.appendingPathComponent("hermit-icon-\(g.titleID).img")
            defer { try? fm.removeItem(at: out) }
            let p = Process()
            p.executableURL = URL(fileURLWithPath: py); p.arguments = ["-I", "-B", tool, "icon", nup, out.path]
            p.standardOutput = FileHandle.nullDevice; p.standardError = FileHandle.nullDevice
            guard (try? p.run()) != nil else { continue }
            p.waitUntilExit()
            guard p.terminationStatus == 0, let data = try? Data(contentsOf: out), data.count < 20 << 20, NSImage(data: data) != nil else { continue }
            try? fm.createDirectory(at: directory, withIntermediateDirectories: true)
            if (try? data.write(to: file(g.titleID, in: directory), options: .atomic)) != nil { added.append(g.titleID) }
        }
        if tried != before, fm.fileExists(atPath: directory.path) { try? JSONEncoder().encode(tried).write(to: triedFile, options: .atomic) }
        return added
    }
}
