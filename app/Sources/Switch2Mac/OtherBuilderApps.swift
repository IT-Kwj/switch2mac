import Foundation
import NXCore

/// Apps that other projects' builders make (MacNativeGames' ports) carry no DMTitleID: their bundle identifier says which game they are.
/// Each game page lists its builds' identifiers (games/<game>/game.json, a build's "app_ids": Tears of the Kingdom's "org.macnativegames.totk"),
/// so the Library files such an app under its game and shows it as built.
enum OtherBuilderApps {
    struct Game: Equatable { let titleID: String; let name: String }
    /// Bundle identifier (lowercased) → its game (title ID and the page's name), read once from the repository's game pages.
    static let table: [String: Game] = load(repo: RepoLayout.find())

    static func game(forBundle id: String) -> Game? { table[id.lowercased()] }

    static func load(repo: String) -> [String: Game] {
        let games = URL(fileURLWithPath: repo).appendingPathComponent("games")
        guard let dirs = try? FileManager.default.contentsOfDirectory(at: games, includingPropertiesForKeys: nil) else { return [:] }
        var out: [String: Game] = [:]
        for dir in dirs {
            guard let data = try? Data(contentsOf: dir.appendingPathComponent("game.json")),
                  let game = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any],
                  let tid = game["title_id"] as? String, tid.range(of: "^[0-9A-Fa-f]{16}$", options: .regularExpression) != nil else { continue }
            for build in game["builds"] as? [[String: Any]] ?? [] {
                for id in build["app_ids"] as? [String] ?? [] { out[id.lowercased()] = Game(titleID: tid.uppercased(), name: game["name"] as? String ?? tid.uppercased()) }
            }
        }
        return out
    }
}
