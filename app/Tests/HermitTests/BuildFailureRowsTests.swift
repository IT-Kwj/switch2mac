import XCTest
@testable import Hermit
@testable import NXCore
import NXModel
@testable import NXLauncher

/// The failure rows for keys, game files and the build's own steps (issue #141): what sets each one, that its text names the
/// action, and that its button does it. The log lines are the script's real messages (Tests/Fixtures/build_failures.json).
@MainActor final class BuildFailureRowsTests: IsolatedDefaultsTestCase {
    func fixture(_ id: String) throws -> BuildFailureTests.Fixture {
        try XCTUnwrap(BuildFailureTests().fixtures().first { $0.id == id }, id)
    }

    func tempFolder() throws -> URL {
        let url = FileManager.default.temporaryDirectory.appendingPathComponent("nspb-rows-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        addTeardownBlock { try? FileManager.default.removeItem(at: url) }
        return url
    }

    // ---- what sets each row



    func testAMissingZbicPackageIsItsOwnRowWithAnInstallButton() throws {
        let log = "[3/9] extract\n" + (try fixture("zbic.missing").text) + "\n"
        XCTAssertEqual(BuildFailureClassifier.classify(log).kind, .zbic)
        XCTAssertEqual(BuildFailureClassifier.classify("[RED] the zbic package decoded it").kind, .unknown)
        XCTAssertTrue(L10n.table["fail.zbic.next"]?.en.contains("pip install zbic") ?? false)
        XCTAssertEqual(L10n.table["fail.zbic.button"]?.en, "Install zbic")
        let mStores = LauncherStores(defaults: testDefaults); let m = mStores.build
        m.logTail = log
        m.noteFailure()
        XCTAssertEqual(m.failure?.kind, .zbic)
        XCTAssertFalse(m.fixBusy(.zbic))
    }

    func testSeveralGamesAndNoTitleID() throws {
        XCTAssertEqual(BuildFailureClassifier.classify(try fixture("games.several").text).kind, .severalGames)
        let none = try fixture("games.noTitleID")
        // after the key check passed, with the script's skip notes above the stop (#177)
        let log = "skipping an empty file: a.nsp\nskipping b.nsp: neither an NSP (PFS0) nor an XCI (HEAD at 0x100)\n" + none.text + "\n"
        let f = BuildFailureClassifier.classify(log)
        XCTAssertEqual(f.kind, .noTitleID)
        XCTAssertEqual(f.detail, none.folder)
    }

    func testAFullDiskNamesTheSizeWhenTheScriptDoes() throws {
        let low = BuildFailureClassifier.classify(try fixture("disk.low").text)
        XCTAssertEqual(low, BuildFailure(kind: .diskFull, gameName: nil, detail: try fixture("disk.low").gb))
        XCTAssertEqual(BuildFailureClassifier.classify(try fixture("disk.full").text), BuildFailure(kind: .diskFull, gameName: nil, detail: nil))
        let mStores = LauncherStores(defaults: testDefaults); let m = mStores.build
        m.lang = .en   // the English text, whatever the Mac's language
        XCTAssertTrue(m.failureWhat(low).contains("40 GB"), m.failureWhat(low))
        XCTAssertFalse(m.failureWhat(BuildFailure(kind: .diskFull, gameName: nil)).contains("GB"))
    }

    func testADriveThatIsNotConnectedComesBeforeTheMessagesItCauses() throws {
        let volumes = try tempFolder()
        let gone = volumes.path + "/Games/Zelda/zelda.nsp"
        let log = try fixture("games.noTitleID").text
        let f = BuildFailureClassifier.classify(log, inputs: .init(paths: [gone], volumes: volumes.path))
        XCTAssertEqual(f, BuildFailure(kind: .driveMissing, gameName: nil, detail: "Games"))
        try FileManager.default.createDirectory(at: volumes.appendingPathComponent("Games"), withIntermediateDirectories: true)
        XCTAssertEqual(BuildFailureClassifier.classify(log, inputs: .init(paths: [gone], volumes: volumes.path)).kind, .noTitleID, "the drive is there")
        XCTAssertEqual(BuildFailureClassifier.classify(log, inputs: .init(paths: ["/Users/x/g.nsp"], volumes: volumes.path)).kind, .noTitleID, "a path off /Volumes is no drive")
        let mStores = LauncherStores(defaults: testDefaults); let m = mStores.build
        m.lang = .en   // the quotes are English ones whatever the device language is
        XCTAssertTrue(m.failureWhat(f).contains("“Games”"))
    }

    func testTheInstallStepsThatFailedBecomeRows() {
        let taken = "error: Failed to register bundle identifier. The app identifier \"org.nxnative.x\" cannot be registered to your development team."
        XCTAssertEqual(BuildFailureClassifier.classifyInstall(.sign, error: taken, teamListed: true)?.kind, .teamTaken)
        XCTAssertEqual(BuildFailureClassifier.classifyInstall(.sign, error: "error: No profiles for 'org.nxnative.x' were found", teamListed: true)?.kind, .teamTaken)
        XCTAssertEqual(BuildFailureClassifier.classifyInstall(.sign, error: "error: something", teamListed: false)?.kind, .noSigningAccount)
        XCTAssertNil(BuildFailureClassifier.classifyInstall(.sign, error: "error: something", teamListed: true), "the tool's line stays")
        for step in [BuildFailureClassifier.InstallStep.install, .copy] {
            XCTAssertEqual(BuildFailureClassifier.classifyInstall(step, error: "ERROR: The device is not connected. (com.apple.dt.CoreDeviceError error 4)", teamListed: true)?.kind, .deviceTransfer)
        }
        XCTAssertEqual(BuildFailureClassifier.classifyInstall(.copy, error: "No space left on device", teamListed: true)?.kind, .diskFull)
    }

    // ---- the text names the action

    func testEveryRowSaysWhatToDoNext() {
        let next: [(BuildFailureKind, [String])] = [
            (.severalGames, ["Move the other games", "folder of their own"]),
            (.noTitleID, ["Rename the file", "0100XXXXXXXXXXXX", "exact package", ".nsp, .xci, .nsz or .xcz", ".00 or .rar", "iCloud", "Show folder"]),
            (.driveMissing, ["Connect the drive"]),
            (.diskFull, ["Free up space", "_build"]),
            (.teamTaken, ["Xcode > Settings > Accounts"]),
            (.noSigningAccount, ["Xcode > Settings > Accounts"]),
            (.deviceTransfer, ["Unlock", "Trust", "cable", "try again"]),
        ]
        for (kind, words) in next {
            let en = L10n.table[kind.nextKey]?.en ?? ""
            for w in words { XCTAssertTrue(en.contains(w), "\(kind): \"\(w)\" is not in \"\(en)\"") }
        }
    }

    /// switch2mac is English only (l10n/en.json).
    func testTheNewRowsHaveEnglishTextsWithoutSemicolonsOrTheProductName() {
        var keys = ["fail.showFolder", "fail.openXcode", "fail.retry", "fail.driveMissing.whatNamed", "fail.diskFull.whatNeeds", "fail.cloudFolder.button", "engine.syncing"]
        let kinds = BuildFailureTests.stateKinds.union([.severalGames, .noTitleID, .diskFull, .cloudFolder])
        for k in BuildFailureKind.allCases where kinds.contains(k) { keys += [k.whatKey, k.nextKey] }
        for key in keys {
            let row = L10n.table[key]
            XCTAssertNotNil(row, key)
            let text = row?.en ?? ""
            XCTAssertFalse(text.isEmpty, key)
            XCTAssertFalse(text.contains(";"), "\(key) has a semicolon")
            XCTAssertFalse(text.localizedCaseInsensitiveContains("NX2Apple"), key)
        }
    }

    // ---- the card and its buttons

    func testAFailedBuildShowsTheRowForItsLogLine() throws {
        for (id, kind) in [("games.several", BuildFailureKind.severalGames), ("games.noTitleID", .noTitleID), ("disk.low", .diskFull), ("disk.full", .diskFull)] {
            let mStores = LauncherStores(defaults: testDefaults); let m = mStores.build
            m.logTail = try fixture(id).text + "\n"
            m.noteFailure()
            XCTAssertEqual(m.failure?.kind, kind, id)
            XCTAssertEqual(m.doneNote, m.failureWhat(m.failure!), id)
        }
    }


    func testShowFolderRevealsTheGameFolderAndForAFullDiskTheBuildFolder() throws {
        let dir = try tempFolder()
        let mStores = LauncherStores(defaults: testDefaults); let m = mStores.build
        var shown: [String] = []
        m.revealFolder = { shown.append($0.path) }
        m.gameDir = dir.path
        m.failure = BuildFailure(kind: .noTitleID, gameName: nil, detail: "/elsewhere")
        m.fixBuildFailure(.noTitleID)
        m.failure = BuildFailure(kind: .severalGames, gameName: nil)
        m.fixBuildFailure(.severalGames)
        XCTAssertEqual(shown, [dir.path, dir.path])
        shown = []
        m.failure = BuildFailure(kind: .diskFull, gameName: nil)
        m.fixBuildFailure(.diskFull)
        XCTAssertEqual(shown, [dir.path], "no build folder yet")
        try FileManager.default.createDirectory(at: dir.appendingPathComponent("0100F2C0115B6000_build"), withIntermediateDirectories: true)
        shown = []
        m.fixBuildFailure(.diskFull)
        XCTAssertEqual(shown, [dir.path + "/0100F2C0115B6000_build"])
        shown = []
        m.gameDir = ""
        m.failure = BuildFailure(kind: .noTitleID, gameName: nil, detail: "/Users/x/Games/Zelda")
        m.fixBuildFailure(.noTitleID)
        XCTAssertEqual(shown, ["/Users/x/Games/Zelda"], "the folder the message names")
    }

    @MainActor func testAnInstallStepThatFailedShowsItsRow() {
        let mStores = LauncherStores(defaults: testDefaults); let m = mStores.build
        mStores.deviceStore.signingTeam = "TEAM123456"
        mStores.deviceStore.readTeams = { [SigningTeam(id: "TEAM123456", identity: "")] }
        m.noteInstallFailure(.sign, error: "error: Failed to register bundle identifier: cannot be registered to your development team")
        XCTAssertEqual(m.failure?.kind, .teamTaken)
        XCTAssertEqual(m.doneNote, m.t("fail.teamTaken.what"))
        mStores.deviceStore.readTeams = { [] }
        m.noteInstallFailure(.sign, error: "error: x")
        XCTAssertEqual(m.failure?.kind, .noSigningAccount)
        m.noteInstallFailure(.install, error: "ERROR: The device is not connected.")
        XCTAssertEqual(m.failure?.kind, .deviceTransfer)
        mStores.deviceStore.readTeams = { [SigningTeam(id: "TEAM123456", identity: "")] }
        m.failure = BuildFailure(kind: .teamTaken, gameName: nil)
        m.noteInstallFailure(.sign, error: "error: x")
        XCTAssertNil(m.failure, "an unknown signing error leaves the tool's line")
    }

    func testTryAgainStartsANewBuildAndClearsTheCard() throws {
        throw XCTSkip("the device transfer row is switch2mac's iPhone install, and its new build was the NSP script's: switch2mac's startBuild needs an identified dump (switch2mac.py identify) and builds Mac apps only")
        let mStores = LauncherStores(defaults: testDefaults); let m = mStores.build
        m.target = BuildTarget.mac   // the iPhone / iPad target stops first, at the device check
        m.failure = BuildFailure(kind: .deviceTransfer, gameName: nil)
        m.fixBuildFailure(.deviceTransfer)   // no repository here: the build stops at once, but it has started and dropped the old card
        XCTAssertNil(m.failure)
    }

    func testTheXcodeButtonOpensXcodeWhenItIsInstalled() {
        let mStores = LauncherStores(defaults: testDefaults); let m = mStores.build
        var opened: [URL] = []
        m.openApp = { opened.append($0) }
        m.failure = BuildFailure(kind: .teamTaken, gameName: nil)
        m.fixBuildFailure(.teamTaken)
        if let xcode = Toolchain.installedXcode() { XCTAssertEqual(opened, [URL(fileURLWithPath: xcode)]) } else { XCTAssertTrue(opened.isEmpty) }
    }
}
