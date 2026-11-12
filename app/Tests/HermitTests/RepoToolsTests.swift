import XCTest
@testable import Hermit
@testable import NXCore
import NXModel
@testable import NXLauncher

/// #87: a ZIP copy of the repository is connected to git when the app opens, and a build does not start with build tools
/// older than the app. Temporary folders and a local repository stand in for the user's copy and for GitHub.
@MainActor final class RepoToolsTests: IsolatedDefaultsTestCase {
    private var temporary: URL!

    override func setUpWithError() throws {
        temporary = FileManager.default.temporaryDirectory.appendingPathComponent("nxnative-tools87-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: temporary, withIntermediateDirectories: true)
    }

    override func tearDownWithError() throws {
        try? FileManager.default.removeItem(at: temporary)
    }

    private func write(_ files: [String], in dir: URL, text: String = "x") throws {
        for f in files {
            let url = dir.appendingPathComponent(f)
            try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
            try text.write(to: url, atomically: true, encoding: .utf8)
        }
    }

    @discardableResult private func git(_ args: String..., in dir: URL) throws -> String {
        let r = SystemProcessRunner().runQuiet(["/usr/bin/git", "-C", dir.path] + args, env: SystemGitCheckout.environment())
        guard r.ok else { throw NSError(domain: "git", code: 1, userInfo: [NSLocalizedDescriptionKey: "git \(args.joined(separator: " ")): \(r.out)"]) }
        return r.out.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    // The decision (GitRules.zipAdoption) is tested in NXCoreTests/GitCheckoutTests.

    // MARK: the missing-tool check

    /// switch2mac: switch2mac.py is the one tool the app runs by path.
    func testMissingToolsAreListed() throws {
        let repo = temporary.appendingPathComponent("switch2mac")
        try write(["games/a/game.json"], in: repo)
        XCTAssertEqual(RepoLayout.missingTools(in: repo.path), [RepoLayout.buildScript])
        try write([RepoLayout.buildScript], in: repo)
        XCTAssertEqual(RepoLayout.missingTools(in: repo.path), [])
        XCTAssertEqual(RepoLayout.missingTools(in: temporary.appendingPathComponent("nothing").path), RepoLayout.requiredTools)
    }

    func testEveryToolTheLauncherCallsExistsInThisCheckout() throws {
        let root = URL(fileURLWithPath: #filePath).deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
        guard RepoLayout.isRepo(root.path) else { throw XCTSkip("not run inside a checkout") }
        XCTAssertEqual(RepoLayout.missingTools(in: root.path), [])
    }

    @MainActor func testABuildWithOldToolsRefusesToStart() throws {
        throw XCTSkip("the original launcher's check for build tools older than the app (#87, romfs_image.py): switch2mac's one required tool is switch2mac.py, which a checkout needs to be one (RepoLayout.isRepo)")
        let repo = temporary.appendingPathComponent("old")
        try write(["dm/tools/nx_extract/Program.cs", RepoLayout.buildScript], in: repo)
        let mStores = LauncherStores(defaults: testDefaults); let m = mStores.build
        mStores.repo.path = repo.path
        m.target = BuildTarget.mac
        m.startBuild()
        XCTAssertFalse(m.running, "no build was started")
        XCTAssertTrue(m.doneNote.contains(RepoLayout.romfsImageTool), m.doneNote)
        XCTAssertEqual(m.doneNote, String(format: m.t("msg.toolsOld"), RepoLayout.romfsImageTool))
    }

    // MARK: the adoption itself (local repository as origin)

    /// A file origin/main has and the older ZIP copy lacks (it stands in for the original launcher's romfs tool of #87).
    private let newFile = "tools/shader_list.py"

    /// origin (bare) with switch2mac.py, games/ and a newer file on main, and a ZIP-like copy of an older state: no .git, the newer file missing
    private func fixture() throws -> (origin: URL, zip: URL) {
        let origin = temporary.appendingPathComponent("origin.git"), work = temporary.appendingPathComponent("work")
        let zip = temporary.appendingPathComponent("switch2mac-0.4.5")
        try FileManager.default.createDirectory(at: origin, withIntermediateDirectories: true)
        try git("init", "--bare", "-b", "main", in: origin)
        try git("clone", origin.path, work.path, in: temporary)
        try write(["games/a/game.json", RepoLayout.buildScript, newFile], in: work, text: "new")
        try git("add", ".", in: work)
        try git("-c", "user.name=t", "-c", "user.email=t@t", "commit", "-m", "main", in: work)
        try git("push", "origin", "HEAD:main", in: work)
        try write(["games/a/game.json", RepoLayout.buildScript], in: zip, text: "old")
        return (origin, zip)
    }

    @MainActor private func openZip(_ f: (origin: URL, zip: URL), auto: Bool, remote: String? = nil) -> LauncherStores {
        let mStores = LauncherStores(defaults: testDefaults); let m = mStores.build
        mStores.repo.path = f.zip.path
        mStores.repo.autoUpdate = auto
        mStores.repo.adoptAtLaunch(remote: remote ?? "file://" + f.origin.path)
        guard auto else { return mStores }   // nothing runs, nothing to wait for
        let settled = XCTNSPredicateExpectation(predicate: NSPredicate { _, _ in !mStores.repo.busy && !mStores.repo.status.isEmpty && mStores.repo.status != m.t("repo.adopting") }, object: nil)
        wait(for: [settled], timeout: 20)
        return mStores
    }

    @MainActor func testAZipCopyIsConnectedAndUpdatedAtLaunch() throws {
        guard FileManager.default.isExecutableFile(atPath: "/usr/bin/git") else { throw XCTSkip("git is required for the fixture") }
        let f = try fixture()
        XCTAssertFalse(FileManager.default.fileExists(atPath: f.zip.appendingPathComponent(newFile).path))
        let mStores = openZip(f, auto: true)
        let m = mStores.build
        XCTAssertTrue(mStores.repo.isGit)
        XCTAssertTrue(mStores.repo.autoAdopted)
        XCTAssertEqual(mStores.repo.status, String(format: m.t("repo.adoptedAuto"), GitRules.zipCopyBranch()))
        XCTAssertTrue(FileManager.default.fileExists(atPath: f.zip.appendingPathComponent(newFile).path), "the files of origin/main are there now")
        XCTAssertEqual(try git("rev-parse", "--abbrev-ref", "HEAD", in: f.zip), "main")
        XCTAssertEqual(try String(contentsOf: f.zip.appendingPathComponent(RepoLayout.buildScript), encoding: .utf8), "new")
    }

    @MainActor func testTheCopyIsKeptOnABranchBeforeTheCheckoutOverwritesIt() throws {
        guard FileManager.default.isExecutableFile(atPath: "/usr/bin/git") else { throw XCTSkip("git is required for the fixture") }
        let f = try fixture()
        try "my tweak".write(to: f.zip.appendingPathComponent(RepoLayout.buildScript), atomically: true, encoding: .utf8)   // an edited tracked file
        try write(["dm/mine/notes.txt"], in: f.zip, text: "mine")                                       // a file origin does not have
        try write(["dm/tools/build/huge.bin"], in: f.zip, text: "build output")
        let mStores = openZip(f, auto: true)
        let m = mStores.build
        let branch = GitRules.zipCopyBranch()
        XCTAssertEqual(try git("show", "main:" + RepoLayout.buildScript, in: f.zip), "new", "main has origin's version")
        XCTAssertEqual(try String(contentsOf: f.zip.appendingPathComponent(RepoLayout.buildScript), encoding: .utf8), "new")
        XCTAssertEqual(try git("show", branch + ":" + RepoLayout.buildScript, in: f.zip), "my tweak", "the branch has the edit")
        XCTAssertEqual(try git("ls-tree", "-r", "--name-only", branch, in: f.zip).split(separator: "\n").map(String.init).sorted(),
                       ["games/a/game.json", RepoLayout.buildScript].sorted(), "only paths origin tracks are recorded")
        XCTAssertEqual(try git("log", "-1", "--format=%an", branch, in: f.zip), "switch2mac")
        XCTAssertTrue(FileManager.default.fileExists(atPath: f.zip.appendingPathComponent("dm/mine/notes.txt").path), "untracked files stay where they are")
        XCTAssertTrue(mStores.repo.status.contains(branch), mStores.repo.status)
    }

    @MainActor func testWithTheAutomaticUpdateOffTheZipCopyIsLeftAlone() throws {
        guard FileManager.default.isExecutableFile(atPath: "/usr/bin/git") else { throw XCTSkip("git is required for the fixture") }
        let f = try fixture()
        let mStores = openZip(f, auto: false)
        let m = mStores.build
        XCTAssertFalse(mStores.repo.isGit)
        XCTAssertFalse(mStores.repo.autoAdopted)
        XCTAssertTrue(mStores.repo.status.isEmpty, "Settings says it next to the repository (repo.zipNoAuto), not as a status")
        XCTAssertFalse(FileManager.default.fileExists(atPath: f.zip.appendingPathComponent(newFile).path))
    }

    @MainActor func testAnUnreachableOriginSaysWhyAndLeavesTheCopyUsable() throws {
        guard FileManager.default.isExecutableFile(atPath: "/usr/bin/git") else { throw XCTSkip("git is required for the fixture") }
        let f = try fixture()
        let mStores = openZip(f, auto: true, remote: "file://" + temporary.appendingPathComponent("does-not-exist.git").path)
        let m = mStores.build
        XCTAssertEqual(mStores.repo.status, m.t("repo.adoptFailAuto"))
        XCTAssertFalse(mStores.repo.autoAdopted)
        XCTAssertTrue(RepoLayout.isRepo(f.zip.path), "the files are still there")
        XCTAssertEqual(try String(contentsOf: f.zip.appendingPathComponent(RepoLayout.buildScript), encoding: .utf8), "old", "nothing was changed")
        XCTAssertFalse(FileManager.default.fileExists(atPath: f.zip.appendingPathComponent(".git").path))
    }
}
