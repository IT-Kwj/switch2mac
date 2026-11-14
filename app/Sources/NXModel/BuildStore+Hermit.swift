import Foundation
import NXCore

// Hermit's build: one dump folder, which `hermit.py identify` names (the game, its version, the engine it is built with), then
// `hermit.py build --progress json` (its stage events are the ones nxnative's script writes, so ingest() reads them as they are),
// then `hermit.py install --to` the library folder. Each game builds in a work folder of its own, so a later build reuses its files.

/// What `hermit.py identify` said about a dump folder (one JSON line).
package struct DumpInfo: Equatable {
    package var folder: String
    package var ok: Bool
    package var titleID: String
    package var name: String
    package var version: String
    package var updateName = ""   // the update as players name it ("1.2.0"), from its file name or the build's list
    package var firmware = ""     // the firmware folder the builder will get (chosen, or found beside prod.keys), "" for none
    package var baseExt = ""      // the base game file's type: "nsp", "xci"...
    package var customProblem = ""   // why the player's own build could not be offered (a link that does not answer)
    package var dumpVersion = ""   // the dump's own version: its newest update ("v786432"), "v0" for the base game alone
    package var engine: String
    package var untested: Bool
    package var diskGB: Int?
    package var problem: String
    /// A game's builds (game.json "builds": Mario Kart World has Hermit's engine and nxnative's), the one game.json "choose" picks for this Mac and why,
    /// and how the game ran on players' Macs (games/<game>/reports.tsv). A game with one build lists that one.
    package var builds: [BuildOption]
    /// Untested builds: engine pairs nobody has tried (Hermit's engine with another engine's profile for the game). Offered with a warning.
    package var experimental: [BuildOption]
    /// Every build the player can pick: the tested ones, then the untested ones.
    package var allBuilds: [BuildOption] { builds + experimental }
    /// Whether a build needs the Switch's system fonts from a firmware folder for this dump (MacNativeGames' ports: always, or from an .nsp base)
    package func needsFirmware(_ id: String) -> Bool {
        guard let b = allBuilds.first(where: { $0.id == id }) else { return false }
        return b.firmware == "always" || (b.firmware == "nsp" && baseExt == "nsp")
    }
    package func isUntested(_ id: String) -> Bool { experimental.contains { $0.id == id } }
    package var recommended: String
    package var why: String
    package var reports: [MacReport]
    /// The dump's form: "folder" (a Switch 2 dump folder), "nup" (one .nup file) or "switch1" (a Switch 1 game's NSP / XCI files, which need the player's own prod.keys).
    package var dumpForm: String
    package var needsKeys: Bool
    /// What hermit.py made of the chosen prod.keys by its key names (nil when no keys file went with identify); the builder checks them properly when it opens the game.
    package var keysOK: Bool?
    package var keysNote: String
    /// A Switch game: the files that go to the builder (its base game, update and DLC, by name), and the games a cartridge holds when it holds several.
    package var parts: S1Parts?
    package var gamesInFiles: [S1Game]
    package struct S1Parts: Equatable { package var base: String; package var update: String; package var dlc: [String]; package var note: String = ""; package var basePath: String = "" }   // note: more inside a file than it names (a card image's untitled package, a NUP's standalone update)
    package struct S1Game: Equatable { package var titleID: String; package var name: String }

    package struct BuildOption: Equatable {
        package var id, name, engine, commit, about: String
        package var fits = true   // plays this dump's files (hermit.py fits and fit_note)
        package var note = ""     // why not, in words ("plays update 1.4.3; your files are update 1.2.0")
        package var plays = ""    // the versions it plays, in words
        package var firmware = "" // "always" or "nsp": needs the Switch's system fonts (a firmware folder), always or from an .nsp base
        package var quick = false  // can be a quick try (hermit.py --quick): nxnative's builder, and a list of the shaders players used
    }
    package struct MacReport: Equatable { package var mac, chip, memoryGB, macOS, build, fps, peakGB, notes, source: String }

    package init?(json line: String) {
        guard let data = line.data(using: .utf8), let o = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] else { return nil }
        folder = o["folder"] as? String ?? ""; ok = o["ok"] as? Bool ?? false
        titleID = o["title_id"] as? String ?? ""; name = o["name"] as? String ?? ""; version = o["version"] as? String ?? ""; dumpVersion = o["dump_version"] as? String ?? ""; updateName = o["update_name"] as? String ?? ""
        firmware = o["firmware"] as? String ?? ""; baseExt = o["base_ext"] as? String ?? ""; customProblem = o["custom_problem"] as? String ?? ""
        engine = o["engine"] as? String ?? ""; untested = o["untested"] as? Bool ?? false
        diskGB = (o["disk_gb"] as? NSNumber)?.intValue; problem = o["problem"] as? String ?? ""
        builds = (o["builds"] as? [[String: Any]] ?? []).map { b in
            BuildOption(id: b["id"] as? String ?? "", name: b["name"] as? String ?? "", engine: b["engine"] as? String ?? "", commit: b["commit"] as? String ?? "", about: b["about"] as? String ?? "",
                        fits: b["fits"] as? Bool ?? true, note: b["note"] as? String ?? "", plays: b["plays"] as? String ?? "", firmware: b["firmware"] as? String ?? "", quick: b["quick"] as? Bool ?? false)
        }
        experimental = (o["experimental"] as? [[String: Any]] ?? []).map { b in
            BuildOption(id: b["id"] as? String ?? "", name: b["name"] as? String ?? "", engine: b["engine"] as? String ?? "", commit: b["commit"] as? String ?? "", about: b["about"] as? String ?? "")
        }
        recommended = o["recommended"] as? String ?? ""; why = o["why"] as? String ?? ""
        dumpForm = o["dump_form"] as? String ?? "folder"; needsKeys = o["needs_keys"] as? Bool ?? false
        keysOK = o["keys_ok"] as? Bool; keysNote = o["keys_note"] as? String ?? ""
        parts = (o["parts"] as? [String: Any]).map { S1Parts(base: $0["base"] as? String ?? "", update: $0["update"] as? String ?? "", dlc: $0["dlc"] as? [String] ?? [], note: $0["note"] as? String ?? "", basePath: $0["base_path"] as? String ?? "") }
        gamesInFiles = (o["games_in_files"] as? [[String: Any]] ?? []).map { S1Game(titleID: $0["title_id"] as? String ?? "", name: $0["name"] as? String ?? "") }
        reports = (o["reports"] as? [[String: String]] ?? []).map { r in
            MacReport(mac: r["mac"] ?? "", chip: r["chip"] ?? "", memoryGB: r["memory_gb"] ?? "", macOS: r["macos"] ?? "", build: r["build"] ?? "", fps: r["fps"] ?? "",
                      peakGB: r["peak_gb"] ?? "", notes: r["notes"] ?? "", source: r["source"] ?? "")
        }
    }

    /// The reports of one build (a report's build column is the build's id, with the commit it was tried at after it).
    package func reports(of build: String) -> [MacReport] { reports.filter { $0.build.split(separator: " ").first.map(String.init) == build } }
}

extension BuildStore {
    /// Hermit's build script, in the checkout the app drives.
    package var hermitScript: String { RepoLayout.script(in: repo.path) }
    /// Where a game builds: its own work folder, kept for the next build.
    package func hermitWorkDir(_ titleID: String) -> String {
        NSHomeDirectory() + "/Library/Application Support/\(AppIdentity.folder)/builds/" + titleID
    }
    /// Where finished games go: /Applications, with the player's other apps (a rebuild replaces the copy there; its save stays, beside it in
    /// Application Support). Never the dump's folder: the original launcher's output folder (outDir) follows the input, which for a dump would put the game inside it.
    package var hermitLibraryDir: String { Self.outputFolder }
    /// Settings → Output: where finished games go, /Applications unless the player chose another folder.
    nonisolated package static let s2mOutputKey = "s2m.outputFolder"
    /// Settings → Storage: keep each game's whole build folder after its install (hermit.py removes the bulky, re-made parts unless HERMIT_KEEP_BUILD is set).
    nonisolated package static let keepBuildFilesKey = "s2m.keepBuildFiles"
    nonisolated package static var outputFolder: String { UserDefaults.standard.string(forKey: s2mOutputKey).flatMap { $0.isEmpty ? nil : $0 } ?? "/Applications" }

    /// The build of a game with several the player picked (Builds page), else the one chosen for this Mac. Kept per game.
    package func buildChoice(_ info: DumpInfo) -> String {
        buildChoices[info.titleID].flatMap { id in info.allBuilds.contains { $0.id == id } ? id : nil } ?? info.recommended
    }
    package func chooseBuild(_ id: String, for info: DumpInfo) {
        buildChoices[info.titleID] = id == info.recommended ? nil : id
    }

    private var buildPython: String { deps.pythonPath.isEmpty ? Toolchain.findPython().path : deps.pythonPath }
    private var buildEnvironment: [String: String] {
        let py = buildPython
        var env: [String: String] = ["PATH": BuildCommands.toolPath("/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin", python: py),
                                     "USER": NSUserName(), "HOME": NSHomeDirectory(), "LANG": "en_US.UTF-8", "TMPDIR": NSTemporaryDirectory()]
        if let root = Toolchain.dotnetRoot(for: deps.dotnetPath.isEmpty ? "dotnet" : deps.dotnetPath) { env["DOTNET_ROOT"] = root; env["DOTNET_ROOT_ARM64"] = root }
        env.merge(BundledTools.environment(for: py)) { $1 }
        if UserDefaults.standard.bool(forKey: Self.keepBuildFilesKey) { env["HERMIT_KEEP_BUILD"] = "1" }
        return env
    }

    // A Switch 1 game's files are encrypted: the builder opens them with the player's own prod.keys. The app keeps only where that file is (never its
    // contents), passes the path to hermit.py identify and build alone, and writes "<your prod.keys>" for it wherever a command is shown or kept.
    nonisolated package static let keysPathKey = "s2m.keysPath"
    nonisolated package static let keysExplainedKey = "s2m.keysExplained"
    nonisolated package static let keysPlaceholder = "<your prod.keys>"
    /// The prod.keys the player chose, "" for none (or a file that is gone).
    package var keysPath: String {
        let p = UserDefaults.standard.string(forKey: Self.keysPathKey) ?? ""
        return !p.isEmpty && FileManager.default.fileExists(atPath: p) ? p : ""
    }
    /// The player chose a prod.keys file: kept as a path, and the chosen game read again so the card shows what the file holds.
    package func setKeys(_ path: String) {
        UserDefaults.standard.set(path, forKey: Self.keysPathKey); objectWillChange.send()
        if !gameDir.isEmpty, dumpInfo?.needsKeys == true { chooseDump(gameDir) }
    }
    /// Settings → Forget my keys file: Hermit no longer knows where it is.
    package func forgetKeys() {
        UserDefaults.standard.removeObject(forKey: Self.keysPathKey); objectWillChange.send()
        if !gameDir.isEmpty, dumpInfo?.needsKeys == true { chooseDump(gameDir) }
    }
    /// Whether the chosen game can go to the builder as far as keys go: a Switch 2 dump needs none; a Switch 1 game needs a keys file that looks right.
    package var keysReady: Bool { dumpInfo?.needsKeys != true || (!keysPath.isEmpty && dumpInfo?.keysOK != false) }
    /// A command line as it may be shown or kept: the keys file's path replaced.
    package func hidingKeys(_ args: [String]) -> [String] {
        let k = keysPath, f = firmwarePath
        return args.map { a in var a = a; if !k.isEmpty { a = a.replacingOccurrences(of: k, with: Self.keysPlaceholder) }; if !f.isEmpty { a = a.replacingOccurrences(of: f, with: "<your firmware>") }; return a }
    }

    /// The dump folder the player chose: hermit.py says which game it is (in the background), and the card shows it.
    /// Clear the Build page's game: no file or folder, nothing read from it, and the update, DLC and pick added for it go with it (the gameDir setter)
    package func clearDump() {
        guard !running else { return }
        gameDir = ""; dumpInfo = nil; identifying = false; done = false; doneNote = ""; failure = nil
    }

    package func chooseDump(_ folder: String) {
        gameDir = folder; dumpInfo = nil; identifying = true; done = false; doneNote = ""; failure = nil
        let keys = keysPath
        let launch = ProcessLaunch(executable: buildPython, arguments: [hermitScript, "identify", folder] + (keys.isEmpty ? [] : ["--keys", keys]) + switchChoices,
                                   environment: buildEnvironment, directory: repo.path)
        let runner = runner
        DispatchQueue.global(qos: .userInitiated).async {
            let r = runner.capture(launch)
            let line = r.out.split(separator: "\n").last.map(String.init) ?? ""
            hop {
                guard self.gameDir == folder else { return }   // another folder was chosen meanwhile
                self.identifying = false
                self.dumpInfo = DumpInfo(json: line).map { var i = $0; i.folder = folder; return i } ?? {
                    var i = DumpInfo(json: "{}")!; i.folder = folder
                    i.problem = r.started ? (r.err.split(separator: "\n").last.map(String.init) ?? "hermit.py did not answer") : "hermit.py could not be started"
                    return i
                }()
                // An update or DLC file chosen as the game (picked by hand, or a Library entry saved before add-ons were told apart): the game is its base
                // file, which hermit.py found beside it; the card then names the game's own file, and the update is still found and used
                if let base = self.dumpInfo?.parts?.basePath, !base.isEmpty, base != folder, FileManager.default.fileExists(atPath: base),
                   !((try? URL(fileURLWithPath: folder).resourceValues(forKeys: [.isDirectoryKey]).isDirectory) ?? false) {
                    self.chooseDump(base); return
                }
                // A game chosen again starts on its recommended build, unless Manage → Build with … asked for another just now (a one-time note it leaves)
                if let tid = self.dumpInfo?.titleID, !tid.isEmpty {
                    let key = "s2m.pendingBuild." + tid
                    self.buildChoices[tid] = UserDefaults.standard.string(forKey: key)
                    UserDefaults.standard.removeObject(forKey: key)
                    UserDefaults.standard.removeObject(forKey: "s2m.build." + tid)   // an earlier version kept the last pick for good: never used now
                }
            }
        }
    }

    /// A Switch game's choices for hermit.py: which game of a cartridge, and the update and DLC files the player added.
    package var switchChoices: [String] {
        (s1Pick.isEmpty ? [] : ["--title-id", s1Pick]) + s1Extra.flatMap { ["--add", $0] } + (s1NoUpdate ? ["--no-update"] : []) + (customBuild.isEmpty ? [] : ["--custom", customBuild])
            + (firmwarePath.isEmpty ? [] : ["--firmware", firmwarePath])
    }
    /// Leave out the update found beside the game (a version the chosen build does not play): read again without it
    package func setNoUpdate(_ on: Bool) { guard s1NoUpdate != on, !gameDir.isEmpty else { return }; s1NoUpdate = on; chooseDump(gameDir) }

    // "Your own build…": a fork of nxnative the player names (https://github.com/<them>/nxnative[@branch]), offered as the untested build "custom" for every game
    nonisolated package static let customBuildKey = "s2m.customBuild"
    package var customBuild: String { UserDefaults.standard.string(forKey: Self.customBuildKey) ?? "" }
    package func setCustomBuild(_ link: String?, for info: DumpInfo?) {
        let t = (link ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        if t.isEmpty { UserDefaults.standard.removeObject(forKey: Self.customBuildKey) } else { UserDefaults.standard.set(t, forKey: Self.customBuildKey) }
        objectWillChange.send()
        if let info, !t.isEmpty { chooseBuild("custom", for: info) }
        if !gameDir.isEmpty { chooseDump(gameDir) }
    }

    // The Switch's system fonts for MacNativeGames' ports: the player's unpacked firmware folder (.nca files). Only its path is kept, as with the keys;
    // without one hermit.py looks beside prod.keys
    nonisolated package static let firmwarePathKey = "s2m.firmwarePath"
    package var firmwarePath: String {
        let p = UserDefaults.standard.string(forKey: Self.firmwarePathKey) ?? ""
        return !p.isEmpty && FileManager.default.fileExists(atPath: p) ? p : ""
    }
    package func setFirmware(_ path: String?) {
        if let path { UserDefaults.standard.set(path, forKey: Self.firmwarePathKey) } else { UserDefaults.standard.removeObject(forKey: Self.firmwarePathKey) }
        objectWillChange.send(); if !gameDir.isEmpty { chooseDump(gameDir) }
    }
    /// The player added update or DLC files (Build page): kept with this game and read again.
    package func addSwitchFiles(_ files: [String]) {
        let new = files.filter { !s1Extra.contains($0) && $0 != gameDir }
        guard !new.isEmpty, !gameDir.isEmpty else { return }
        s1Extra += new; chooseDump(gameDir)
    }
    package func removeSwitchFile(_ file: String) { s1Extra.removeAll { $0 == file }; if !gameDir.isEmpty { chooseDump(gameDir) } }
    /// A cartridge with several games: build this one.
    package func pickSwitchGame(_ titleID: String) { guard s1Pick != titleID, !gameDir.isEmpty else { return }; s1Pick = titleID; chooseDump(gameDir) }

    /// The build of the chosen dump: hermit.py build, then install into the library folder.
    package func startHermitBuild() {
        guard !running, let info = dumpInfo, info.ok else { return }
        guard FileManager.default.fileExists(atPath: hermitScript) else { fail(String(format: t("msg.repoInvalid"), shortPath(repo.path))); return }
        guard keysReady else { fail("This Switch game needs your own prod.keys: choose it under Your keys."); return }
        // MacNativeGames' ports check every file against the versions they were made for: a version they do not play always stops the build, so it never starts
        if let b = info.allBuilds.first(where: { $0.id == buildChoice(info) }), b.engine == "macnativegames" {
            if !b.fits, !b.note.isEmpty { fail("\(b.name) \(b.note). Change the update under Update and DLC, or choose another build."); return }
            if info.needsFirmware(b.id), info.firmware.isEmpty { fail("\(b.name) needs your unpacked firmware folder for the Switch's system fonts: choose it in the Build card."); return }
        }
        stopping = false
        running = true; done = false; doneNote = ""; stages = []; log.clear(); failure = nil; confirmingOverride = nil; macAppPath = ""
        let py = buildPython, work = hermitWorkDir(info.titleID), lib = hermitLibraryDir
        let quick = quickTry && (info.allBuilds.first { $0.id == buildChoice(info) }?.quick ?? false)   // a quick try: only the shaders players have used (BuildPage's Quick try)
        let args = [hermitScript, "--work", work, "build", info.folder, "--progress", "json"] + (info.allBuilds.count > 1 ? ["--engine", buildChoice(info)] : [])
            + (info.needsKeys ? ["--keys", keysPath] + switchChoices : customBuild.isEmpty ? [] : ["--custom", customBuild]) + (quick ? ["--quick"] : [])
        say(String(format: t("msg.running"), py) + " " + hidingKeys(args).joined(separator: " "))
        lastBuildCommand = hidingKeys([py] + args)
        let env = buildEnvironment
        let launch = ProcessLaunch(executable: py, arguments: args, environment: env, directory: repo.path, groupPython: py)
        let onExit: @Sendable (Int32) -> Void = { [weak self] status in
            hop {
                guard let self else { return }
                self.flushLines()
                if self.stopping { self.running = false; self.stopping = false; self.resetProgress(); self.doneNote = self.t("msg.stopped"); return }
                guard status == 0 else {
                    self.running = false
                    if let i = self.stages.lastIndex(where: { $0.state == .running }) { self.stages[i].state = .failed; self.stages[i].detail = String(format: self.t("msg.exitCode"), status) }
                    self.doneNote = BuildProgress.lastMeaningfulLine(self.logTail).map { String(format: self.t("msg.buildFailedReason"), $0) } ?? String(format: self.t("msg.buildFailed"), status)
                    self.noteFailure()
                    return
                }
                self.markAllDone()
                // into the library folder (hermit.py install --to), off the main thread: a move across volumes copies tens of GB
                try? FileManager.default.createDirectory(atPath: lib, withIntermediateDirectories: true)
                let installArgs = [self.hermitScript, "--work", work, "install", "--to", lib]
                let runner = self.runner
                DispatchQueue.global(qos: .userInitiated).async {
                    let r = runner.capture(ProcessLaunch(executable: py, arguments: installArgs, environment: env, directory: self.repo.path))
                    hop {
                        self.running = false
                        self.append(r.out + r.err)
                        let app = BuildStore.installedApp(r.out) ?? (lib + "/" + info.name + ".app")
                        let made = r.status == 0 && FileManager.default.fileExists(atPath: app)
                        self.macAppPath = made ? app : ""
                        self.done = made
                        self.doneNote = self.t(made ? (quick ? "msg.macAppDoneQuick" : "msg.macAppDone") : "msg.macAppMissing")
                    }
                }
            }
        }
        do {
            proc = try runner.start(launch, onOutput: { @Sendable [weak self] d in
                guard let s = String(data: d, encoding: .utf8) else { return }
                hop { self?.ingest(s) }
            }, onExit: onExit)
        } catch { fail(String(format: t("msg.launchFailed"), error.localizedDescription)) }
    }
}

extension BuildStore {
    /// Where `hermit.py install` put the app (its "installed: <path>" line): the file name is the game's name with ":" as " -",
    /// since Finder shows a ":" in a file name as "/". Nil when the line is missing (older hermit.py: the app is then `<name>.app`).
    package static func installedApp(_ out: String) -> String? {
        for line in out.split(separator: "\n") where line.hasPrefix("installed: ") {
            let path = line.dropFirst("installed: ".count).trimmingCharacters(in: .whitespaces)
            if path.hasSuffix(".app") { return path }
        }
        return nil
    }
}

// MARK: Storage (Settings → Storage)

/// One thing building left behind (`hermit.py storage --json`): a game's build folder or an engine copy no build uses.
package struct StorageItem: Identifiable, Equatable {
    package var id: String { path }
    package let kind: String   // "build" or "engine"
    package let name: String
    package let path: String
    package let bytes: Int64
}

extension BuildStore {
    /// What building left behind, or (clean) removes it: `hermit.py storage --json [--clean]`, in the background. The answer comes on the main
    /// thread: the items (what was there before a clean) and the bytes freed, or nil when the script could not run. Refused while a build runs.
    package func storage(clean: Bool, done: @escaping ([StorageItem]?, Int64) -> Void) {
        guard !(clean && running) else { done(nil, 0); return }
        let launch = ProcessLaunch(executable: buildPython, arguments: [hermitScript, "storage", "--json"] + (clean ? ["--clean"] : []),
                                   environment: buildEnvironment, directory: repo.path)
        let runner = runner
        DispatchQueue.global(qos: .utility).async {
            let r = runner.capture(launch)
            let line = r.out.split(separator: "\n").last.map(String.init) ?? ""
            let o = (try? JSONSerialization.jsonObject(with: Data(line.utf8))) as? [String: Any]
            let items = (o?["items"] as? [[String: Any]])?.map { i in
                StorageItem(kind: i["kind"] as? String ?? "", name: i["name"] as? String ?? "", path: i["path"] as? String ?? "",
                            bytes: (i["bytes"] as? NSNumber)?.int64Value ?? 0)
            }
            let freed = (o?["freed"] as? NSNumber)?.int64Value ?? 0
            DispatchQueue.main.async { done(items, freed) }
        }
    }
}
