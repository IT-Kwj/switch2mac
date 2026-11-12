import XCTest
@testable import NXCore

/// switch2mac became Hermit: its folder moves once and leaves a link with the old name; settings are copied, never overwritten.
final class AppIdentityTests: XCTestCase {
    private var home: String!
    override func setUpWithError() throws {
        home = NSTemporaryDirectory() + "hermit-identity-" + UUID().uuidString
        try FileManager.default.createDirectory(atPath: home + "/Library/Application Support", withIntermediateDirectories: true)
    }
    override func tearDownWithError() throws { try? FileManager.default.removeItem(atPath: home) }

    private func defaults() -> UserDefaults {
        let name = "hermit-identity-tests-" + UUID().uuidString
        let d = UserDefaults(suiteName: name)!
        d.removePersistentDomain(forName: name)
        return d
    }

    func testTheOldFolderMovesAndALinkKeepsItsPathWorking() throws {
        let fm = FileManager.default, old = AppIdentity.legacySupport(home: home), new = AppIdentity.support(home: home)
        try fm.createDirectory(atPath: old + "/repo", withIntermediateDirectories: true)
        try "x".write(toFile: old + "/library.json", atomically: true, encoding: .utf8)
        AppIdentity.migrate(home: home, defaults: defaults())
        XCTAssertTrue(fm.fileExists(atPath: new + "/library.json"))
        XCTAssertEqual(try fm.destinationOfSymbolicLink(atPath: old), new)
        XCTAssertTrue(fm.fileExists(atPath: old + "/repo"), "the old path still leads to the files")
        // a second start changes nothing
        AppIdentity.migrate(home: home, defaults: defaults())
        XCTAssertEqual(try fm.destinationOfSymbolicLink(atPath: old), new)
    }

    func testAnExistingHermitFolderIsNeverReplaced() throws {
        let fm = FileManager.default, old = AppIdentity.legacySupport(home: home), new = AppIdentity.support(home: home)
        try fm.createDirectory(atPath: old, withIntermediateDirectories: true)
        try fm.createDirectory(atPath: new, withIntermediateDirectories: true)
        try "hermit".write(toFile: new + "/mine", atomically: true, encoding: .utf8)
        AppIdentity.migrate(home: home, defaults: defaults())
        XCTAssertTrue(fm.fileExists(atPath: new + "/mine"))
        XCTAssertNil(try? fm.destinationOfSymbolicLink(atPath: old), "switch2mac's folder stays as it is")
    }

    func testUninstallTakesTheOldNameLinkToo() throws {
        let fm = FileManager.default, old = AppIdentity.legacySupport(home: home)
        try fm.createDirectory(atPath: old, withIntermediateDirectories: true)
        AppIdentity.migrate(home: home, defaults: defaults())
        let plan = Uninstall.plan(home: home, gamesFolder: home + "/games", checkouts: [])
        XCTAssertTrue(plan.stateFolders.contains(AppIdentity.support(home: home)))
        XCTAssertTrue(plan.stateFolders.contains(old))
    }
}
