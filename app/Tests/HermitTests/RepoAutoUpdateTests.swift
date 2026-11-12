import XCTest
@testable import Hermit
@testable import NXCore
import NXModel
@testable import NXLauncher

/// The automatic update when the app opens (RepoStore.autoPull): a clean checkout on main fast-forwards to origin/main,
/// one with local changes is left as it is. A local bare repository stands in for GitHub.
@MainActor final class RepoAutoUpdateTests: IsolatedDefaultsTestCase {
    private var temporary: URL!

    override func setUpWithError() throws {
        guard FileManager.default.isExecutableFile(atPath: "/usr/bin/git") else { throw XCTSkip("git is required for the fixture") }
        temporary = FileManager.default.temporaryDirectory.appendingPathComponent("nxnative-repo-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: temporary, withIntermediateDirectories: true)
    }

    override func tearDownWithError() throws {
        try? FileManager.default.removeItem(at: temporary)
    }

    @discardableResult private func git(_ args: String..., in dir: URL) throws -> String {
        let r = SystemProcessRunner().runQuiet(["/usr/bin/git", "-C", dir.path] + args, env: SystemGitCheckout.environment())
        guard r.ok else { throw NSError(domain: "git", code: 1, userInfo: [NSLocalizedDescriptionKey: "git \(args.joined(separator: " ")): \(r.out)"]) }
        return r.out.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// origin (bare) with two commits on main, and a checkout of the first: one commit behind
    private func fixture() throws -> URL {
        let origin = temporary.appendingPathComponent("origin.git"), work = temporary.appendingPathComponent("work")
        let checkout = temporary.appendingPathComponent("checkout")
        try FileManager.default.createDirectory(at: origin, withIntermediateDirectories: true)
        try git("init", "--bare", "-b", "main", in: origin)
        try git("clone", origin.path, work.path, in: temporary)
        // what makes it a repository to the launcher: switch2mac.py beside games/ (RepoLayout.isRepo; git keeps no empty folder)
        let marker = work.appendingPathComponent(RepoLayout.buildScript)
        try FileManager.default.createDirectory(at: work.appendingPathComponent("games/a"), withIntermediateDirectories: true)
        try "{}".write(to: work.appendingPathComponent("games/a/game.json"), atomically: true, encoding: .utf8)
        try "one".write(to: marker, atomically: true, encoding: .utf8)
        try git("add", ".", in: work); try git("-c", "user.name=t", "-c", "user.email=t@t", "commit", "-m", "one", in: work)
        try git("push", "origin", "HEAD:main", in: work)
        try git("clone", "-b", "main", origin.path, checkout.path, in: temporary)
        try "two".write(to: marker, atomically: true, encoding: .utf8)
        try git("-c", "user.name=t", "-c", "user.email=t@t", "commit", "-am", "two", in: work)
        try git("push", "origin", "HEAD:main", in: work)
        return checkout
    }

    @MainActor private func open(_ checkout: URL) -> LauncherStores {
        let mStores = LauncherStores(defaults: testDefaults); let m = mStores.build
        mStores.repo.path = checkout.path
        mStores.repo.autoUpdate = true
        mStores.repo.checkForUpdates(silent: true)   // what the library does when the app opens
        let settled = XCTNSPredicateExpectation(predicate: NSPredicate { _, _ in !mStores.repo.busy && mStores.repo.behind != nil && (mStores.repo.autoPulled != nil || !mStores.repo.status.isEmpty) }, object: nil)
        wait(for: [settled], timeout: 20)
        return mStores
    }

    @MainActor func testACleanCheckoutOnMainIsUpdatedWhenTheAppOpens() throws {
        let checkout = try fixture()
        let mStores = open(checkout)
        let m = mStores.build
        XCTAssertEqual(mStores.repo.autoPulled, 1)
        XCTAssertEqual(mStores.repo.behind, 0)
        XCTAssertEqual(try git("log", "-1", "--format=%s", in: checkout), "two")
    }

    @MainActor func testACheckoutWithLocalChangesIsLeftAsItIs() throws {
        let checkout = try fixture()
        try "mine".write(to: checkout.appendingPathComponent(RepoLayout.buildScript), atomically: true, encoding: .utf8)
        let mStores = open(checkout)
        let m = mStores.build
        XCTAssertNil(mStores.repo.autoPulled)
        XCTAssertEqual(mStores.repo.status, m.t("repo.autoSkipped"))
        XCTAssertEqual(try git("log", "-1", "--format=%s", in: checkout), "one")
    }
}
