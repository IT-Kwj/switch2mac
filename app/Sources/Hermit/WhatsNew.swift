import Foundation
import NXCore
import Combine

// What's New: the newest build updates, new games and project news, and for each game on this Mac whether a newer build than its own
// is out and what changed in between. Two sources, both public and both already what Hermit publishes:
//   - the repository's commits (GitHub's API, at most every ten minutes): the update workflow (.github/workflows/update-builds.yml,
//     tools/engine/update.py) commits one line per change, "<game>[ (<build> build)]: <engine> <commit12> (<what the engine's commit says>)",
//     and "New game: <name> (nxnative <commit12>)" for a game it adds;
//   - CHANGELOG.md in the app's copy of the repository: the maintainer's own words for the bigger news.
// A game's own build is read from the app it built: S2M_ENGINE=<engine>-<commit12> in Contents/Resources/dm/env.txt (switch2mac.py's
// app_switches); an app from before that has only the engine, and then the app's date says which updates came after it.

enum WhatsNew {
    static let repo = "azmasm/hermit"

    /// One update the workflow made to a game's build, or a game it added.
    struct Update: Codable, Equatable, Identifiable {
        var id: String { sha }
        var sha: String   // the repository commit
        var date: Date
        var game: String   // as game.json names it
        var build: String   // the build id for a game with several ("pokopia-native"), else ""
        var engine: String   // "nxnative", "switch2mac", "pokopia-native"
        var commit: String   // the engine's commit the build moved to (12 hex digits)
        var note: String   // what the engine's commit says, tidied
        var newGame = false
        var quiet = false   // the engine's own words mark it as a change a player cannot feel (docs, typo, ...)
    }

    /// One of nxnative's own commits: the engine most games here are built with. It reaches a game when that game's build next moves.
    struct EngineChange: Codable, Equatable, Identifiable {
        var id: String { sha }
        var sha: String
        var date: Date
        var text: String   // the first line
        var body: String   // the start of the message, for finding the games it names
    }

    static let engineRepo = "seedds/nxnative"

    /// nxnative's commits as GitHub's API lists them, without the ones about its own checks and docs.
    static func engineChanges(fromAPI data: Data) -> [EngineChange] {
        guard let list = (try? JSONSerialization.jsonObject(with: data)) as? [[String: Any]] else { return [] }
        let iso = ISO8601DateFormatter()
        return list.compactMap { c in
            guard let sha = c["sha"] as? String, let commit = c["commit"] as? [String: Any], let message = commit["message"] as? String,
                  let when = ((commit["committer"] as? [String: Any])?["date"] as? String).flatMap(iso.date(from:)) else { return nil }
            let first = String(message.split(separator: "\n", maxSplits: 1).first ?? "")
            guard !isHousekeeping(first) else { return nil }
            return EngineChange(sha: sha, date: when, text: first, body: String(message.prefix(600)))
        }
    }

    /// An engine commit about the project's own checks, tests or docs, not about how a game runs.
    static func isHousekeeping(_ line: String) -> Bool {
        line.range(of: #"^(CI\b|lint|README|docs?/|test_|tests?\b|Architecture check|Merge\b)|is green again"#, options: [.regularExpression, .caseInsensitive]) != nil
    }

    /// The games a change names, from the ones the repository has: by title ID, by full name, by its first two words ("Donkey Kong"),
    /// or by a single word of the name no other game has ("Yoshi", "Pokopia").
    static func games(named text: String, pinned: [String: Pinned]) -> [String] {
        let words = pinned.values.flatMap { Set(nameWords($0.name)) }
        var counts: [String: Int] = [:]; for w in words { counts[w, default: 0] += 1 }
        let folded = fold(text)
        return pinned.compactMap { tid, p -> String? in
            let w = nameWords(p.name)
            var keys = [fold(p.name)]
            if w.count >= 2 { keys.append(w[0] + " " + w[1]) }
            keys += w.filter { $0.count >= 5 && counts[$0] == 1 }
            let hit = text.uppercased().contains(tid) || keys.contains { folded.range(of: #"\b"# + NSRegularExpression.escapedPattern(for: $0) + #"\b"#, options: .regularExpression) != nil }
            return hit ? p.name : nil
        }.sorted()
    }

    static func fold(_ s: String) -> String { s.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: Locale(identifier: "en_US_POSIX")) }
    static func nameWords(_ name: String) -> [String] {
        fold(name).split { !$0.isLetter && !$0.isNumber }.map(String.init).filter { !["the", "and", "of"].contains($0) }
    }

    /// One section of CHANGELOG.md: its heading and its points.
    struct News: Equatable, Identifiable {
        var id: String { heading }
        var heading: String
        var date: Date?
        var points: [String]
    }

    static let updateLine = try! NSRegularExpression(pattern: #"^(.+?)(?: \(([\w-]+) build\))?: (switch2mac|nxnative|pokopia-native) ([0-9a-f]{12}) \((.*)\)$"#)
    static let newGameLine = try! NSRegularExpression(pattern: #"^New game: (.+) \(([\w-]+) ([0-9a-f]{12})\)$"#)

    /// A commit's first line as an update, or nil for any other commit.
    static func update(subject: String, sha: String, date: Date) -> Update? {
        let range = NSRange(subject.startIndex..., in: subject)
        func group(_ m: NSTextCheckingResult, _ i: Int) -> String { Range(m.range(at: i), in: subject).map { String(subject[$0]) } ?? "" }
        if let m = newGameLine.firstMatch(in: subject, range: range) {
            return Update(sha: sha, date: date, game: group(m, 1), build: "", engine: group(m, 2), commit: group(m, 3), note: "", newGame: true)
        }
        guard let m = updateLine.firstMatch(in: subject, range: range) else { return nil }
        let raw = group(m, 5)
        return Update(sha: sha, date: date, game: group(m, 1), build: group(m, 2), engine: group(m, 3), commit: group(m, 4), note: tidy(raw),
                      quiet: isQuiet(raw) || isQuiet(tidy(raw)))
    }

    /// An engine's commit message as a line a player reads: no "fix:"-style prefix or issue numbers, a capital first letter.
    static func tidy(_ s: String) -> String {
        var t = s.replacingOccurrences(of: #"^\s*(fix|feat|chore|perf|refactor|build|ci|docs|style|test)(\([^)]*\))?!?:\s*"#, with: "",
                                       options: [.regularExpression, .caseInsensitive])
        t = t.replacingOccurrences(of: #"\s*\((#\d+[, ]*)+\)"#, with: "", options: .regularExpression).trimmingCharacters(in: .whitespaces)
        let first = t.prefix { !$0.isWhitespace }
        return first.allSatisfy(\.isLetter) ? t.prefix(1).uppercased() + t.dropFirst() : t   // not a name like "pokopia-native"
    }

    /// Changes a player cannot feel; an update that says only this is left out of "what changed".
    static func isQuiet(_ note: String) -> Bool {
        note.range(of: #"^(typo|readme|docs?|comment|formatting|format|lint|whitespace|merge|bump|ci|tests?)\b"#, options: [.regularExpression, .caseInsensitive]) != nil
    }

    /// The commits of GitHub's API answer (newest first) that are updates.
    static func updates(fromAPI data: Data) -> [Update] {
        guard let list = (try? JSONSerialization.jsonObject(with: data)) as? [[String: Any]] else { return [] }
        let iso = ISO8601DateFormatter()
        return list.compactMap { c in
            guard let sha = c["sha"] as? String, let commit = c["commit"] as? [String: Any],
                  let message = commit["message"] as? String,
                  let when = ((commit["committer"] as? [String: Any])?["date"] as? String).flatMap(iso.date(from:)) else { return nil }
            return update(subject: String(message.split(separator: "\n", maxSplits: 1).first ?? ""), sha: sha, date: when)
        }
    }

    /// CHANGELOG.md's sections, newest first as the file keeps them: "## 2026-11-05 (8): switch2mac app 0.2.0" then "- " points
    /// (a point's following lines belong to it).
    static func news(changelog text: String, limit: Int = 8) -> [News] {
        var out: [News] = []
        let day = DateFormatter(); day.locale = Locale(identifier: "en_US_POSIX"); day.dateFormat = "yyyy-MM-dd"; day.timeZone = .current   // a calendar day: read in the Mac's own time zone, so it shows as written (read as UTC it showed the day before west of UTC)
        for line in text.split(separator: "\n", omittingEmptySubsequences: false) {
            if line.hasPrefix("## ") {
                if out.count == limit { break }
                let heading = line.dropFirst(3).trimmingCharacters(in: .whitespaces)
                out.append(News(heading: heading, date: day.date(from: String(heading.prefix(10))), points: []))
            } else if !out.isEmpty, line.hasPrefix("- ") {
                out[out.count - 1].points.append(String(line.dropFirst(2)))
            } else if !out.isEmpty, !out[out.count - 1].points.isEmpty, !line.trimmingCharacters(in: .whitespaces).isEmpty {
                out[out.count - 1].points[out[out.count - 1].points.count - 1] += " " + line.trimmingCharacters(in: .whitespaces)
            }
        }
        return out
    }

    /// A game's builds as the repository pins them now (games/*/game.json), keyed by title ID.
    struct Pinned: Equatable {
        var name: String
        var builds: [(id: String, engine: String, commit: String)]
        static func == (a: Pinned, b: Pinned) -> Bool { a.name == b.name && a.builds.map(\.commit) == b.builds.map(\.commit) }
    }

    static func pinned(repo: String) -> [String: Pinned] {
        var out: [String: Pinned] = [:]
        let games = URL(fileURLWithPath: repo).appendingPathComponent("games")
        for dir in (try? FileManager.default.contentsOfDirectory(at: games, includingPropertiesForKeys: nil)) ?? [] {
            guard let data = try? Data(contentsOf: dir.appendingPathComponent("game.json")),
                  let o = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any],
                  let tid = (o["title_id"] as? String)?.uppercased(), let name = o["name"] as? String else { continue }
            var builds: [(String, String, String)] = (o["builds"] as? [[String: Any]] ?? []).compactMap { b in
                guard let id = b["id"] as? String, let e = b["engine"] as? [String: Any], let kind = e["kind"] as? String else { return nil }
                return (id, kind, e["commit"] as? String ?? "")
            }
            if builds.isEmpty, let e = o["engine"] as? [String: Any], let kind = e["kind"] as? String { builds = [(kind, kind, e["commit"] as? String ?? "")] }
            out[tid] = Pinned(name: name, builds: builds)
        }
        return out
    }

    /// What a game app was built with: the engine and (newer apps) its commit, from S2M_ENGINE in its env.txt.
    static func builtWith(app: String) -> (engine: String, commit: String)? {
        guard let text = try? String(contentsOfFile: app + "/Contents/Resources/dm/env.txt", encoding: .utf8),
              let line = text.split(separator: "\n").first(where: { $0.hasPrefix("S2M_ENGINE=") }) else { return nil }
        let value = String(line.dropFirst("S2M_ENGINE=".count)).trimmingCharacters(in: .whitespaces)
        if let dash = value.lastIndex(of: "-"), value[value.index(after: dash)...].allSatisfy(\.isHexDigit) || value.hasSuffix("-untested") {
            return (String(value[..<dash]), String(value[value.index(after: dash)...]))
        }
        return (value, "")
    }

    /// Where a game on this Mac stands against the newest build of its engine.
    struct Standing: Equatable {
        enum State: Equatable { case upToDate, behind, untested, unknown }
        var state: State
        var build: String   // the build id the game was made with
        var engine: String
        var mine: String   // its engine commit (8 hex digits), "" when the app does not say
        var newest: String   // the pinned commit (8 hex digits)
        var builtOn: Date?
        var changes: [Update]   // newest first; only the ones a player can notice
        var quietOnly: Bool { state == .behind && changes.isEmpty }
    }

    static func standing(appPath: String, pinned: Pinned?, updates: [Update], installedBuild: String?) -> Standing? {
        guard let pinned, let built = builtWith(app: appPath) ?? installedBuild.map({ id in (pinned.builds.first { $0.id == id }?.engine ?? id, "") }) else { return nil }
        let builtOn = (try? FileManager.default.attributesOfItem(atPath: appPath))?[.modificationDate] as? Date
        if built.commit == "untested" {
            return Standing(state: .untested, build: "", engine: built.engine, mine: "untested", newest: "", builtOn: builtOn, changes: [])
        }
        // the build: the one the app names by engine (a game with two builds on two engines), or the one installed
        let build = pinned.builds.first { $0.id == installedBuild && $0.engine == built.engine } ?? pinned.builds.first { $0.engine == built.engine }
        guard let build else { return Standing(state: .unknown, build: "", engine: built.engine, mine: String(built.commit.prefix(8)), newest: "", builtOn: builtOn, changes: []) }
        let newest = String(build.commit.prefix(8)), mine = String(built.commit.prefix(8))
        if !mine.isEmpty, build.commit.hasPrefix(mine) {
            return Standing(state: .upToDate, build: build.id, engine: build.engine, mine: mine, newest: newest, builtOn: builtOn, changes: [])
        }
        let multi = pinned.builds.count > 1
        let mineUpdates = updates.filter { !$0.newGame && $0.game == pinned.name && $0.engine == build.engine && (!multi || $0.build == build.id) }
        var after: [Update]
        if !mine.isEmpty, let i = mineUpdates.firstIndex(where: { $0.commit.hasPrefix(mine) }) { after = Array(mineUpdates[..<i]) }
        else if let builtOn { after = mineUpdates.filter { $0.date > builtOn } }
        else { after = mineUpdates }
        if mine.isEmpty, after.isEmpty {   // an older app that names no commit, and nothing came out after it
            return Standing(state: .upToDate, build: build.id, engine: build.engine, mine: "", newest: newest, builtOn: builtOn, changes: [])
        }
        return Standing(state: .behind, build: build.id, engine: build.engine, mine: mine, newest: newest, builtOn: builtOn,
                        changes: after.filter { !$0.quiet })
    }
}

/// The updates from GitHub (kept between launches, asked again at most every ten minutes) and the changelog from the app's copy of the
/// repository. `seen` is when the player last opened What's New: anything newer lights the tab's dot.
@MainActor
final class WhatsNewStore: ObservableObject {
    @Published private(set) var updates: [WhatsNew.Update] = []
    @Published private(set) var engine: [WhatsNew.EngineChange] = []   // nxnative's own changes
    @Published private(set) var news: [WhatsNew.News] = []
    @Published private(set) var pinned: [String: WhatsNew.Pinned] = [:]
    /// The games each of nxnative's changes names (WhatsNew.games), by commit: worked out once off the main thread when the changes or the
    /// pinned games change. Matching every row's text against every game's name on each redraw made the page stall when it first opened
    @Published private(set) var engineTags: [String: [String]] = [:]
    @Published private(set) var checked: Date?
    @Published private(set) var failed = false
    @Published private(set) var seen: Date
    /// Each built game's standing against its newest build, for the Library (computed off the main thread: each reads its app bundle).
    @Published private(set) var standings: [UUID: WhatsNew.Standing] = [:]
    private var games: [LibraryGame] = []
    static let seenKey = "whatsNew.seen"
    private let cache: URL
    private var fetching = false

    init(cache: URL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0].appendingPathComponent(AppIdentity.folder + "/whats-new.json")) {
        self.cache = cache
        seen = UserDefaults.standard.object(forKey: Self.seenKey) as? Date ?? .distantPast
        let decoder = JSONDecoder(); decoder.dateDecodingStrategy = .iso8601
        if let data = try? Data(contentsOf: cache), let saved = try? decoder.decode(Saved.self, from: data) { updates = saved.updates; engine = saved.engine ?? []; checked = saved.checked }
    }

    private struct Saved: Codable { var updates: [WhatsNew.Update]; var engine: [WhatsNew.EngineChange]?; var checked: Date }

    /// The newest date anything on the page carries.
    var newest: Date? { [updates.first?.date, engine.first?.date, news.compactMap(\.date).max()].compactMap { $0 }.max() }
    var unread: Bool { newest.map { $0 > seen } ?? false }

    /// The library's games changed: their standings are worked out again.
    func setGames(_ games: [LibraryGame]) {
        self.games = games
        findStandings()
    }

    private func findTags() {
        let changes = engine, pinned = pinned
        Task {
            engineTags = await Task.detached(priority: .userInitiated) { () -> [String: [String]] in
                Dictionary(changes.map { ($0.sha, WhatsNew.games(named: $0.body, pinned: pinned)) }, uniquingKeysWith: { a, _ in a })
            }.value
        }
    }

    private func findStandings() {
        let games = games, pinned = pinned, updates = updates
        Task {
            standings = await Task.detached(priority: .utility) { () -> [UUID: WhatsNew.Standing] in
                var out: [UUID: WhatsNew.Standing] = [:]
                for g in games where g.isReady {
                    out[g.id] = WhatsNew.standing(appPath: g.appPath, pinned: pinned[g.titleID.uppercased()], updates: updates,
                                                  installedBuild: GameBuilds.installed(titleID: g.titleID))
                }
                return out
            }.value
        }
    }

    func markSeen() {
        seen = Date()
        UserDefaults.standard.set(seen, forKey: Self.seenKey)
    }

    /// Reads the repository copy again, and asks GitHub when the last answer is older than ten minutes (or `force`).
    func refresh(repo: String, force: Bool = false) {
        let changelog = (try? String(contentsOfFile: repo + "/CHANGELOG.md", encoding: .utf8)) ?? ""
        let n = WhatsNew.news(changelog: changelog, limit: 30)
        if n != news { news = n }   // unchanged news would redraw the whole page each time the tab opens
        let pins = WhatsNew.pinned(repo: repo)
        if pins != pinned { pinned = pins; findStandings(); findTags() }
        else if engineTags.isEmpty && !engine.isEmpty { findTags() }   // the saved changes, on the first refresh after launch
        guard !fetching, force || checked.map({ Date().timeIntervalSince($0) > 600 }) ?? true else { return }
        fetching = true
        func request(_ repo: String, _ count: Int) -> URLRequest {
            var r = URLRequest(url: URL(string: "https://api.github.com/repos/\(repo)/commits?per_page=\(count)")!, timeoutInterval: 20)
            r.setValue("application/vnd.github+json", forHTTPHeaderField: "Accept")
            r.setValue("Hermit", forHTTPHeaderField: "User-Agent")
            return r
        }
        let cache = cache, oursRequest = request(WhatsNew.repo, 100), theirsRequest = request(WhatsNew.engineRepo, 60)
        Task {
            async let ours = try? URLSession.shared.data(for: oursRequest)
            async let theirs = try? URLSession.shared.data(for: theirsRequest)
            let (a, b) = await (ours, theirs)
            let ok = (a?.1 as? HTTPURLResponse)?.statusCode == 200
            fetching = false
            failed = !ok
            guard ok, let a else { return }
            updates = WhatsNew.updates(fromAPI: a.0)
            findStandings()
            if let b, (b.1 as? HTTPURLResponse)?.statusCode == 200 { engine = WhatsNew.engineChanges(fromAPI: b.0); findTags() }
            checked = Date()
            let encoder = JSONEncoder(); encoder.dateEncodingStrategy = .iso8601
            try? FileManager.default.createDirectory(at: cache.deletingLastPathComponent(), withIntermediateDirectories: true)
            if let data = try? encoder.encode(Saved(updates: updates, engine: engine, checked: Date())) { try? data.write(to: cache, options: .atomic) }
        }
    }
}
