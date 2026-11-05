import Foundation
import NXCore

// switch2mac's build: one dump folder, which `switch2mac.py identify` names (the game, its version, the engine it is built with), then
// `switch2mac.py build --progress json` (its stage events are the ones nxnative's script writes, so ingest() reads them as they are),
// then `switch2mac.py install --to` the library folder. Each game builds in a work folder of its own, so a later build reuses its files.

/// What `switch2mac.py identify` said about a dump folder (one JSON line).
package struct DumpInfo: Equatable {
    package var folder: String
    package var ok: Bool
    package var titleID: String
    package var name: String
    package var version: String
    package var engine: String
    package var untested: Bool
    package var diskGB: Int?
    package var problem: String
    /// A game's builds (game.json "builds": Mario Kart World has switch2mac's engine and nxnative's), the one game.json "choose" picks for this Mac and why,
    /// and how the game ran on players' Macs (games/<game>/reports.tsv). A game with one build lists that one.
    package var builds: [BuildOption]
    package var recommended: String
    package var why: String
    package var reports: [MacReport]

    package struct BuildOption: Equatable { package var id, name, engine, commit, about: String }
    package struct MacReport: Equatable { package var mac, chip, memoryGB, macOS, build, fps, peakGB, notes, source: String }

    package init?(json line: String) {
        guard let data = line.data(using: .utf8), let o = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] else { return nil }
        folder = o["folder"] as? String ?? ""; ok = o["ok"] as? Bool ?? false
        titleID = o["title_id"] as? String ?? ""; name = o["name"] as? String ?? ""; version = o["version"] as? String ?? ""
        engine = o["engine"] as? String ?? ""; untested = o["untested"] as? Bool ?? false
        diskGB = (o["disk_gb"] as? NSNumber)?.intValue; problem = o["problem"] as? String ?? ""
        builds = (o["builds"] as? [[String: Any]] ?? []).map { b in
            BuildOption(id: b["id"] as? String ?? "", name: b["name"] as? String ?? "", engine: b["engine"] as? String ?? "", commit: b["commit"] as? String ?? "", about: b["about"] as? String ?? "")
        }
        recommended = o["recommended"] as? String ?? ""; why = o["why"] as? String ?? ""
        reports = (o["reports"] as? [[String: String]] ?? []).map { r in
            MacReport(mac: r["mac"] ?? "", chip: r["chip"] ?? "", memoryGB: r["memory_gb"] ?? "", macOS: r["macos"] ?? "", build: r["build"] ?? "", fps: r["fps"] ?? "",
                      peakGB: r["peak_gb"] ?? "", notes: r["notes"] ?? "", source: r["source"] ?? "")
        }
    }

    /// The reports of one build (a report's build column is the build's id, with the commit it was tried at after it).
    package func reports(of build: String) -> [MacReport] { reports.filter { $0.build.split(separator: " ").first.map(String.init) == build } }
}

extension BuildStore {
    /// switch2mac's build script, in the checkout the app drives.
    package var switch2macScript: String { repo.path + "/switch2mac.py" }
    /// Where a game builds: its own work folder, kept for the next build.
    package func switch2macWorkDir(_ titleID: String) -> String {
        NSHomeDirectory() + "/Library/Application Support/switch2mac/builds/" + titleID
    }
    /// Where finished games go: /Applications, with the player's other apps (a rebuild replaces the copy there; its save stays, beside it in
    /// Application Support). Never the dump's folder: NX2Apple's output folder (outDir) follows the input, which for a dump would put the game inside it.
    package var switch2macLibraryDir: String { Self.outputFolder }
    /// Settings → Output: where finished games go, /Applications unless the player chose another folder.
    nonisolated package static let s2mOutputKey = "s2m.outputFolder"
    nonisolated package static var outputFolder: String { UserDefaults.standard.string(forKey: s2mOutputKey).flatMap { $0.isEmpty ? nil : $0 } ?? "/Applications" }

    /// The build of a game with several the player picked (Builds page), else the one chosen for this Mac. Kept per game.
    package func buildChoice(_ info: DumpInfo) -> String {
        let saved = UserDefaults.standard.string(forKey: "s2m.build." + info.titleID)
        return saved.flatMap { id in info.builds.contains { $0.id == id } ? id : nil } ?? info.recommended
    }
    package func chooseBuild(_ id: String, for info: DumpInfo) {
        objectWillChange.send()
        if id == info.recommended { UserDefaults.standard.removeObject(forKey: "s2m.build." + info.titleID) }   // back to the recommendation, which follows the repository's
        else { UserDefaults.standard.set(id, forKey: "s2m.build." + info.titleID) }
    }

    private var buildPython: String { deps.pythonPath.isEmpty ? Toolchain.findPython().path : deps.pythonPath }
    private var buildEnvironment: [String: String] {
        let py = buildPython
        var env: [String: String] = ["PATH": BuildCommands.toolPath("/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin", python: py),
                                     "USER": NSUserName(), "HOME": NSHomeDirectory(), "LANG": "en_US.UTF-8", "TMPDIR": NSTemporaryDirectory()]
        if let root = Toolchain.dotnetRoot(for: deps.dotnetPath.isEmpty ? "dotnet" : deps.dotnetPath) { env["DOTNET_ROOT"] = root; env["DOTNET_ROOT_ARM64"] = root }
        env.merge(BundledTools.environment(for: py)) { $1 }
        return env
    }

    /// The dump folder the player chose: switch2mac.py says which game it is (in the background), and the card shows it.
    package func chooseDump(_ folder: String) {
        gameDir = folder; dumpInfo = nil; identifying = true; done = false; doneNote = ""; failure = nil
        let launch = ProcessLaunch(executable: buildPython, arguments: [switch2macScript, "identify", folder], environment: buildEnvironment, directory: repo.path)
        let runner = runner
        DispatchQueue.global(qos: .userInitiated).async {
            let r = runner.capture(launch)
            let line = r.out.split(separator: "\n").last.map(String.init) ?? ""
            hop {
                guard self.gameDir == folder else { return }   // another folder was chosen meanwhile
                self.identifying = false
                self.dumpInfo = DumpInfo(json: line).map { var i = $0; i.folder = folder; return i } ?? {
                    var i = DumpInfo(json: "{}")!; i.folder = folder
                    i.problem = r.started ? (r.err.split(separator: "\n").last.map(String.init) ?? "switch2mac.py did not answer") : "switch2mac.py could not be started"
                    return i
                }()
            }
        }
    }

    /// The build of the chosen dump: switch2mac.py build, then install into the library folder.
    package func startSwitch2MacBuild() {
        guard !running, let info = dumpInfo, info.ok else { return }
        guard FileManager.default.fileExists(atPath: switch2macScript) else { fail(String(format: t("msg.repoInvalid"), shortPath(repo.path))); return }
        stopping = false
        running = true; done = false; doneNote = ""; stages = []; log.clear(); failure = nil; confirmingOverride = nil; macAppPath = ""
        let py = buildPython, work = switch2macWorkDir(info.titleID), lib = switch2macLibraryDir
        let args = [switch2macScript, "--work", work, "build", info.folder, "--progress", "json"] + (info.builds.count > 1 ? ["--engine", buildChoice(info)] : [])
        say(String(format: t("msg.running"), py) + " " + args.joined(separator: " "))
        lastBuildCommand = [py] + args
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
                // into the library folder (switch2mac.py install --to), off the main thread: a move across volumes copies tens of GB
                try? FileManager.default.createDirectory(atPath: lib, withIntermediateDirectories: true)
                let installArgs = [self.switch2macScript, "--work", work, "install", "--to", lib]
                let runner = self.runner
                DispatchQueue.global(qos: .userInitiated).async {
                    let r = runner.capture(ProcessLaunch(executable: py, arguments: installArgs, environment: env, directory: self.repo.path))
                    hop {
                        self.running = false
                        self.append(r.out + r.err)
                        let app = lib + "/" + info.name + ".app"
                        let made = r.status == 0 && FileManager.default.fileExists(atPath: app)
                        self.macAppPath = made ? app : ""
                        self.done = made
                        self.doneNote = self.t(made ? "msg.macAppDone" : "msg.macAppMissing")
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
