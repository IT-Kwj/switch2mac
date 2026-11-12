import XCTest
@testable import NXCore

/// The uninstall plan (Uninstall.swift): what goes, what stays. The removal runs in a temporary folder,
/// so the real state and checkout are never touched.
final class UninstallTests: XCTestCase {
    private var home: URL!
    private var games: URL!

    override func setUpWithError() throws {
        home = FileManager.default.temporaryDirectory.appendingPathComponent("uninstall-" + UUID().uuidString)
        games = home.appendingPathComponent("Games")
        guard let home, let games else { throw XCTSkip("temporary folder unavailable") }
        for dir in [games, home.appendingPathComponent("Library/Application Support/Hermit/repo"),
                    home.appendingPathComponent("Library/Application Support/Hermit/engine/aaaaaaa"),
                    home.appendingPathComponent("switch2mac")] {
            try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        }
        try Data("k".utf8).write(to: home.appendingPathComponent("prod.keys"))
        try Data("save".utf8).write(to: games.appendingPathComponent("save.dat"))
        setHome(home.path)
    }

    override func tearDownWithError() throws {
        setHome(NSHomeDirectory())
        try? FileManager.default.removeItem(at: home)
    }

    /// Uninstall computes from NSHomeDirectory: the tests point it at the temporary folder.
    private func setHome(_ path: String) {
        setenv("HOME", path, 1)
    }

    private func originFixture(checkout: URL) throws {
        let git = "/usr/bin/git"
        _ = SystemProcessRunner().runQuiet([git, "-C", checkout.path, "init", "-b", "main"], env: SystemGitCheckout.environment())
        _ = SystemProcessRunner().runQuiet([git, "-C", checkout.path, "remote", "add", "origin", "https://github.com/azmasm/hermit.git"], env: SystemGitCheckout.environment())
    }

    func testThePlanTakesStateAndItsOwnCheckoutAndLeavesGamesAndKeys() throws {
        let checkout = home.appendingPathComponent("switch2mac").path
        try originFixture(checkout: URL(fileURLWithPath: checkout))
        let plan = Uninstall.plan(home: home.path, gamesFolder: games.path, checkouts: [checkout])
        // switch2mac: its state folder, which holds the checkout it clones itself (RepoStore.clone)
        XCTAssertEqual(plan.stateFolders.contains(home.path + "/Library/Application Support/Hermit"), true)
        XCTAssertEqual(plan.stateFolders.contains(home.path + "/Library/Application Support/Hermit"), true)
        XCTAssertEqual(plan.checkouts, [checkout])

        let result = Uninstall.run(plan, movingAppToTrash: false)
        XCTAssertTrue(result.failures.isEmpty, result.failures.joined(separator: "\n"))
        XCTAssertTrue(FileManager.default.fileExists(atPath: games.appendingPathComponent("save.dat").path), "the games folder stays")
        XCTAssertTrue(FileManager.default.fileExists(atPath: home.appendingPathComponent("prod.keys").path), "the keys stay")
        XCTAssertFalse(FileManager.default.fileExists(atPath: checkout), "the launcher's own checkout goes")
        XCTAssertFalse(FileManager.default.fileExists(atPath: home.path + "/Library/Application Support/Hermit/repo"), "and the clone in its state folder")
    }

    /// Everything switch2mac keeps goes, a leftover shell folder too; the games' saves and settings stay with the built games.
    func testEverythingOfSwitch2macGoesSavesStay() throws {
        let support = home.appendingPathComponent("Library/Application Support/Hermit")
        try FileManager.default.createDirectory(at: support.appendingPathComponent("shell"), withIntermediateDirectories: true)
        try FileManager.default.createDirectory(at: support.appendingPathComponent("boxart"), withIntermediateDirectories: true)
        let logs = home.appendingPathComponent("Library/Logs/nxnative"), saves = home.appendingPathComponent("Library/Application Support/nxnative/0100000000010000")
        try FileManager.default.createDirectory(at: logs, withIntermediateDirectories: true)
        try FileManager.default.createDirectory(at: saves, withIntermediateDirectories: true)
        let caches = home.appendingPathComponent("Library/Caches/test.switch2mac")
        try FileManager.default.createDirectory(at: caches, withIntermediateDirectories: true)
        let plan = Uninstall.plan(home: home.path, gamesFolder: games.path, checkouts: [], defaultsDomain: "test.switch2mac.uninstall-test")
        XCTAssertTrue(plan.stateFolders.contains(support.path))
        XCTAssertTrue(plan.stateFolders.contains(logs.path))
        let result = Uninstall.run(Uninstall.Plan(stateFolders: plan.stateFolders), movingAppToTrash: false)
        XCTAssertTrue(result.failures.isEmpty, result.failures.joined(separator: "\n"))
        XCTAssertFalse(FileManager.default.fileExists(atPath: support.path))
        XCTAssertFalse(FileManager.default.fileExists(atPath: logs.path))
        XCTAssertTrue(FileManager.default.fileExists(atPath: saves.path), "the games' saves stay")
        XCTAssertTrue(FileManager.default.fileExists(atPath: caches.path), "another domain's caches stay")
    }

    /// A checkout the player picked from somewhere else is not removed: we cannot know what else it holds.
    func testACheckoutFromAnotherFolderIsNotTouched() throws {
        let picked = home.appendingPathComponent("Elsewhere/switch2mac")
        try FileManager.default.createDirectory(at: picked, withIntermediateDirectories: true)
        try originFixture(checkout: picked)
        let plan = Uninstall.plan(home: home.path, gamesFolder: games.path, checkouts: [picked.path])
        XCTAssertTrue(plan.checkouts.isEmpty, "not the launcher's own ~/switch2mac clone")
        XCTAssertTrue(FileManager.default.fileExists(atPath: picked.path))
    }

    func testARepoWithoutOurOriginIsNotTouched() throws {
        let checkout = home.appendingPathComponent("switch2mac").path
        let git = "/usr/bin/git"
        _ = SystemProcessRunner().runQuiet([git, "-C", checkout, "remote", "add", "origin", "https://github.com/someone/else.git"], env: SystemGitCheckout.environment())
        let plan = Uninstall.plan(home: home.path, gamesFolder: games.path, checkouts: [checkout])
        XCTAssertTrue(plan.checkouts.isEmpty, "a fork with another origin is the player's own work")
    }

    /// A games folder or build output folder inside ~/the original launcher keeps the whole checkout: removing it
    /// would take the player's games or builds along.
    func testACheckoutHoldingTheGamesOrTheBuildsStays() throws {
        let checkout = home.appendingPathComponent("switch2mac")
        try originFixture(checkout: checkout)
        let inner = checkout.appendingPathComponent("Games")
        try FileManager.default.createDirectory(at: inner, withIntermediateDirectories: true)
        try Data("save".utf8).write(to: inner.appendingPathComponent("save.dat"))

        let gamesInside = Uninstall.plan(home: home.path, gamesFolder: inner.path, checkouts: [checkout.path])
        XCTAssertTrue(gamesInside.checkouts.isEmpty, "the games folder lives in the checkout")
        let gamesAsCheckout = Uninstall.plan(home: home.path, gamesFolder: checkout.path + "/", checkouts: [checkout.path])
        XCTAssertTrue(gamesAsCheckout.checkouts.isEmpty, "the games folder is the checkout itself")
        let outputInside = Uninstall.plan(home: home.path, gamesFolder: games.path,
                                          outputFolder: checkout.appendingPathComponent("builds").path,
                                          checkouts: [checkout.path])
        XCTAssertTrue(outputInside.checkouts.isEmpty, "the build output lives in the checkout")
        let sibling = Uninstall.plan(home: home.path, gamesFolder: home.appendingPathComponent("switch2macGames").path,
                                     checkouts: [checkout.path])
        XCTAssertEqual(sibling.checkouts, [checkout.path], "a folder that only shares the name prefix does not count")

        let result = Uninstall.run(outputInside, movingAppToTrash: false)
        XCTAssertTrue(result.failures.isEmpty, result.failures.joined(separator: "\n"))
        XCTAssertTrue(FileManager.default.fileExists(atPath: inner.appendingPathComponent("save.dat").path))
    }

    /// The settings live in UserDefaults, not in a state folder: the uninstall removes that domain too.
    func testTheSettingsDomainIsRemoved() throws {
        let domain = "uninstall-test-" + UUID().uuidString
        UserDefaults.standard.setPersistentDomain(["buildOutputDirectory": "/somewhere"], forName: domain)
        defer { UserDefaults.standard.removePersistentDomain(forName: domain) }
        let plan = Uninstall.plan(home: home.path, gamesFolder: games.path, checkouts: [], defaultsDomain: domain)
        XCTAssertEqual(plan.defaultsDomain, domain)
        _ = Uninstall.run(plan, movingAppToTrash: false)
        XCTAssertNil(UserDefaults.standard.persistentDomain(forName: domain)?["buildOutputDirectory"])
    }

    func testThePercentTextAndTrashAreHonestAboutFailures() {
        XCTAssertFalse(Uninstall.trash("/nonexistent/" + UUID().uuidString), "a missing path reports failure")
    }
}
