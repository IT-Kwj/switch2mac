import XCTest
@testable import NXModel
@testable import NXCore

/// `BuildStore` without SwiftUI: the other stores are fakes behind the narrow protocols (`RepoLocation`, `DependencyInstalling`,
/// `EngineSyncing`, `InstallTarget`), the panels and the alert are closures that record, the defaults are a suite of their own and
/// the files are in a temporary folder. No process starts and nothing is built: these tests drive the inputs, the script's events,
/// the failure, "Build anyway" and the conditions that stop a build before it starts.
@MainActor final class BuildStoreTests: XCTestCase {
    private final class FakeRepo: RepoLocation {
        var path = "/repo"
        var isRepo = true
        var isGit = true
    }

    private final class FakeDeps: DependencyInstalling {
        var pythonPath = "/usr/bin/python3"
        var dotnetPath = "/usr/bin/true"
        var checked = true
        var allPresent = true
        var deps: [Dep] = []
        var installed: [String] = []
        var busy: Set<String> = []
        func isInstalling(_ id: String) -> Bool { busy.contains(id) }
        func install(_ dep: Dep) -> Task<Void, Never> { installed.append(dep.id); return Task {} }
    }

    private final class FakeEngine: EngineSyncing {
        var syncs = 0
        func syncEngine(then: ((Bool) -> Void)?) -> Task<Void, Never> { syncs += 1; then?(true); return Task {} }
    }

    private final class FakeDevices: InstallTarget {
        var installDevice = ""
        var signingTeam = ""
        var exportIPA = false
        var exportOneGame = false
        var driveFolder = ""
        var devices: [AppleDevice] = []
        var xcrun = "/usr/bin/true"
        var readTeams: @Sendable () -> [SigningTeam] = { [] }
        func deviceName(_ udid: String) -> String { devices.first { $0.id == udid }?.name ?? "iPhone" }
        nonisolated func askCopy(_ plan: ShellCopyPlan) -> ShellCopyDecision { .skip }
        nonisolated func setWaiting(_ on: Bool) {}
        nonisolated var waitCancelled: Bool { false }
        func copyEnded() {}
    }

    private var suite: String!
    private var defaults: UserDefaults!
    private var temporary: URL!
    private let repo = FakeRepo()
    private let deps = FakeDeps()
    private let engine = FakeEngine()
    private let devices = FakeDevices()
    private let localizer = Localizer(.en)

    override func setUpWithError() throws {
        suite = "nxmodel-build-tests-" + UUID().uuidString
        defaults = UserDefaults(suiteName: suite)
        temporary = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        try FileManager.default.createDirectory(at: temporary, withIntermediateDirectories: true)
    }

    override func tearDownWithError() throws {
        defaults.removePersistentDomain(forName: suite)
        try? FileManager.default.removeItem(at: temporary)
    }

    private func makeStore(targetChanged: @escaping () -> Void = {}) -> BuildStore {
        BuildStore(localizer: localizer, runner: FakeProcessRunner(), repo: repo, deps: deps, engine: engine, devices: devices,
                   defaults: defaults, targetChanged: targetChanged)
    }

    private func file(_ name: String) throws -> String {
        let url = temporary.appendingPathComponent(name)
        try Data([0]).write(to: url)
        return url.path
    }

    // MARK: The conditions to start

    /// switch2mac: a build needs one dump folder that `switch2mac.py identify` named (no NSP files, no prod.keys).
    func testABuildMayStartOnlyWithARepositoryAnIdentifiedDumpAndTheToolsAndNoRunningBuild() throws {
        let store = makeStore()
        XCTAssertFalse(store.canBuild, "no dump yet")
        store.dumpInfo = DumpInfo(json: #"{"ok": false, "problem": "not a dump"}"#)
        XCTAssertFalse(store.canBuild, "a folder switch2mac.py did not recognise")
        store.dumpInfo = DumpInfo(json: #"{"ok": true, "title_id": "0400C3F00006E000", "name": "Game"}"#)
        XCTAssertTrue(store.canBuild)
        repo.isRepo = false
        XCTAssertFalse(store.canBuild, "the repository is not usable")
        repo.isRepo = true; deps.allPresent = false
        XCTAssertFalse(store.canBuild, "a tool is missing")
        deps.allPresent = true; store.running = true
        XCTAssertFalse(store.canBuild, "a build runs")
    }

    /// A Switch 1 game: identify says it needs keys; the build waits for a prod.keys that looks right, and the keys file's path is never shown in a command.
    func testASwitch1GameNeedsKeysAndTheirPathIsHidden() throws {
        let key = BuildStore.keysPathKey, saved = UserDefaults.standard.object(forKey: key)
        defer { if let saved { UserDefaults.standard.set(saved, forKey: key) } else { UserDefaults.standard.removeObject(forKey: key) } }
        UserDefaults.standard.removeObject(forKey: key)
        let store = makeStore()
        store.dumpInfo = DumpInfo(json: #"{"ok": true, "title_id": "0100F2C0115B6000", "name": "Game", "dump_form": "switch1", "needs_keys": true}"#)
        XCTAssertEqual(store.dumpInfo?.dumpForm, "switch1")
        XCTAssertFalse(store.keysReady); XCTAssertFalse(store.canBuild, "a Switch 1 game with no keys file")
        let keys = NSTemporaryDirectory() + "s2m-test-\(UUID().uuidString).keys"
        FileManager.default.createFile(atPath: keys, contents: Data("header_key = 00\n".utf8))
        defer { try? FileManager.default.removeItem(atPath: keys) }
        UserDefaults.standard.set(keys, forKey: key)
        XCTAssertEqual(store.keysPath, keys)
        store.dumpInfo = DumpInfo(json: #"{"ok": true, "title_id": "0100F2C0115B6000", "name": "Game", "dump_form": "switch1", "needs_keys": true, "keys_ok": false, "keys_note": "no master keys"}"#)
        XCTAssertFalse(store.keysReady, "a keys file switch2mac.py found wrong")
        store.dumpInfo = DumpInfo(json: #"{"ok": true, "title_id": "0100F2C0115B6000", "name": "Game", "dump_form": "switch1", "needs_keys": true, "keys_ok": true}"#)
        XCTAssertTrue(store.keysReady); XCTAssertTrue(store.canBuild)
        XCTAssertEqual(store.hidingKeys(["build", "--keys", keys]), ["build", "--keys", BuildStore.keysPlaceholder])
        store.forgetKeys()
        XCTAssertEqual(store.keysPath, ""); XCTAssertFalse(store.keysReady)
        store.dumpInfo = DumpInfo(json: #"{"ok": true, "title_id": "0400C3F00006E000", "name": "Game"}"#)
        XCTAssertTrue(store.keysReady, "a Switch 2 dump needs no keys")
    }

    /// #416: the export choice is not an install, so the stop for a missing device and team does not apply to it.
    func testTheExportChoiceNeedsNoDeviceAndNoTeam() throws {
        throw XCTSkip("the original launcher's iPhone export: switch2mac builds Mac apps only and startBuild goes straight to switch2mac.py (the iPhone code is kept for later)")
        let store = makeStore()
        store.target = "ios"
        devices.exportIPA = true
        XCTAssertTrue(store.exportsShell)
        XCTAssertFalse(store.installsDirectly)
        store.startBuild()
        XCTAssertNotEqual(store.doneNote, store.t("shell.needsDevice"))
        store.target = BuildTarget.mac
        XCTAssertFalse(store.exportsShell, "a Mac app is never an IPA")
    }

    func testAnIPhoneBuildWithoutADeviceStopsBeforeTheLongSteps() throws {
        throw XCTSkip("the original launcher's iPhone build: switch2mac builds Mac apps only and startBuild goes straight to switch2mac.py (the iPhone code is kept for later)")
        let store = makeStore()
        store.target = "ios"
        store.startBuild()
        XCTAssertFalse(store.running)
        XCTAssertEqual(store.doneNote, store.t("shell.needsDevice"))
        XCTAssertFalse(store.installsDirectly)
        devices.installDevice = "UDID"; devices.signingTeam = "TEAM"
        XCTAssertTrue(store.installsDirectly)
        store.target = "mac-app"
        XCTAssertFalse(store.installsDirectly, "a Mac app is not installed on a device")
    }

    /// switch2mac: the build runs the checkout's switch2mac.py, so a checkout without it ends with the message.
    func testABuildWithoutTheScriptEndsWithTheMessageAndRunsNothing() {
        let store = makeStore()
        store.target = "mac-app"
        repo.path = temporary.path   // a folder with no switch2mac.py
        store.dumpInfo = DumpInfo(json: #"{"ok": true, "title_id": "0400C3F00006E000", "name": "Game"}"#)
        store.startBuild()
        XCTAssertFalse(store.running)
        XCTAssertTrue(store.doneNote.hasPrefix("Invalid repository path: "), store.doneNote)
        XCTAssertTrue(store.doneNote.contains(temporary.lastPathComponent), store.doneNote)
        XCTAssertTrue(store.log.text.contains("✗"), "the log says it too")
    }

    // MARK: The inputs

    func testTheTargetTheOutputFolderAndTheCompatibilitySwitchAreSavedAndTheTargetTellsTheApp() {
        var changes = 0
        let store = makeStore { changes += 1 }
        store.target = "mac-app"; store.outDir = "/out"; store.bcOnCPU = true
        XCTAssertEqual(defaults.string(forKey: BuildStore.targetKey), "mac-app")
        XCTAssertEqual(defaults.string(forKey: BuildStore.outputKey), "/out")
        XCTAssertTrue(defaults.bool(forKey: BuildStore.bcOnCPUKey))
        XCTAssertEqual(changes, 1)
        store.target = "mac-app"
        XCTAssertEqual(changes, 1, "the same target is no change")
        XCTAssertEqual(makeStore().outDir, "/out", "a new store starts from what was saved")
    }

    func testTakingFilesFillsTheRowAndNamesTheFirstFileThatDoesNotFit() {
        let store = makeStore()
        store.take(picked: ["/g/Game [0100000000001000].nsp"], kind: .base)
        XCTAssertEqual(store.basePath, "/g/Game [0100000000001000].nsp")
        XCTAssertEqual(store.gameDir, "/g")
        store.take(picked: ["/g/Other [0100000000002800].nsp", "/g/Game update [0100000000001800].nsp"], kind: .update)
        XCTAssertEqual(store.updatePath, "/g/Game update [0100000000001800].nsp", "the file that fits is taken")
        XCTAssertFalse(store.slot("update").problem.isEmpty, "the other one is named on the row")
        store.clear("update")
        XCTAssertEqual(store.updatePath, "")
        XCTAssertEqual(store.slot("update").problem, "")
    }

    func testThePickerIsTheAppsAndGetsTheRowsWordsAndFileTypes() {
        let store = makeStore()
        var asked: [FilePick] = []
        store.choosePaths = { asked.append($0); return ["/g/Game dlc [0100000000001001].nsp"] }
        store.pickFiles(kind: .dlc)
        XCTAssertEqual(asked.count, 1)
        XCTAssertTrue(asked[0].allowsMultiple)
        XCTAssertEqual(asked[0].fileTypes, GameInputs.allowedFileTypes(for: .dlc))
        XCTAssertEqual(asked[0].message, store.t("data.dlcPanelMessage"))
        store.choosePaths = { _ in [] }
        store.pickFiles(kind: .update)
        XCTAssertEqual(store.updatePath, "", "a cancelled panel changes nothing")
    }

    // MARK: The script's events

    func testTheScriptsJSONEventsBecomeStagesAndLogLines() {
        let store = makeStore()
        store.ingest("{\"ev\":\"stage\",\"k\":1,\"n\":3,\"name\":\"extract\",\"step\":\"keys\"}\n")
        XCTAssertEqual(store.stages.map(\.id), [1])
        XCTAssertEqual(store.stages[0].state, .running)
        XCTAssertEqual(store.stages[0].detail, "keys")
        store.ingest("{\"ev\":\"progress\",\"k\":1,\"frac\":0.5,\"done\":5,\"total\":10}\n{\"ev\":\"stage_end\",\"k\":1,\"name\":\"extract\",\"ok\":true,\"elapsed\":3,\"summary\":\"10 files\"}\n")
        XCTAssertEqual(store.stages[0].state, .done)
        XCTAssertEqual(store.stages[0].detail, "10 files")
        XCTAssertEqual(store.stages[0].percent, 100)
        XCTAssertTrue(store.log.text.contains("[1/3] extract · keys …"))
        XCTAssertTrue(store.log.text.contains("✓ extract (\(BuildProgress.duration(3))): 10 files"))
    }

    func testAChunkThatEndsInTheMiddleOfALineWaitsForTheRest() {
        let store = makeStore()
        store.ingest("{\"ev\":\"stage\",\"k\":2,\"n\":3,\"na")
        XCTAssertTrue(store.stages.isEmpty)
        store.ingest("me\":\"pack\"}\nplain line from a tool\n")
        XCTAssertEqual(store.stages.map(\.id), [2])
        XCTAssertTrue(store.log.text.contains("plain line from a tool\n"), "what is not an event is log text")
    }

    func testTheShaderChainNoticeShowsOncePerBuild() {
        let store = makeStore()
        var notices: [String] = []
        store.showNotice = { notices.append($0) }
        store.ingest("{\"ev\":\"say\",\"msg\":\"[NOTE] chain-changed: recompiling\"}\n")
        store.ingest("[NOTE] chain-changed again\n")
        XCTAssertEqual(notices, [store.t("msg.chainChanged")])
    }

    // MARK: The failure

    func testAFailedBuildsLogIsClassifiedAndAnUnknownStopLeavesTheNote() {
        let store = makeStore()
        store.logTail = "[RED] the iOS SDK is not installed\n"
        store.noteFailure()
        XCTAssertEqual(store.failure?.kind, .iosSDK)
        XCTAssertEqual(store.doneNote, store.t(BuildFailureKind.iosSDK.whatKey))
        store.doneNote = "Build failed: something else"
        store.logTail = "nothing the table knows"
        store.noteFailure()
        XCTAssertNil(store.failure)
        XCTAssertEqual(store.doneNote, "Build failed: something else")
    }

    func testBuildAnywayAsksFirstAndArmsTheFlagForOneBuildOnly() throws {
        throw XCTSkip("the original launcher's NSP script took the override flags: switch2mac.py passes --allow-other-metal itself and its build takes no override, so startBuild never consumes the armed flag")
        let store = makeStore()
        store.target = "mac-app"
        repo.isRepo = false   // the build that follows ends at once, which is all this test needs
        store.failure = BuildFailure(kind: .iosSDK, gameName: nil)
        store.requestBuildAnyway()
        XCTAssertNil(store.confirmingOverride, "this stop has no override")
        store.failure = BuildFailure(kind: .otherMetal, gameName: nil)
        store.running = true
        store.requestBuildAnyway()
        XCTAssertNil(store.confirmingOverride, "not while a build runs")
        store.running = false
        store.requestBuildAnyway()
        XCTAssertEqual(store.confirmingOverride, .otherMetal)
        XCTAssertNil(store.armedOverride, "nothing is armed before the confirmation")
        store.cancelBuildAnyway()
        XCTAssertNil(store.confirmingOverride)
        store.requestBuildAnyway()
        store.confirmBuildAnyway()
        XCTAssertNil(store.confirmingOverride)
        XCTAssertNil(store.armedOverride, "the build took the flag: the next one asks again")
        XCTAssertNil(store.takeOverrideFlag())
        store.armedOverride = .damagedNSP
        XCTAssertEqual(store.takeOverrideFlag(), "--allow-damaged")
        XCTAssertNil(store.takeOverrideFlag())
    }

    func testTheFixButtonsRunTheDependencyRowsOwnInstall() {
        let store = makeStore()
        deps.deps = [Dep(id: "dotnet", name: "dep.dotnet", hint: "", present: false, installCmd: ["/usr/bin/true"]),
                     Dep(id: "python", name: "dep.python", hint: "", present: false, installCmd: ["/usr/bin/true"])]
        store.fixBuildFailure(.translator)
        store.fixBuildFailure(.zbic)
        store.fixBuildFailure(.iosSDK)
        XCTAssertEqual(deps.installed, ["dotnet", "python", "xcode"])
        XCTAssertFalse(store.fixBusy(.translator))
        deps.busy = ["dotnet"]
        XCTAssertTrue(store.fixBusy(.translator))
        XCTAssertFalse(store.fixBusy(.zbic))
        XCTAssertFalse(store.fixBusy(.cloudFolder), "a fix that is no install is never busy")
    }

    func testTheCloudFixUsesTheFolderPanel() {   // switch2mac: no keys fix
        let store = makeStore()
        store.failure = BuildFailure(kind: .cloudFolder, gameName: nil, detail: "/iCloud/x")
        store.doneNote = "stopped"
        store.chooseFolder = { nil }
        store.fixBuildFailure(.cloudFolder)
        XCTAssertEqual(store.failure?.kind, .cloudFolder, "a cancelled panel keeps the stop")
        store.chooseFolder = { "/Users/x/Games" }
        store.fixBuildFailure(.cloudFolder)
        XCTAssertEqual(store.outDir, "/Users/x/Games")
        XCTAssertNil(store.failure, "the next build looks at the new folder")
        XCTAssertEqual(store.doneNote, "")
    }

    func testTheFailureFolderOpensInTheFinderForAFullDisk() throws {
        let store = makeStore()
        let built = temporary.appendingPathComponent("0100_build")
        try FileManager.default.createDirectory(at: built, withIntermediateDirectories: true)
        store.gameDir = temporary.path
        store.failure = BuildFailure(kind: .diskFull, gameName: nil, detail: "40")
        var shown: [URL] = []
        store.revealFolder = { shown.append($0) }
        store.showFailureFolder()
        XCTAssertEqual(shown.map(\.path), [built.path])
    }

    // MARK: The install on a device

    func testReinstallAndResignSayWhyTheyCannotRunInsteadOfStartingATool() {
        let store = makeStore()
        store.reinstallOnDevice()
        XCTAssertFalse(store.running, "nothing was installed: nothing to reinstall")
        store.installedOn = "UDID"; store.installedAppPath = temporary.path + "/gone/DmIOS.app"
        store.reinstallOnDevice()
        XCTAssertFalse(store.running)
        XCTAssertEqual(store.doneNote, String(format: store.t("dev.reinstallMissing"), store.shortPath(store.installedAppPath)))
        store.resignOnDevice(app: store.installedAppPath, device: "UDID")
        XCTAssertEqual(store.doneNote, store.t("dev.resignNoTeam"))
        devices.signingTeam = "TEAM"
        store.resignOnDevice(app: store.installedAppPath, device: "UDID")
        XCTAssertEqual(store.doneNote, store.t("dev.resignOlder"))
        XCTAssertFalse(store.running)
    }

    func testTheSavePanelIsTheAppsAndACancelWritesNothing() {
        let store = makeStore()
        var asked: [(String, String)] = []
        store.chooseSaveLocation = { asked.append(($0, $1)); return nil }
        store.saveIPAPanel()
        XCTAssertEqual(asked.count, 1)
        XCTAssertEqual(asked.first?.0, store.t("dev.saveIPATitle"))
        XCTAssertEqual(asked.first?.1, "DmIOS.ipa")
        XCTAssertFalse(store.running)
    }

    func testTheRetryOfTheGameDataNeedsAnInstallThatLeftOneToRetry() {
        let store = makeStore()
        store.retryShellData()
        XCTAssertFalse(store.running, "no install ran: nothing to retry")
    }

    func testWhatTheStoreWritesItselfIsInTheLanguageOfTheLocalizer() {
        let store = makeStore()
        localizer.lang = Lang("de")
        XCTAssertEqual(store.lang, Lang("de"))
        XCTAssertEqual(store.t("shell.needsDevice"), L10n.string("shell.needsDevice", Lang("de")))
    }

    func testAStoppedBuildWithNothingRunningDoesNothing() {
        let store = makeStore()
        store.stop()
        XCTAssertFalse(store.stopping)
    }

    // MARK: Move cache folder (#427)

    /// A store whose home is the temporary folder, so the default cache place is never the real Application Support.
    private func moveStore() throws -> (BuildStore, cache: String) {
        let store = makeStore()
        store.home = temporary.path + "/home"
        let cache = store.home + "/Library/Application Support/switch2mac/shell"
        try FileManager.default.createDirectory(atPath: cache + "/frameworks/DmGame0100AAAA.framework", withIntermediateDirectories: true)
        try Data("shader".utf8).write(to: URL(fileURLWithPath: cache + "/frameworks/DmGame0100AAAA.framework/game.manifest.json"))
        let json: [String: Any] = ["bundleID": "org.nxnative.shell.TEAM", "team": "TEAM", "games": [["titleID": "0100AAAA", "name": "A", "framework": cache + "/frameworks/DmGame0100AAAA.framework"]]]
        try JSONSerialization.data(withJSONObject: json).write(to: URL(fileURLWithPath: cache + "/shell.json"))
        XCTAssertEqual(store.shellCachePath, cache)
        XCTAssertTrue(store.shellCacheIsDefault)
        return (store, cache)
    }

    /// The build guard: no move starts while a build, an install or an export runs, and nothing on disk changes.
    func testTheCacheDoesNotMoveWhileABuildRuns() throws {
        let (store, cache) = try moveStore()
        let picked = temporary.path + "/Drive"
        try FileManager.default.createDirectory(atPath: picked, withIntermediateDirectories: true)
        store.prepareShellMove(into: picked)
        guard case .confirm(let plan) = store.shellMove else { return XCTFail("the confirmation shows") }
        XCTAssertEqual(plan.destination, picked + "/switch2mac-shell")
        store.running = true
        XCTAssertNil(store.confirmShellMove(), "refused while a build runs")
        XCTAssertEqual(store.shellMove, .confirm(plan), "the confirmation stays, with its note")
        XCTAssertTrue(FileManager.default.fileExists(atPath: cache + "/shell.json"))
        XCTAssertFalse(FileManager.default.fileExists(atPath: plan.destination))
        XCTAssertNil(defaults.string(forKey: "shellRoot"), "the saved place is unchanged")
    }

    /// While the cache moves the build store's `running` flag is set, so no build can start, and the saved place, shell.json and the
    /// way back follow the move.
    func testAMoveSavesTheNewPlaceAndTheWayBackClearsThePick() async throws {
        let (store, cache) = try moveStore()
        let picked = temporary.path + "/Drive"
        try FileManager.default.createDirectory(atPath: picked, withIntermediateDirectories: true)
        store.prepareShellMove(into: picked)
        let task = try XCTUnwrap(store.confirmShellMove())
        XCTAssertTrue(store.running, "builds, installs and exports are off while the cache moves")
        XCTAssertFalse(store.canBuild)
        await task.value
        let moved = picked + "/switch2mac-shell"
        XCTAssertEqual(store.shellMove, .moved(moved))
        XCTAssertFalse(store.running)
        XCTAssertEqual(defaults.string(forKey: "shellRoot"), moved)
        XCTAssertTrue(defaults.bool(forKey: ShellRootMove.pickedKey))
        XCTAssertEqual(store.shellCachePath, moved)
        XCTAssertEqual(store.shellRoot, moved, "the launch migration leaves a picked folder where it is")
        XCTAssertFalse(store.shellCacheIsDefault)
        XCTAssertFalse(FileManager.default.fileExists(atPath: cache))
        XCTAssertEqual(ShellLibrary.load(root: moved).games.first?.framework, moved + "/frameworks/DmGame0100AAAA.framework")

        store.dismissShellMove()
        store.prepareShellMoveToDefault()
        await store.confirmShellMove()?.value
        XCTAssertEqual(store.shellMove, .moved(cache))
        XCTAssertEqual(defaults.string(forKey: "shellRoot"), cache)
        XCTAssertFalse(defaults.bool(forKey: ShellRootMove.pickedKey))
        XCTAssertTrue(store.shellCacheIsDefault)
        XCTAssertEqual(try FileManager.default.contentsOfDirectory(atPath: picked), [], "the picked folder stays, empty as it was")
    }

    /// A move that fails on the disk says why and where the cache stays, keeps the old folder and the saved place.
    func testAFailedMoveKeepsTheCacheAndTheSavedPlace() async throws {
        let (store, cache) = try moveStore()
        let picked = temporary.path + "/Locked"
        try FileManager.default.createDirectory(atPath: picked, withIntermediateDirectories: true)
        try FileManager.default.setAttributes([.posixPermissions: 0o555], ofItemAtPath: picked)   // nothing can be made inside it
        defer { try? FileManager.default.setAttributes([.posixPermissions: 0o755], ofItemAtPath: picked) }
        store.prepareShellMove(into: picked)
        await store.confirmShellMove()?.value
        guard case .failed(let why, let stays) = store.shellMove else { return XCTFail("expected a failure, got \(store.shellMove)") }
        XCTAssertFalse(why.isEmpty)
        XCTAssertFalse(why.hasSuffix("."), "the text goes on after the reason, so the system's full stop is dropped")
        XCTAssertEqual(stays, cache)
        XCTAssertFalse(store.running)
        XCTAssertTrue(FileManager.default.fileExists(atPath: cache + "/frameworks/DmGame0100AAAA.framework/game.manifest.json"))
        XCTAssertNil(defaults.string(forKey: "shellRoot"))
        XCTAssertFalse(defaults.bool(forKey: ShellRootMove.pickedKey))
    }

    func testAMoveThatCannotStartKeepsTheSavedPlace() throws {
        let (store, cache) = try moveStore()
        store.prepareShellMove(into: cache + "/frameworks")
        guard case .confirm(let plan) = store.shellMove else { return XCTFail("the confirmation shows") }
        XCTAssertEqual(plan.problem, .insideCache)
        XCTAssertNil(store.confirmShellMove())
        XCTAssertFalse(store.running)
        XCTAssertNil(defaults.string(forKey: "shellRoot"))
    }

    /// A Switch cartridge with two games: identify names both and the files that go to the builder; the store passes the pick and added files on,
    /// and forgets them when another game is chosen.
    func testSwitchCartridgeAndAddedFiles() throws {
        let line = #"{"ok": true, "title_id": "010038E016264000", "dump_form": "switch1", "needs_keys": true, "parts": {"base": "Mega [010038E016264000+0100734016266000].xci", "update": "", "dlc": ["d.nsp"]}, "games_in_files": [{"title_id": "010038E016264000", "name": ""}, {"title_id": "0100734016266000", "name": "Vol 2"}]}"#
        let info = try XCTUnwrap(DumpInfo(json: line))
        XCTAssertEqual(info.gamesInFiles.map(\.titleID), ["010038E016264000", "0100734016266000"])
        XCTAssertEqual(info.parts?.dlc ?? [], ["d.nsp"]); XCTAssertEqual(info.parts?.update ?? "-", "")
        let store = makeStore()
        store.gameDir = "/x/Mega.xci"; store.s1Pick = "0100734016266000"; store.s1Extra = ["/y/u.nsp"]
        XCTAssertEqual(store.switchChoices, ["--title-id", "0100734016266000", "--add", "/y/u.nsp"])
        store.gameDir = "/x/Other.nsp"
        XCTAssertEqual(store.switchChoices, [], "another game starts without the last one's pick and files")
    }
}
