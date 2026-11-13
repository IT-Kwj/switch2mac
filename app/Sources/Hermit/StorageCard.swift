import SwiftUI
import NXLauncher
import NXModel

/// Settings, "Storage": what building leaves on this Mac (each game's build folder, engine copies no build uses), with their sizes, and one
/// button that removes it all. The games, their saves and settings, the shader caches the games keep, the dumps and keys always stay.
/// The last measurement, kept across visits to Settings (measuring walks tens of GB): measured again after a minute, or after a clean.
@MainActor private enum StorageCache { static var items: [StorageItem]?; static var at = Date.distantPast }

struct StorageCard: View {
    let build: BuildStore
    @State private var items: [StorageItem]? = StorageCache.items
    @State private var measuring = false
    @State private var cleaning = false
    @State private var confirm = false
    @State private var note = ""
    @State private var open = false

    private var total: Int64 { (items ?? []).reduce(0) { $0 + $1.bytes } }
    private var builds: [StorageItem] { (items ?? []).filter { $0.kind == "build" } }
    private var engines: [StorageItem] { (items ?? []).filter { $0.kind == "engine" } }

    var body: some View {
        CardGroup("Storage", footnote: "Building a game leaves its working files behind (the game unpacked, shaders, tools) so a rebuild is faster, and a copy of the code of each build you used. Clean up removes them. Your games, saves, settings and the shader caches your games keep stay, and so do your dumps and keys: a later build only takes longer.") {
            CardRow("Build leftovers", detail: summary, dot: total > 0 ? LauncherPalette.unbuilt : LauncherPalette.ready, open: (items?.isEmpty == false) ? open : nil) {
                if measuring || cleaning { ProgressView().controlSize(.small) }
                else if total > 0 {
                    Button("Clean up") { confirm = true }.disabled(build.running)
                } else {
                    Button("Check again") { measure() }
                }
            }
            .contentShape(Rectangle())
            .onTapGesture { if items?.isEmpty == false { withAnimation(.easeOut(duration: 0.15)) { open.toggle() } } }
            if open {
                ForEach(builds + engines) { i in
                    CardDivider()
                    CardRow(i.kind == "build" ? i.name : "Build code no game uses any more", detail: i.path, dot: nil) {
                        Text(Self.bytes(i.bytes)).font(.manrope(12.5, .semibold)).foregroundStyle(.secondary)
                    }
                }
            }
        }
        .task {   // after the page has settled: the walk runs in the background, and its answer redraws only this card
            guard Date().timeIntervalSince(StorageCache.at) > 60 else { return }
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            if !Task.isCancelled { measure() }
        }
        .alert("Remove \(Self.bytes(total)) of build leftovers?", isPresented: $confirm) {
            Button("Clean up", role: .destructive) { clean() }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("The files are deleted, not moved to the Trash. Your games, saves and settings stay; the next build of a game takes longer.")
        }
    }

    private var summary: String {
        if !note.isEmpty { return note }
        if build.running { return "A build is running: clean up after it." }
        guard let items else { return measuring ? "Measuring…" : "" }
        if items.isEmpty { return "Nothing to clean up." }
        var parts: [String] = []
        if !builds.isEmpty { parts.append("\(builds.count) game\(builds.count == 1 ? "" : "s")' build files") }
        if !engines.isEmpty { parts.append("\(engines.count) unused build code cop\(engines.count == 1 ? "y" : "ies")") }
        return Self.bytes(total) + ": " + parts.joined(separator: " and ")
    }

    private func measure(keepNote: Bool = false) {
        measuring = true; if !keepNote { note = "" }
        build.storage(clean: false) { found, _ in
            items = found ?? []; measuring = false
            if let found { StorageCache.items = found; StorageCache.at = Date() } else { note = "Could not measure: the build tools did not answer." }
        }
    }

    private func clean() {
        cleaning = true; open = false
        build.storage(clean: true) { found, freed in
            cleaning = false
            if found == nil { note = "Not cleaned: a build is running, or the build tools did not answer."; return }
            items = []
            note = freed > 0 ? "\(Self.bytes(freed)) freed." : "Nothing was removed."
            measure(keepNote: true)   // what is left (a folder in use stays)
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) { if note.hasSuffix("freed.") { note = "" } }
        }
    }

    static func bytes(_ n: Int64) -> String { ByteCountFormatter.string(fromByteCount: n, countStyle: .file) }
}
