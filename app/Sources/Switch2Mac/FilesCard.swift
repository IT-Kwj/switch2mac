import SwiftUI
import NXCore
import NXLauncher
import NXModel

/// Settings, "Where your files are": every place switch2mac and the games it builds keep files on this Mac, with the folder, its size and Show in Finder,
/// so a player can see what is where. Nothing here deletes: build leftovers have Clean up (StorageCard); the rest are the player's own (games, saves, dumps, keys).
/// Sizes are measured in the background (allocated blocks, as Finder counts them) and kept across visits to Settings for a minute.
struct FilesPlace: Identifiable, Equatable {
    var id: String { key }
    let key: String
    let title: String
    let note: String
    let path: String
    var measure = true   // false: shown without a size (the player's dumps folder can hold every console's games)
    var children: [FilesPlace] = []
}

@MainActor private enum FilesCache { static var sizes: [String: Int64] = [:]; static var at = Date.distantPast }

struct FilesCard: View {
    @ObservedObject var library: GameLibrary
    let build: BuildStore
    @State private var sizes: [String: Int64] = FilesCache.sizes
    @State private var open: Set<String> = []
    @AppStorage(BuildStore.s2mOutputKey) private var output = ""   // OutputCard's setting

    static let home = NSHomeDirectory()
    static let support = home + "/Library/Application Support/switch2mac"
    static let gameData = home + "/Library/Application Support/nxnative"
    static let logs = home + "/Library/Logs/nxnative"

    var body: some View {
        CardGroup("Where your files are", footnote: "Everything switch2mac and your games keep on this Mac. Your dumps and keys are only read, never changed, moved or uploaded. To free space, use Clean up under Storage, or delete a game from its Manage menu.") {
            ForEach(Array(places.enumerated()), id: \.element.id) { n, p in
                if n > 0 { CardDivider() }
                row(p, child: false)
                if open.contains(p.key) {
                    ForEach(p.children) { c in CardDivider(); row(c, child: true) }
                }
            }
        }
        .task(id: places.map(\.path)) {
            guard Date().timeIntervalSince(FilesCache.at) > 60 || sizes.isEmpty else { return }
            try? await Task.sleep(nanoseconds: 1_200_000_000)
            if Task.isCancelled { return }
            let wanted = places.flatMap { [$0] + $0.children }.filter(\.measure).map { ($0.key, $0.path) }
            let games = gameApps
            let found = await Task.detached(priority: .utility) { () -> [String: Int64] in
                var out: [String: Int64] = [:]
                for (key, path) in wanted { out[key] = key == "games" ? games.reduce(0) { $0 + Self.size($1) } : Self.size(path, skip: key == "support" ? ["builds"] : []) }
                return out
            }.value
            sizes = found; FilesCache.sizes = found; FilesCache.at = Date()
        }
    }

    @ViewBuilder private func row(_ p: FilesPlace, child: Bool) -> some View {
        let exists = FileManager.default.fileExists(atPath: p.path)
        CardRow(child ? "    " + p.title : p.title, detail: RepoLayout.shortPath(p.path), detail2: child ? "" : p.note, dot: nil, help: p.path,
                open: p.children.isEmpty ? nil : open.contains(p.key)) {
            if p.measure {
                Text(sizes[p.key].map(StorageCard.bytes) ?? (exists ? "…" : "none")).font(.manrope(12.5, .semibold)).foregroundStyle(.secondary)
            }
            if exists { Button("Show in Finder") { NSWorkspace.shared.activateFileViewerSelecting([URL(fileURLWithPath: p.path)]) } }
        }
        .contentShape(Rectangle())
        .onTapGesture { if !p.children.isEmpty { withAnimation(.easeOut(duration: 0.15)) { if open.contains(p.key) { open.remove(p.key) } else { open.insert(p.key) } } } }
    }

    /// The game apps switch2mac built (the Library's), wherever they were put.
    private var gameApps: [String] { library.games.map(\.appPath).filter { !$0.isEmpty && FileManager.default.fileExists(atPath: $0) } }

    private var places: [FilesPlace] {
        let out = output.isEmpty ? "/Applications" : output
        let names = Dictionary(library.games.map { ($0.titleID.uppercased(), $0.name) }, uniquingKeysWith: { a, _ in a })
        let saves = ((try? FileManager.default.contentsOfDirectory(atPath: Self.gameData)) ?? []).filter { !$0.hasPrefix(".") }.sorted().map { tid in
            FilesPlace(key: "data." + tid, title: names[tid.uppercased()] ?? tid, note: "", path: Self.gameData + "/" + tid)
        }
        var list = [
            FilesPlace(key: "games", title: "Your games", note: "The games switch2mac built (\(gameApps.count)), in your output folder.", path: out),
            FilesPlace(key: "data", title: "Saves and settings", note: "Each game's saves, its settings and the shaders it has learned. Kept when a game is rebuilt.", path: Self.gameData, children: saves),
            FilesPlace(key: "builds", title: "Build leftovers", note: "Working files that make a rebuild faster. Clean up under Storage removes them.", path: Self.support + "/builds"),
            FilesPlace(key: "support", title: "switch2mac's own files", note: "The build tools and engines it downloaded, game pictures and its records.", path: Self.support),
            FilesPlace(key: "logs", title: "Game logs", note: "What each game wrote while it ran: the Performance page reads them.", path: Self.logs),
        ]
        if !library.folder.isEmpty { list.append(FilesPlace(key: "dumps", title: "Your game dumps", note: "Only read: switch2mac never changes them.", path: library.folder, measure: false)) }
        let keys = build.keysPath
        if !keys.isEmpty { list.append(FilesPlace(key: "keys", title: "Your Switch keys", note: "Only read while a Switch game builds: switch2mac keeps just this path.", path: keys, measure: false)) }
        return list
    }

    /// Bytes a file or folder takes on disk (allocated blocks); `skip`: names of top-level folders left out (measured on their own row).
    nonisolated static func size(_ path: String, skip: Set<String> = []) -> Int64 {
        let fm = FileManager.default; var isDir: ObjCBool = false
        guard fm.fileExists(atPath: path, isDirectory: &isDir) else { return 0 }
        let keys: [URLResourceKey] = [.totalFileAllocatedSizeKey, .isDirectoryKey]
        let root = URL(fileURLWithPath: path)
        if !isDir.boolValue { return Int64((try? root.resourceValues(forKeys: Set(keys)))?.totalFileAllocatedSize ?? 0) }
        guard let e = fm.enumerator(at: root, includingPropertiesForKeys: keys, options: []) else { return 0 }
        var total: Int64 = 0
        for case let u as URL in e {
            if !skip.isEmpty, e.level == 1, skip.contains(u.lastPathComponent) { e.skipDescendants(); continue }
            if let v = try? u.resourceValues(forKeys: Set(keys)), v.isDirectory != true { total += Int64(v.totalFileAllocatedSize ?? 0) }
        }
        return total
    }
}
