import AppKit
import SwiftUI
import NXLauncher
import NXModel

// The Performance page: the last three game runs (GameRuns.swift), each with its banner, when and how long, the build, and what the
// game's log measured. Share opens a small window with what a How it ran report needs, filled in from the run and this Mac
// (MacSpecs), and a comment of the player's own; its button opens the form on GitHub with all of it in, for the player to send.

struct PerformancePage: View {
    @ObservedObject var runs: GameRunStore
    @ObservedObject var library: GameLibrary
    let artwork: [UUID: NSImage]
    @State private var sharing: GameRun?
    @State private var specs = MacSpecs()
    @State private var open: String?   // the history row shown in full

    var body: some View {
        CardPageHeading("Performance", note: "Your last \(GameRuns.kept) game runs, read from each game's log when it closes. Nothing leaves your Mac unless you share a run.")
        if runs.runs.isEmpty {
            CardGroup("No runs yet") {
                Text("Play a game from the Library. When you close it, how it ran shows here.")
                    .font(.manrope(14)).foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20).padding(.vertical, 18)
            }
        }
        // the latest run in full, then the history as one row each, like a game's match history; a row opens to the full card
        if let latest = runs.runs.first {
            RunCard(run: latest, banner: banner(latest), cores: cores) { sharing = latest }
        }
        if runs.runs.count > 1 {
            CardGroup("History") {
                ForEach(Array(runs.runs.dropFirst().enumerated()), id: \.element.id) { index, run in
                    if index > 0 { CardDivider() }
                    RunHistoryRow(run: run, banner: banner(run), open: open == run.id) {
                        withAnimation(.easeInOut(duration: 0.2)) { open = open == run.id ? nil : run.id }
                    }
                    if open == run.id {
                        RunCard(run: run, banner: nil, cores: cores, compact: true) { sharing = run }   // in line with the row's banner (after its colour bar)
                            .padding(.leading, 14 + 4 + 16).padding(.trailing, 14).padding(.top, 6).padding(.bottom, 16)
                    }
                }
            }
        }
        Color.clear.frame(height: 1)
            .sheet(item: $sharing) { run in ShareRunSheet(run: run, specs: specs) }
            .task { specs = await Task.detached { MacSpecs.read() }.value }
    }

    private var cores: Int { specs.performanceCores + specs.efficiencyCores }

    private func banner(_ run: GameRun) -> NSImage? {
        library.games.first { $0.titleID == run.titleID }.flatMap { artwork[$0.id] }
    }
}

/// One run: a card with the game's banner beside its numbers.
struct RunCard: View {
    let run: GameRun
    let banner: NSImage?
    let cores: Int
    var compact = false   // inside a history row: the numbers and Share only, the row above shows the rest
    let share: () -> Void

    var body: some View {
        if compact {
            HStack(alignment: .center, spacing: 16) { compactNumbers; Spacer(minLength: 12); shareButton }
        } else {
            full
        }
    }

    private var shareButton: some View {
        Button(action: share) { Label("Share", systemImage: "square.and.arrow.up") }
            .buttonStyle(LauncherSecondaryButtonStyle())
            .help("Send how this run went to the game's reports table, through the How it ran form")
    }

    private var full: some View {
        CardGroup(Self.when(run.start)) {
            HStack(alignment: .top, spacing: 22) {
                Group {
                    if let banner { Image(nsImage: banner).resizable().interpolation(.high).aspectRatio(contentMode: .fill) }
                    else { LinearGradient(colors: [LauncherPalette.surface, .black], startPoint: .top, endPoint: .bottom) }
                }
                .frame(width: 240, height: 135).clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.white.opacity(0.08)))
                VStack(alignment: .leading, spacing: 14) {
                    HStack(alignment: .firstTextBaseline) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(run.name).font(.manrope(22, .bold)).tracking(-0.4).lineLimit(2).fixedSize(horizontal: false, vertical: true)
                            Text(subtitle).font(.manrope(13)).foregroundStyle(.secondary).lineLimit(1)
                        }
                        Spacer(minLength: 12)
                        shareButton
                    }
                    numbers
                }
            }
            .padding(.horizontal, 20).padding(.vertical, 18)
        }
    }

    private var numbers: some View {
        // The average, then the other numbers in columns that wrap to a second line when the window is narrow,
        // so a number or its unit is never cut or broken over two lines.
        HStack(alignment: .bottom, spacing: 26) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Average").font(.manrope(12, .medium)).foregroundStyle(LauncherPalette.unbuilt)
                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text(run.avgFPS.map { String(format: "%.0f", $0) } ?? "—").font(.manrope(34, .heavy)).tracking(-0.8)
                        .foregroundStyle(Self.color(run.avgFPS))
                    Text("fps").font(.manrope(14, .semibold)).foregroundStyle(.secondary)
                }
            }
            .fixedSize()
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 108), spacing: 18, alignment: .leading)], alignment: .leading, spacing: 14) {
                stat("Min", run.minFPS.map { String(format: "%.0f", $0) }, "fps")
                stat("Max", run.maxFPS.map { String(format: "%.0f", $0) }, "fps")
                stat("1% low", run.lowFPS.map { String(format: "%.0f", $0) }, "fps", help: "The frame rate of the slowest 1% of frames, in a typical stretch of play")
                stat("Peak memory", run.peakMemoryMB.map { String(format: "%.1f", Double($0) / 1024) }, "GB")
                stat("GPU", run.gpuMs.map { String(format: "%.1f", $0) }, "ms", help: "The graphics chip's typical time for one frame")
                stat("CPU", cpu, "%", help: "How busy the processor was on average, out of all its cores")
            }
        }
    }

    /// A history row's numbers: the seven side by side in even columns, the average first in its colour; when the window is too narrow,
    /// four and three in a grid whose columns line up.
    private var compactNumbers: some View {
        let cells: [(String, String?, String, String, Bool)] = [
            ("Average", run.avgFPS.map { String(format: "%.0f", $0) }, "fps", "", true),
            ("Min", run.minFPS.map { String(format: "%.0f", $0) }, "fps", "", false),
            ("Max", run.maxFPS.map { String(format: "%.0f", $0) }, "fps", "", false),
            ("1% low", run.lowFPS.map { String(format: "%.0f", $0) }, "fps", "The frame rate of the slowest 1% of frames, in a typical stretch of play", false),
            ("Peak memory", run.peakMemoryMB.map { String(format: "%.1f", Double($0) / 1024) }, "GB", "", false),
            ("GPU", run.gpuMs.map { String(format: "%.1f", $0) }, "ms", "The graphics chip's typical time for one frame", false),
            ("CPU", cpu, "%", "How busy the processor was on average, out of all its cores", false)]
        func cell(_ c: (String, String?, String, String, Bool)) -> some View {
            VStack(alignment: .leading, spacing: 3) {
                Text(c.0).font(.manrope(12, .medium)).foregroundStyle(LauncherPalette.unbuilt)
                HStack(alignment: .firstTextBaseline, spacing: 3) {
                    Text(c.1 ?? "—").font(.manrope(19, c.4 ? .heavy : .bold)).monospacedDigit()
                        .foregroundStyle(c.4 ? Self.color(run.avgFPS) : Color.primary)
                    if c.1 != nil { Text(c.2).font(.manrope(12, .semibold)).foregroundStyle(.secondary) }
                }
            }
            .fixedSize().help(c.3)
        }
        let width: CGFloat = 88   // each column: wide enough for "Peak memory" and "15.4 GB"
        return ViewThatFits(in: .horizontal) {
            HStack(spacing: 0) { ForEach(cells.indices, id: \.self) { cell(cells[$0]).frame(width: width, alignment: .leading) } }
            Grid(alignment: .leading, horizontalSpacing: 0, verticalSpacing: 14) {
                GridRow { ForEach(0..<4, id: \.self) { cell(cells[$0]).frame(width: width, alignment: .leading) } }
                GridRow { ForEach(4..<7, id: \.self) { cell(cells[$0]).frame(width: width, alignment: .leading) } }
            }
        }
    }

    private var subtitle: String {
        var parts = [Self.duration(run.seconds)]
        if !run.build.isEmpty { parts.append(run.build) }
        return parts.joined(separator: " · ")
    }

    private var cpu: String? {
        guard let p = run.cpuPercent else { return nil }
        return cores > 0 ? String(format: "%.0f", p / Double(cores)) : String(format: "%.0f", p)
    }

    private func stat(_ label: String, _ value: String?, _ unit: String, help: String = "") -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(label).font(.manrope(12, .medium)).foregroundStyle(LauncherPalette.unbuilt)
            HStack(alignment: .firstTextBaseline, spacing: 3) {
                Text(value ?? "—").font(.manrope(19, .bold)).monospacedDigit()
                if value != nil { Text(unit).font(.manrope(12, .semibold)).foregroundStyle(.secondary) }
            }
        }
        .fixedSize()   // the label, the number and its unit each keep one line
        .padding(.bottom, 4)
        .help(help)
    }

    /// Green at a steady 60 (or close), yellow for playable, red below 30.
    static func color(_ fps: Double?) -> Color {
        guard let fps else { return .primary }
        return fps >= 55 ? LauncherPalette.ready : fps >= 30 ? LauncherPalette.progress : LauncherPalette.building
    }

    static func when(_ date: Date) -> String {
        let time = date.formatted(date: .omitted, time: .shortened)
        if Calendar.current.isDateInToday(date) { return "Today at \(time)" }
        if Calendar.current.isDateInYesterday(date) { return "Yesterday at \(time)" }
        return date.formatted(.dateTime.weekday(.wide).month(.wide).day()) + " at \(time)"
    }

    static func duration(_ seconds: Double) -> String {
        let minutes = Int(seconds / 60)
        if minutes < 1 { return "Under a minute" }
        if minutes < 60 { return "\(minutes) min" }
        return "\(minutes / 60) h \(minutes % 60) min"
    }
}

/// Share: what the How it ran form gets, and the player's comment. Open the form opens GitHub with it all filled in; the player
/// reads it there and sends it (switch2mac sends nothing itself).
struct ShareRunSheet: View {
    let run: GameRun
    let specs: MacSpecs
    @State private var comment = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Share how it ran").font(.manrope(22, .heavy)).tracking(-0.4)
                Text("Your report helps switch2mac pick the best build of \(run.name) for Macs like yours.")
                    .font(.manrope(13)).foregroundStyle(.secondary).fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal, 28).padding(.top, 26).padding(.bottom, 16)
            VStack(alignment: .leading, spacing: 12) {
                VStack(spacing: 0) {
                    ForEach(Array(ShareReport.fields(run, specs).enumerated()), id: \.offset) { index, field in
                        if index > 0 { Divider().opacity(0.25).padding(.leading, 18) }
                        HStack(spacing: 0) {
                            Text(field.label).font(.manrope(13, .medium)).foregroundStyle(LauncherPalette.unbuilt).frame(width: 110, alignment: .leading)
                            Text(field.value).font(.manrope(13.5, .semibold)).lineLimit(1).truncationMode(.middle)
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal, 18).padding(.vertical, 10)
                    }
                }
                .background(LauncherPalette.surface.opacity(0.75), in: RoundedRectangle(cornerRadius: 14))
                .overlay(RoundedRectangle(cornerRadius: 14).strokeBorder(Color.white.opacity(0.06)))
                Text("Comment (optional)").font(.manrope(13, .medium)).foregroundStyle(.secondary).padding(.top, 4)
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $comment).font(.manrope(13.5)).scrollContentBackground(.hidden).padding(8)
                    if comment.isEmpty {
                        Text("Anything worth knowing: stutters, crashes, graphics glitches, where you played…")
                            .font(.manrope(13.5)).foregroundStyle(.tertiary).padding(.horizontal, 13).padding(.vertical, 8).allowsHitTesting(false)
                    }
                }
                .frame(height: 96)
                .background(LauncherPalette.surface.opacity(0.75), in: RoundedRectangle(cornerRadius: 12))
                .overlay(RoundedRectangle(cornerRadius: 12).strokeBorder(Color.white.opacity(0.08)))
                Text("Opens the How it ran form on GitHub with these filled in. Only your Mac's model, chip, memory and macOS go in, never anything about you. You check it there and press Create to send it.")
                    .font(.manrope(12)).foregroundStyle(.secondary).fixedSize(horizontal: false, vertical: true).padding(.horizontal, 2)
            }
            .padding(.horizontal, 28).padding(.bottom, 20)
            Divider().opacity(0.3)
            HStack(spacing: 12) {
                Spacer(minLength: 8)
                Button("Cancel") { dismiss() }
                    .buttonStyle(LauncherSecondaryButtonStyle())
                    .keyboardShortcut(.cancelAction)
                Button {
                    if let url = ShareReport.url(run, specs, comment: comment) { NSWorkspace.shared.open(url) }
                    dismiss()
                } label: {
                    Text("Open the form").font(.manrope(13.5, .bold)).foregroundStyle(.black)
                        .padding(.horizontal, 20).padding(.vertical, 9)
                        .background(LauncherPalette.ready, in: Capsule())
                }
                .buttonStyle(.plain)
                .keyboardShortcut(.defaultAction)
            }
            .padding(.horizontal, 28).padding(.vertical, 16)
        }
        .frame(width: 540)
        .background(LauncherPalette.background)
        .preferredColorScheme(.dark)
    }
}

/// The How it ran form's fields for a run (.github/ISSUE_TEMPLATE/how-it-ran.yml: its field ids are the query names; GitHub fills
/// text fields from the link, not menus, so every field the app fills is a text field), as
/// tools/reports.py reads them back: the Mac line holds the chip and memory, the frame rate starts with the average.
enum ShareReport {
    static let form = "https://github.com/azmasm/switch2mac/issues/new"

    /// The Build answer: the engine, as the form's description asks for it (tools/reports.py looks for the engine's name).
    static func buildLabel(_ engine: String, version: String) -> String {
        let name = BuildName.shown(engine)
        return version == "untested" ? "\(name) untested".trimmingCharacters(in: .whitespaces) : name
    }

    static func mac(_ specs: MacSpecs) -> String {
        let chip = specs.chip.replacingOccurrences(of: "Apple ", with: "")
        return [specs.modelName, chip, specs.memoryGB > 0 ? "\(specs.memoryGB) GB" : ""].filter { !$0.isEmpty }.joined(separator: ", ")
    }

    static func frameRate(_ run: GameRun) -> String {
        guard let avg = run.avgFPS else { return "" }
        var s = String(format: "%.0f fps on average", avg)
        var detail: [String] = []
        if let lo = run.minFPS, let hi = run.maxFPS { detail.append(String(format: "%.0f-%.0f", lo, hi)) }
        if let low = run.lowFPS { detail.append(String(format: "1%% low %.0f", low)) }
        if !detail.isEmpty { s += " (" + detail.joined(separator: ", ") + ")" }
        return s
    }

    static func memory(_ run: GameRun) -> String { run.peakMemoryMB.map { String(format: "%.1f GB", Double($0) / 1024) } ?? "" }

    static func fields(_ run: GameRun, _ specs: MacSpecs) -> [(label: String, value: String)] {
        [("Game", run.name), ("Build", run.build.isEmpty ? "Not sure" : run.build), ("Mac", mac(specs)), ("macOS", specs.macOS),
         ("Frame rate", frameRate(run).isEmpty ? "—" : frameRate(run)), ("Memory used", memory(run).isEmpty ? "—" : memory(run))]
    }

    static func notes(_ run: GameRun, comment: String) -> String {
        var lines: [String] = []
        let c = comment.trimmingCharacters(in: .whitespacesAndNewlines)
        if !c.isEmpty { lines.append(c); lines.append("") }
        var measured = "Played \(RunCard.duration(run.seconds).lowercased()) on \(run.start.formatted(.dateTime.year().month(.abbreviated).day()))."
        if let gpu = run.gpuMs { measured += String(format: " GPU %.1f ms a frame.", gpu) }
        lines.append(measured)
        lines.append("Game: \(run.name) (\(run.titleID)). Measured by the switch2mac app's Performance tab.")
        return lines.joined(separator: "\n")
    }

    static func url(_ run: GameRun, _ specs: MacSpecs, comment: String) -> URL? {
        let chip = specs.chip.replacingOccurrences(of: "Apple ", with: "")
        let items: [(String, String)] = [
            ("template", "how-it-ran.yml"), ("title", "[How it ran] \(run.name) on \(chip.isEmpty ? "my Mac" : chip)"),
            ("game", run.name), ("build", buildLabel(run.engine, version: run.version)), ("version", run.build),
            ("mac", mac(specs)), ("macos", specs.macOS), ("fps", frameRate(run)), ("memory", memory(run)), ("notes", notes(run, comment: comment)),
        ]
        var allowed = CharacterSet.urlQueryAllowed; allowed.remove(charactersIn: "&=+?#")
        let query = items.filter { !$0.1.isEmpty }
            .map { "\($0.0)=\($0.1.addingPercentEncoding(withAllowedCharacters: allowed) ?? "")" }.joined(separator: "&")
        return URL(string: form + "?" + query)
    }
}

/// A run in the history: one line, as a game's match history shows a match. A click opens its numbers and Share.
struct RunHistoryRow: View {
    let run: GameRun
    let banner: NSImage?
    let open: Bool
    let toggle: () -> Void

    var body: some View {
        Button(action: toggle) {
            HStack(spacing: 16) {
                Rectangle().fill(RunCard.color(run.avgFPS)).frame(width: 4).clipShape(Capsule())   // the run's colour at a glance
                Group {
                    if let banner { Image(nsImage: banner).resizable().interpolation(.high).aspectRatio(contentMode: .fill) }
                    else { LinearGradient(colors: [LauncherPalette.surface, .black], startPoint: .top, endPoint: .bottom) }
                }
                .frame(width: 96, height: 54).clipShape(RoundedRectangle(cornerRadius: 7))
                VStack(alignment: .leading, spacing: 3) {
                    Text(run.name).font(.manrope(14.5, .semibold)).lineLimit(1)
                    Text([RunCard.when(run.start), RunCard.duration(run.seconds), run.build].filter { !$0.isEmpty }.joined(separator: " · "))
                        .font(.manrope(12.5)).foregroundStyle(.secondary).lineLimit(1)
                }
                Spacer(minLength: 12)
                HStack(alignment: .firstTextBaseline, spacing: 3) {
                    Text(run.avgFPS.map { String(format: "%.0f", $0) } ?? "—").font(.manrope(22, .heavy)).foregroundStyle(RunCard.color(run.avgFPS))
                    Text("fps").font(.manrope(12, .semibold)).foregroundStyle(.secondary)
                }
                .fixedSize().frame(width: 84, alignment: .trailing)
                Text(run.peakMemoryMB.map { String(format: "%.1f GB", Double($0) / 1024) } ?? "—")
                    .font(.manrope(13, .semibold)).monospacedDigit().foregroundStyle(.secondary).fixedSize().frame(width: 70, alignment: .trailing)
                Image(systemName: "chevron.right").font(.system(size: 11, weight: .bold)).foregroundStyle(.secondary)
                    .rotationEffect(.degrees(open ? 90 : 0))
            }
            .padding(.horizontal, 14).padding(.vertical, 10)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}
