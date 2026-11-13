import XCTest
@testable import NXCore

/// The build script is hermit.py; a checkout from before the rename has only switch2mac.py and must keep working.
final class BuildScriptNameTests: XCTestCase {
    func testTheNewNameWinsAndTheOldOneStillCounts() throws {
        let fm = FileManager.default
        let dir = fm.temporaryDirectory.appendingPathComponent("script-name-\(UUID().uuidString)")
        try fm.createDirectory(at: dir.appendingPathComponent("games"), withIntermediateDirectories: true)
        defer { try? fm.removeItem(at: dir) }
        XCTAssertFalse(RepoLayout.isRepo(dir.path))
        XCTAssertEqual(RepoLayout.script(in: dir.path), dir.path + "/hermit.py", "a checkout with neither is asked for the new name")
        try Data().write(to: dir.appendingPathComponent("switch2mac.py"))
        XCTAssertTrue(RepoLayout.isRepo(dir.path))
        XCTAssertEqual(RepoLayout.script(in: dir.path), dir.path + "/switch2mac.py")
        XCTAssertEqual(RepoLayout.missingTools(in: dir.path), [])
        try Data().write(to: dir.appendingPathComponent("hermit.py"))
        XCTAssertEqual(RepoLayout.script(in: dir.path), dir.path + "/hermit.py")
    }
}
