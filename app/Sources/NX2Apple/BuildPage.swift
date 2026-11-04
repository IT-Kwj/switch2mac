import SwiftUI
import NXCore
import NXLauncher
import NXModel

// The Builds page: the cards in the order a build goes, from the files to the progress. It only arranges them (CardPages.swift
// scrolls them). Each card observes the stores it shows (NXLauncher, and `FilesCard` here), so a change in one store redraws that
// card and no other.

struct BuildPage: View {
    let build: BuildStore
    let repo: RepoStore
    let dependencies: DependencyStore
    let devices: DeviceStore
    @Binding var extrasOpen: Bool   // the optional input rows of the files card
    @Binding var logOpen: Bool   // the log card's disclosure
    var onViewGame: () -> Void = {}
    var onOpenSettings: () -> Void = {}
    @EnvironmentObject var loc: Localizer

    var body: some View {
        CardPageHeading(loc.t("build.heading"), note: loc.t("build.intro"))
        SetupHintCard(repo: repo, dependencies: dependencies, onOpenSettings: onOpenSettings)
        YourMacCard()
        DumpCard(build: build)
        if let info = build.dumpInfo, info.ok, info.builds.count > 1 { GameBuildCard(build: build, info: info) }
        LogCard(log: build.log, devices: devices, isOpen: $logOpen,
                showRequests: BuildNotifier.shared.$showLog.eraseToAnyPublisher(),   // a clicked notification of a failed build
                didShow: { BuildNotifier.shared.showLog = false })
        ActionCard(build: build, dependencies: dependencies, repo: repo)
        Group {   // a ViewBuilder holds ten views at most
            BuildFailureCard(m: build)
            OutcomeCard(build: build, devices: devices, onViewGame: onViewGame)
            ProgressCard(build: build)
        }
    }
}

/// switch2mac's input: one dump folder, as the dump tool wrote it. switch2mac.py identify names the game; the row says which game it is,
/// its version and what it is built with, or what is wrong with the folder (BuildStore+Switch2Mac.swift).
struct DumpCard: View {
    @ObservedObject var build: BuildStore
    @EnvironmentObject var loc: Localizer

    var body: some View {
        CardGroup("Your game", footnote: "The folder your dump tool wrote: exefs and romfs, or base and updates. No keys needed.") {
            CardRow(title, detail: detail, detail2: build.gameDir.isEmpty ? "" : RepoLayout.shortPath(build.gameDir), dot: dot, help: build.gameDir) {
                if build.identifying { ProgressView().controlSize(.small) }
                Button(build.gameDir.isEmpty ? "Choose dump folder…" : "Change…") {
                    if let f = build.chooseFolder() { build.chooseDump(f) }
                }
                .disabled(build.running)
                .padTarget("build.dump", scope: "main") { if !build.running, let f = build.chooseFolder() { build.chooseDump(f) } }
            }
        }
        // a folder set another way (a library game's Build, a drop, the setup) is read too, so the card never waits on nothing
        .task(id: build.gameDir) {
            if !build.gameDir.isEmpty, !build.identifying, build.dumpInfo?.folder != build.gameDir { build.chooseDump(build.gameDir) }
        }
    }

    private var title: String {
        guard let i = build.dumpInfo else { return build.gameDir.isEmpty ? "No dump folder chosen" : "Reading the folder…" }
        return i.ok ? i.name : "Not a game switch2mac builds"
    }
    private var detail: String {
        guard let i = build.dumpInfo else { return "" }
        guard i.ok else { return i.problem }
        let chosen = i.builds.first { $0.id == build.buildChoice(i) }
        let engine = chosen?.name ?? (i.engine == "switch2mac" ? "switch2mac's engine" : i.engine)
        let untested = i.builds.count > 1 ? false : i.untested   // a game with several builds: the build card says how each ran
        return [i.version, "built with \(engine)", untested ? "not yet tested in switch2mac" : nil, i.diskGB.map { "needs about \($0) GB free" }]
            .compactMap { $0 }.filter { !$0.isEmpty }.joined(separator: " · ")
    }
    private var dot: Color {
        guard let i = build.dumpInfo else { return build.identifying ? LauncherPalette.building : LauncherPalette.unbuilt }
        return i.ok ? LauncherPalette.ready : .red
    }
}

/// A game with several builds (Mario Kart World: switch2mac's engine and nxnative's): which one this Mac gets and why, a menu to pick the other (with a warning),
/// and how each ran on players' Macs. The choice is kept per game (BuildStore.buildChoice) and goes to switch2mac.py build --engine.
struct GameBuildCard: View {
    @ObservedObject var build: BuildStore
    let info: DumpInfo
    @State private var specs = MacSpecs()

    var body: some View {
        let chosen = build.buildChoice(info), recommended = chosen == info.recommended
        let option = info.builds.first { $0.id == chosen }
        CardGroup("Build", footnote: "Each build is the same game on a different engine. switch2mac picks the one that runs best on Macs like yours, from players' reports.") {
            CardRow(option?.name ?? chosen, detail: option?.about ?? "",
                    detail2: recommended ? "Recommended for your Mac: " + info.why : "Not the one recommended for your Mac (\(name(info.recommended))): it may run slower here.",
                    dot: recommended ? LauncherPalette.ready : LauncherPalette.building) {
                LauncherDropdown(options: info.builds.map { (value: $0.id, label: $0.name + ($0.id == info.recommended ? " (recommended)" : "")) },
                                 selection: chosen, label: "Build", style: .button) { build.chooseBuild($0, for: info) }
                    .disabled(build.running)
            }
            let rs = info.reports(of: chosen)
            if rs.isEmpty {
                CardRow("No reports yet", detail: "Nobody has said how this build ran on their Mac so far.", dot: LauncherPalette.unbuilt) { EmptyView() }
            }
            ForEach(Array(rs.enumerated()), id: \.offset) { _, r in
                CardRow([r.mac, r.chip, r.memoryGB.isEmpty ? "" : r.memoryGB + " GB"].filter { !$0.isEmpty }.joined(separator: " · "),
                        detail: [r.fps.isEmpty ? "" : r.fps + " fps", r.peakGB.isEmpty ? "" : r.peakGB + " GB memory at most"].filter { !$0.isEmpty }.joined(separator: " · "),
                        detail2: r.notes + (r.source.isEmpty ? "" : " (" + r.source + ")"),
                        dot: sameKind(r) ? LauncherPalette.ready : Color.white.opacity(0.25),
                        help: sameKind(r) ? "A Mac like yours" : "") { EmptyView() }
            }
        }
        .task { specs = await Task.detached { MacSpecs.read() }.value }
    }

    private func name(_ id: String) -> String { info.builds.first { $0.id == id }?.name ?? id }
    /// A report from a Mac with this Mac's chip generation (M1, M2, ...).
    private func sameKind(_ r: DumpInfo.MacReport) -> Bool {
        let g = Int(r.chip.split(separator: " ").first { $0.hasPrefix("M") }?.dropFirst() ?? "") ?? -1
        return g == specs.generation && g > 0
    }
}
