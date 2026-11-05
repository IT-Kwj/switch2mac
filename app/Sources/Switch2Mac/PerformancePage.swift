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

    var body: some View {
        CardPageHeading("Performance", note: "Your last three game runs, read from each game's log when it closes. Nothing leaves your Mac unless you share a run.")
        if runs.runs.isEmpty {
            CardGroup("No runs yet") {
                Text("Play a game from the Library. When you close it, how it ran shows here.")
                    .font(.manrope(14)).foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20).padding(.vertical, 18)
            }
        }
        ForEach(runs.runs.prefix(3)) { run in
            RunCard(run: run, banner: banner(run), cores: specs.performanceCores + specs.efficiencyCores) { sharing = run }
        }
        Color.clear.frame(height: 1)
            .sheet(item: $sharing) { run in ShareRunSheet(run: run, specs: specs) }
            .task { specs = await Task.detached { MacSpecs.read() }.value }
    }

    private func banner(_ run: GameRun) -> NSImage? {
        library.games.first { $0.titleID == run.titleID }.flatMap { artwork[$0.id] }
    }
}

/// One run: a card with the game's banner beside its numbers.
struct RunCard: View {
    let run: GameRun
    let banner: NSImage?
    let cores: Int
    let share: () -> Void

    var body: some View {
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
                        Button(action: share) { Label("Share", systemImage: "square.and.arrow.up") }
                            .buttonStyle(LauncherSecondaryButtonStyle())
                            .help("Send how this run went to the game's reports table, through the How it ran form")
                    }
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
            }
            .padding(.horizontal, 20).padding(.vertical, 18)
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
        version == "untested" ? "\(engine) untested".trimmingCharacters(in: .whitespaces) : engine
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
