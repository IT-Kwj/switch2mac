import AppKit
import Combine

// The Performance page's runs: one summary per time a game was played, read from the game's log once the game has closed. The
// engines write the same stats lines into every log (dm/gfx/nvn: every 300 frames), so nothing has to be switched on to get them:
//   [dm] [nvn] power up to frame N: ... (47.2 fps); CPU 173% (100 = one core) ...
//   [dm] [nvn] frame interval up to frame N: ... p99 26.34 ms
//   [dm] [nvn] timing up to frame N: ... GPU p50 8.90 / ...
//   [dm] [nvn-mtl] memory up to frame N: resident 9606 MB, ...
//   launcher: env S2M_ENGINE=nxnative-84dea6983541 (the build: switch2mac.py's app_switches)
// A run is known by its game and its log's creation date, which the launcher keeps when it renames the log to .prev.log at the next
// start, so a run is read once and both logs can be looked at every time. The summaries stay on this Mac (runs.json in the app's
// folder); Share puts one into the How it ran form, which the player sends themself.

struct GameRun: Codable, Equatable, Identifiable {
    var id: String   // "<title ID>@<log creation time>"
    var titleID: String
    var name: String
    var start: Date
    var seconds: Double
    var engine = ""   // "nxnative", "switch2mac", "pokopia-native"; empty when the log does not say
    var version = ""   // the engine's commit (8 hex digits), or "untested"
    var avgFPS: Double?
    var minFPS: Double?
    var maxFPS: Double?
    var lowFPS: Double?   // 1% low: 1000 / the typical 99th-percentile frame interval
    var peakMemoryMB: Int?
    var gpuMs: Double?   // the GPU's typical (median) time a frame
    var cpuPercent: Double?   // as the log counts it: 100 is one core busy

    /// "nxnative 84dea698", as the overlay's Engine line and the form's version field write it.
    var build: String { [engine, version].filter { !$0.isEmpty }.joined(separator: " ") }
}

enum GameRuns {
    /// Runs shorter than this (a crash at start, a quick look at the menu) are not kept.
    static let minimumSeconds = 30.0
    /// How many summaries are kept; the page shows the newest three.
    static let kept = 20

    /// The summary of one log's text, or nil when it holds no frame-rate line (the game never got going).
    static func summarize(_ text: String, titleID: String, name: String, start: Date, end: Date) -> GameRun? {
        var fps: [Double] = [], cpu: [Double] = [], p99: [Double] = [], gpu: [Double] = []
        var peak: Int?, engine = "", version = "", commit = "", logName = ""
        for line in text.split(whereSeparator: \.isNewline) {
            if line.hasPrefix("[dm] [nvn] power up to frame") {
                if let v = number(in: line, after: "(", before: " fps)") { fps.append(v) }
                if let v = number(in: line, after: "; CPU ", before: "%") { cpu.append(v) }
            } else if line.hasPrefix("[dm] [nvn] frame interval up to frame") {
                if let v = number(in: line, after: "p99 ", before: " ms") { p99.append(v) }
            } else if line.hasPrefix("[dm] [nvn] timing up to frame") {
                if let v = number(in: line, after: "GPU p50 ", before: " /") { gpu.append(v) }
            } else if line.hasPrefix("[dm] [nvn-mtl] memory up to frame") {
                if let v = number(in: line, after: "resident ", before: " MB") { peak = max(peak ?? 0, Int(v)) }
            } else if line.hasPrefix("launcher: env S2M_ENGINE=") {
                let value = line.dropFirst("launcher: env S2M_ENGINE=".count).prefix { !$0.isWhitespace }
                if let dash = value.lastIndex(of: "-"), value[value.index(after: dash)...].allSatisfy({ $0.isHexDigit }) || value.hasSuffix("-untested") {
                    engine = String(value[..<dash]); version = String(value[value.index(after: dash)...].prefix(8))
                } else { engine = String(value) }
            } else if line.hasPrefix("[dm] build: commit ") {
                commit = String(line.dropFirst("[dm] build: commit ".count).prefix { $0.isHexDigit }.prefix(8))
            } else if logName.isEmpty, line.hasPrefix("launcher: "), let id = line.range(of: " (\(titleID))") {   // "launcher: <name> (<title ID>), host ..."
                logName = String(line[line.index(line.startIndex, offsetBy: "launcher: ".count)..<id.lowerBound])
            }
        }
        guard !fps.isEmpty else { return nil }
        if version.isEmpty { version = commit }
        // Every stats line covers the same number of frames, so the run's frame rate is the harmonic mean of the lines' rates.
        let positive = fps.filter { $0 > 0 }
        return GameRun(id: "\(titleID)@\(Int(start.timeIntervalSince1970))", titleID: titleID, name: name.isEmpty ? logName : name, start: start,
                       seconds: max(0, end.timeIntervalSince(start)), engine: engine, version: version,
                       avgFPS: positive.isEmpty ? nil : Double(positive.count) / positive.reduce(0) { $0 + 1 / $1 },
                       minFPS: fps.min(), maxFPS: fps.max(), lowFPS: median(p99).map { 1000 / $0 }, peakMemoryMB: peak,
                       gpuMs: median(gpu), cpuPercent: cpu.isEmpty ? nil : cpu.reduce(0, +) / Double(cpu.count))
    }

    /// The number between two markers of a line ("(47.2 fps)" → 47.2).
    static func number(in line: Substring, after: String, before: String) -> Double? {
        guard let a = line.range(of: after), let b = line[a.upperBound...].range(of: before) else { return nil }
        return Double(line[a.upperBound..<b.lowerBound].trimmingCharacters(in: .whitespaces))
    }

    static func median(_ xs: [Double]) -> Double? {
        guard !xs.isEmpty else { return nil }
        let s = xs.sorted()
        return s.count % 2 == 1 ? s[s.count / 2] : (s[s.count / 2 - 1] + s[s.count / 2]) / 2
    }

    /// Where the summaries are kept: beside the app's other files.
    static var file: URL {
        FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("switch2mac/runs.json")
    }

    static func load(from file: URL = file) -> [GameRun] {
        guard let data = try? Data(contentsOf: file) else { return [] }
        let decoder = JSONDecoder(); decoder.dateDecodingStrategy = .iso8601
        return (try? decoder.decode([GameRun].self, from: data)) ?? []
    }

    static func save(_ runs: [GameRun], to file: URL = file) {
        let encoder = JSONEncoder(); encoder.dateEncodingStrategy = .iso8601; encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        try? FileManager.default.createDirectory(at: file.deletingLastPathComponent(), withIntermediateDirectories: true)
        if let data = try? encoder.encode(runs) { try? data.write(to: file, options: .atomic) }
    }

    /// The finished runs in a game's logs that are not among `known` yet. A log still being written (the game is open: no
    /// "host exited" line, and changed in the last minute) waits for the next look.
    static func newRuns(titleID: String, name: String, folders: [URL], known: Set<String>, now: Date = Date()) -> [GameRun] {
        var found: [GameRun] = []
        for folder in folders {
            for file in [titleID + ".log", titleID + ".prev.log"] {
                let url = folder.appendingPathComponent(file)
                guard let a = try? FileManager.default.attributesOfItem(atPath: url.path),
                      let start = a[.creationDate] as? Date, let end = a[.modificationDate] as? Date,
                      end.timeIntervalSince(start) >= minimumSeconds,
                      !known.contains("\(titleID)@\(Int(start.timeIntervalSince1970))"),
                      !found.contains(where: { $0.id == "\(titleID)@\(Int(start.timeIntervalSince1970))" }),
                      let data = try? Data(contentsOf: url, options: .mappedIfSafe) else { continue }
                let text = String(decoding: data, as: UTF8.self)
                guard text.contains("launcher: the host exited") || now.timeIntervalSince(end) > 60,
                      let run = summarize(text, titleID: titleID, name: name, start: start, end: end) else { continue }
                found.append(run)
            }
        }
        return found
    }
}

/// The runs the Performance page shows, newest first. It looks at the library's games' logs when the app starts, when it comes to
/// the front, and when any app quits (a game closing), so a run is there by the time the player looks.
@MainActor
final class GameRunStore: ObservableObject {
    @Published private(set) var runs: [GameRun]
    private let file: URL
    private var looking = false
    private var observers: [NSObjectProtocol] = []

    init(file: URL = GameRuns.file) {
        self.file = file
        runs = GameRuns.load(from: file)
    }

    func watch(_ library: GameLibrary) {
        guard observers.isEmpty else { return }
        let center = NSWorkspace.shared.notificationCenter
        observers.append(center.addObserver(forName: NSWorkspace.didTerminateApplicationNotification, object: nil, queue: .main) { [weak self, weak library] _ in
            // the launcher writes its last line as it exits: a moment later the log is complete
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { if let library { self?.refresh(library) } }
        })
        observers.append(NotificationCenter.default.addObserver(forName: NSApplication.didBecomeActiveNotification, object: nil, queue: .main) { [weak self, weak library] _ in
            if let library { self?.refresh(library) }
        })
        refresh(library)
    }

    func refresh(_ library: GameLibrary) {
        guard !looking else { return }
        looking = true
        let games = library.games.map { (titleID: $0.titleID, name: $0.name, folders: GameLog.folders(appPath: $0.appPath)) }
        let known = Set(runs.map(\.id)), file = file
        Task.detached(priority: .utility) {
            var added: [GameRun] = []
            var seen = Set<String>()
            for game in games where seen.insert(game.titleID).inserted {
                added += GameRuns.newRuns(titleID: game.titleID, name: game.name, folders: game.folders, known: known)
            }
            let found = added
            await MainActor.run {
                self.looking = false
                guard !found.isEmpty else { return }
                self.runs = Array((found + self.runs).sorted { $0.start > $1.start }.prefix(GameRuns.kept))
                GameRuns.save(self.runs, to: file)
            }
        }
    }
}
