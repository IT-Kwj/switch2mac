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
        // the build right under the game: what it plays decides which update, DLC and firmware the cards below it want
        if let info = build.dumpInfo, info.ok, !info.allBuilds.isEmpty { GameBuildCard(build: build, info: info) }
        if let info = build.dumpInfo, info.ok, info.dumpForm == "switch1" || info.parts != nil { SwitchFilesCard(build: build, info: info) }
        if build.dumpInfo?.needsKeys == true { KeysCard(build: build) }
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
        CardGroup("Your game", footnote: "Switch: the game's .nsp or .xci file, or the folder with its base game, update and DLC. Built with your own prod.keys.\n\nSwitch 2: the folder your dump tool wrote (exefs and romfs, or base and updates), or a .nup file. No keys needed.") {
            CardRow(title, detail: detail, detail2: build.gameDir.isEmpty ? "" : RepoLayout.shortPath(build.gameDir), dot: dot, help: build.gameDir) {
                if build.identifying { ProgressView().controlSize(.small) }
                if !build.gameDir.isEmpty {
                    Button("Clear") { build.clearDump() }   // the game and the update, DLC and pick added for it
                        .disabled(build.running).help("Start again with no game chosen")
                }
                Button(build.gameDir.isEmpty ? "Choose game…" : "Change…") {
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
        guard let i = build.dumpInfo else { return build.gameDir.isEmpty ? "No game chosen: a dump folder, .nup, .nsp or .xci" : "Reading the dump…" }
        return i.ok ? i.name : "Not a game switch2mac builds"
    }
    private var detail: String {
        guard let i = build.dumpInfo else { return "" }
        guard i.ok else { return i.problem }
        let chosen = i.allBuilds.first { $0.id == build.buildChoice(i) }
        let engine = chosen?.name ?? BuildName.shown(i.engine)
        return [i.dumpForm == "switch1" ? "Switch" : "", Self.versionText(i.dumpVersion, update: i.updateName, without: build.s1NoUpdate),
                (i.parts?.dlc ?? []).isEmpty ? "" : "\((i.parts?.dlc ?? []).count) DLC", "built with \(engine)", i.diskGB.map { "needs about \($0) GB free" }]
            .compactMap { $0 }.filter { !$0.isEmpty }.joined(separator: " · ")
    }
    /// The dump's own version in words: the base game alone, or the update it has (the build's needs are in the Build card's line)
    static func versionText(_ v: String, update: String = "", without: Bool = false) -> String {
        if without { return "base game, update left out" }
        if !update.isEmpty { return "with update \(update)" }
        return v.isEmpty ? "" : v == "v0" ? "base game, no update" : "with update \(v)"
    }
    private var dot: Color {
        guard let i = build.dumpInfo else { return build.identifying ? LauncherPalette.building : LauncherPalette.unbuilt }
        return i.ok ? LauncherPalette.ready : .red
    }
}

/// A Switch game's other files: the update and DLC found beside it (by title ID), the ones the player added, Add files… for more, and, for a cartridge
/// with several games, which one to build. Both Switch builders (nxnative's and MacNativeGames') take an update and DLC.
struct SwitchFilesCard: View {
    @ObservedObject var build: BuildStore
    let info: DumpInfo

    var body: some View {
        let switch1 = info.dumpForm == "switch1"
        CardGroup("Update and DLC", footnote: switch1 ? "Found inside the game's file or beside it by its title ID, or added here from your own Switch. They are built into the game; the newest update sets its version."
                                                       : info.dumpForm == "nup" ? "Read from the .nup itself: everything in it is built into the game; the newest update sets its version."
                                                       : "Read from your dump folder: the newest update in updates/ sets the game's version.") {
            if info.gamesInFiles.count > 1 {
                CardRow("This cartridge holds \(info.gamesInFiles.count) games", detail: "One is built at a time. Build the other afterwards the same way.") {
                    Picker("", selection: Binding(get: { info.titleID }, set: { build.pickSwitchGame($0) })) {
                        ForEach(Array(info.gamesInFiles.enumerated()), id: \.element.titleID) { i, g in
                            Text(g.name.isEmpty ? "Game \(i + 1) · \(g.titleID)" : g.name).tag(g.titleID)
                        }
                    }
                    .labelsHidden().frame(width: 260).disabled(build.running || build.identifying)
                }
                CardDivider()
            }
            CardRow("Update", detail: build.s1NoUpdate ? "Left out: the game builds as its first version (v0)"
                    : !(info.parts?.update ?? "").isEmpty ? info.parts!.update + (info.updateName.isEmpty ? "" : " (version \(info.updateName))")
                    : !(info.parts?.note ?? "").isEmpty ? "None as a separate file (see Also inside)" : "None found: the game builds as its first version (v0)",
                    dot: build.s1NoUpdate || (info.parts?.update ?? "").isEmpty ? LauncherPalette.unbuilt : LauncherPalette.ready) {
                if switch1, build.s1NoUpdate || !(info.parts?.update ?? "").isEmpty {   // a version the chosen build does not play: build without it
                    Button(build.s1NoUpdate ? "Use it" : "Leave out") { build.setNoUpdate(!build.s1NoUpdate) }.disabled(build.running || build.identifying)
                }
            }
            CardDivider()
            CardRow("DLC", detail: (info.parts?.dlc ?? []).isEmpty ? "None" : (info.parts?.dlc ?? []).joined(separator: "\n"),
                    dot: (info.parts?.dlc ?? []).isEmpty ? LauncherPalette.unbuilt : LauncherPalette.ready) { EmptyView() }
            if let note = info.parts?.note, !note.isEmpty {
                CardDivider()
                CardRow("Also inside", detail: note, dot: LauncherPalette.ready) { EmptyView() }
            }
            ForEach(build.s1Extra, id: \.self) { f in
                CardDivider()
                CardRow((f as NSString).lastPathComponent, detail: "Added by you", help: f) {
                    Button("Remove") { build.removeSwitchFile(f) }.disabled(build.running)
                }
            }
            if switch1 {
                CardDivider()
                CardRow("Add an update or DLC", detail: "An .nsp, .nsz, .xci or .xcz file of this game") {
                    Button("Add files…") { build.addSwitchFiles(build.chooseSwitchFiles()) }.disabled(build.running || build.identifying)
                }
            }
        }
    }
}

/// A Switch 1 game's prod.keys: its files are encrypted, and the builder opens them with the keys the player dumped from their own Switch. switch2mac keeps
/// only where the file is (never its contents), passes it to the builder alone, and never writes it into logs, reports or shader lists (BuildStore+Switch2Mac.swift).
/// The first time, a short note says so before the file is chosen; Settings → Forget my keys file drops the path.
struct KeysCard: View {
    @ObservedObject var build: BuildStore
    @State private var explaining = false

    var body: some View {
        let path = build.keysPath, info = build.dumpInfo
        CardGroup("Your keys", footnote: "Switch games are encrypted. The builder unlocks them with prod.keys from your own Switch, only while it builds. switch2mac remembers where the file is, never what is in it, and never uploads or shares it.") {
            CardRow(path.isEmpty ? "No prod.keys chosen" : (path as NSString).lastPathComponent,
                    detail: path.isEmpty ? "Needed for this game: dump it from your own Switch." : (info?.keysNote ?? ""),
                    dot: path.isEmpty ? LauncherPalette.unbuilt : info?.keysOK == false ? .red : LauncherPalette.ready) {
                Button(path.isEmpty ? "Choose prod.keys…" : "Change…") {
                    if UserDefaults.standard.bool(forKey: BuildStore.keysExplainedKey) { pick() } else { explaining = true }
                }
                .disabled(build.running)
            }
        }
        .alert("Your own keys", isPresented: $explaining) {
            Button("Choose prod.keys…") { UserDefaults.standard.set(true, forKey: BuildStore.keysExplainedKey); pick() }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Switch game files are encrypted. To build one, the builder needs prod.keys dumped from your own Switch. switch2mac passes the file to the builder while it builds and keeps only where it is: not a copy, not what is in it. It never goes into logs, reports or shader lists, and nothing is uploaded. You can forget it any time in Settings.")
        }
    }

    private func pick() { if let f = build.chooseKeysFile() { build.setKeys(f) } }
}

/// A game with several builds (Mario Kart World: switch2mac's engine and nxnative's): which one this Mac gets and why, a menu to pick the other (with a warning),
/// and how each ran on players' Macs. The choice is kept per game (BuildStore.buildChoice) and goes to switch2mac.py build --engine.
struct GameBuildCard: View {
    @ObservedObject var build: BuildStore
    let info: DumpInfo
    @State private var specs = MacSpecs()
    @State private var askUntested: DumpInfo.BuildOption?   // an untested build picked from the menu: confirmed in a small popup first
    @State private var askCustom = false   // "Your own build…": the link to the player's fork
    @State private var customLink = ""

    var body: some View {
        let chosen = build.buildChoice(info), recommended = chosen == info.recommended
        let option = info.allBuilds.first { $0.id == chosen }, untested = info.isUntested(chosen)
        CardGroup("Build", footnote: "Each build is the same game made by a different project (nxnative, switch2mac, community ports). switch2mac picks the one that runs best on Macs like yours, from players' reports.\n\nA first build takes from about 20 minutes to a few hours, most of it compiling the game's shaders, and keeps the Mac busy. Its working files stay (Settings › Storage), so building the same game again reuses them and is faster; after a big change to the build's code most shaders compile again, and it takes nearly as long.") {
            let misfit = option.map { !$0.fits && !$0.note.isEmpty } ?? false
            // the recommendation reads as prose (detail wraps); detail2, a single line, carries only a warning
            CardRow(option?.name ?? chosen, detail: [option?.about ?? "", (option?.plays ?? "").isEmpty ? "" : "Plays " + option!.plays + ".",
                                                     recommended && !untested && !misfit ? "Recommended for your Mac" + (info.why.isEmpty ? "." : ": " + info.why) : ""].filter { !$0.isEmpty }.joined(separator: "\n"),
                    detail2: misfit ? "Not for your files: it " + option!.note + "." : untested ? "Untested build: at your own risk. Stop ends it at any time."
                        : recommended ? "" : "Not the one recommended for your Mac (\(name(info.recommended))): it may run slower here.",
                    dot: misfit ? .red : recommended && !untested ? LauncherPalette.ready : LauncherPalette.building, detail2Bold: untested || misfit) {
                LauncherDropdown(options: info.allBuilds.map { (value: $0.id, label: $0.name + ($0.id == info.recommended ? " (recommended)" : !$0.fits ? " (not for your files)" : "")) }
                                    + [(value: "#custom", label: build.customBuild.isEmpty ? "Your own build…" : "Change your own build…")],
                                 selection: chosen, label: "Build", style: .button) { id in
                    if id == "#custom" { customLink = build.customBuild; askCustom = true }
                    else if info.isUntested(id), id != chosen { askUntested = info.allBuilds.first { $0.id == id } } else { build.chooseBuild(id, for: info) }
                }
                    .disabled(build.running)
            }
            if !info.customProblem.isEmpty {
                CardDivider()
                CardRow("Your own build is not offered", detail: info.customProblem, dot: .red) {
                    Button("Change…") { customLink = build.customBuild; askCustom = true }.disabled(build.running)
                }
            }
            if let fwRule = option?.firmware, !fwRule.isEmpty, !info.needsFirmware(chosen) {
                CardDivider()
                CardRow("Firmware (the Switch's system fonts)", detail: "Not needed: your game is a card image (.\(info.baseExt)), which carries the fonts. \(option?.name ?? "This build") asks for your firmware folder only when the game is an .nsp.",
                        dot: LauncherPalette.ready) { EmptyView() }
            }
            if info.needsFirmware(chosen) {
                CardDivider()
                CardRow("Firmware (the Switch's system fonts)", detail: info.firmware.isEmpty
                            ? "Not found. \(option?.name ?? "This build") needs your own unpacked firmware folder (its .nca files) for the fonts\(info.baseExt == "nsp" ? " when the game is an .nsp" : ""). Keep it beside your prod.keys, or choose it here."
                            : RepoLayout.shortPath(info.firmware) + (build.firmwarePath.isEmpty ? " (found beside your prod.keys)" : ""),
                        dot: info.firmware.isEmpty ? .red : LauncherPalette.ready, help: info.firmware) {
                    if !build.firmwarePath.isEmpty { Button("Forget") { build.setFirmware(nil) }.disabled(build.running) }
                    Button(info.firmware.isEmpty ? "Choose folder…" : "Change…") {
                        let panel = NSOpenPanel(); panel.canChooseDirectories = true; panel.canChooseFiles = false; panel.prompt = "Choose"
                        panel.message = "Choose your unpacked firmware folder (the .nca files from your own Switch)"
                        if panel.runModal() == .OK, let url = panel.url { build.setFirmware(url.path) }
                    }.disabled(build.running)
                }
            }
            if option?.quick == true {
                CardDivider()
                CardRow("Quick try", detail: build.quickTry
                            ? "On: only the shaders players have used so far, in about half the time. Places nobody has played yet may miss parts or stutter until you build again with Quick try off."
                            : "Build only the shaders players have used so far, in about half the time, to see quickly how the game runs on your Mac. Build again with it off for the whole game.",
                        dot: build.quickTry ? LauncherPalette.building : LauncherPalette.unbuilt) {
                    Toggle("", isOn: $build.quickTry).labelsHidden().toggleStyle(LauncherSwitchStyle()).disabled(build.running)
                }
            }
            let rs = info.reports(of: chosen)
            if rs.isEmpty {
                CardRow("No reports yet", detail: untested ? "Nobody has built the game this way yet." : "Nobody has said how this build ran on their Mac so far.", dot: LauncherPalette.unbuilt) { EmptyView() }
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
        .alert("Your own build", isPresented: $askCustom) {
            TextField("https://github.com/you/nxnative@branch", text: $customLink)
            Button("Use it") { build.setCustomBuild(customLink, for: info) }
            if !build.customBuild.isEmpty { Button("Remove it", role: .destructive) { build.setCustomBuild(nil, for: nil) } }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("A fork of nxnative to build this game with: its GitHub link, then @ and the branch if it is not the main one. switch2mac builds it with nxnative's builder, for any game. It is untested: it may stop partway or not start.")
        }
        .alert("Untested build", isPresented: Binding(get: { askUntested != nil }, set: { if !$0 { askUntested = nil } }), presenting: askUntested) { b in
            Button("Use untested build") { build.chooseBuild(b.id, for: info) }
            Button("Cancel", role: .cancel) {}
        } message: { b in
            Text("Nobody has built \(info.name) with \(b.name.replacingOccurrences(of: " (untested)", with: "")) yet. It may stop partway, or build and not start. Try it at your own risk: you can press Stop at any time.")
        }
    }

    private func name(_ id: String) -> String { info.allBuilds.first { $0.id == id }?.name ?? id }
    /// A report from a Mac with this Mac's chip generation (M1, M2, ...).
    private func sameKind(_ r: DumpInfo.MacReport) -> Bool {
        let g = Int(r.chip.split(separator: " ").first { $0.hasPrefix("M") }?.dropFirst() ?? "") ?? -1
        return g == specs.generation && g > 0
    }
}
