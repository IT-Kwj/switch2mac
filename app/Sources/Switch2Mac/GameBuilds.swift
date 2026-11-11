import Foundation

/// A game's builds as the repository lists them (games/<game>/game.json "builds": Mario Kart World has switch2mac's engine and nxnative's), and the one
/// installed on this Mac (s2m_build.txt in the game's data folder, written by switch2mac.py install). The Library shows the installed one and Manage offers the others.
enum GameBuilds {
    struct Build: Equatable { let id, name: String }

    /// The builds of a game with several; empty for a game with one (nothing to choose).
    static func list(titleID: String, repo: String) -> [Build] {
        let games = URL(fileURLWithPath: repo).appendingPathComponent("games")
        for dir in (try? FileManager.default.contentsOfDirectory(at: games, includingPropertiesForKeys: nil)) ?? [] {
            guard let data = try? Data(contentsOf: dir.appendingPathComponent("game.json")),
                  let o = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any],
                  (o["title_id"] as? String)?.uppercased() == titleID.uppercased() else { continue }
            let builds = (o["builds"] as? [[String: Any]] ?? []).compactMap { b in (b["id"] as? String).map { Build(id: $0, name: b["name"] as? String ?? $0) } }
            return builds.count > 1 ? builds : []
        }
        return []
    }

    /// Whether the repository has a page for the game (games/<game>/game.json): a game with none has no build made for it yet. Read once per repository.
    static func hasPage(titleID: String, repo: String) -> Bool {
        guard !titleID.isEmpty else { return false }
        pageLock.lock(); defer { pageLock.unlock() }
        if pageCache?.repo != repo {
            var ids = Set<String>()
            let games = URL(fileURLWithPath: repo).appendingPathComponent("games")
            for dir in (try? FileManager.default.contentsOfDirectory(at: games, includingPropertiesForKeys: nil)) ?? [] {
                if let data = try? Data(contentsOf: dir.appendingPathComponent("game.json")),
                   let o = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any], let t = o["title_id"] as? String { ids.insert(t.uppercased()) }
            }
            pageCache = (repo, ids)
        }
        return pageCache?.ids.contains(titleID.uppercased()) ?? false
    }
    nonisolated(unsafe) private static var pageCache: (repo: String, ids: Set<String>)?
    private static let pageLock = NSLock()

    /// The build installed, by id; nil before switch2mac.py install noted one.
    static func installed(titleID: String) -> String? {
        let note = NSHomeDirectory() + "/Library/Application Support/nxnative/\(titleID)/s2m_build.txt"
        return (try? String(contentsOfFile: note, encoding: .utf8))?.trimmingCharacters(in: .whitespacesAndNewlines).nilIfEmpty
    }

    /// The next build of this game uses `id` (the Builds page's Build card reads the same choice: BuildStore.buildChoice).
    static func choose(_ id: String, titleID: String) { UserDefaults.standard.set(id, forKey: "s2m.pendingBuild." + titleID) }
}

private extension String { var nilIfEmpty: String? { isEmpty ? nil : self } }
