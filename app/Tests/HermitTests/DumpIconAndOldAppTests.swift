import XCTest
@testable import Hermit

final class DumpIconAndOldAppTests: XCTestCase {
    private var dir: URL!
    override func setUpWithError() throws {
        dir = FileManager.default.temporaryDirectory.appendingPathComponent("hermit-test-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
    }
    override func tearDownWithError() throws { try? FileManager.default.removeItem(at: dir) }

    func testOnlyANupDumpHasAnIconToRead() throws {
        let folder = dir.appendingPathComponent("dump"); try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        XCTAssertNil(DumpIcon.nup(folder.path), "a dump of folders has none")
        let nup = folder.appendingPathComponent("Game.NUP"); try Data("NUP".utf8).write(to: nup)
        XCTAssertEqual(DumpIcon.nup(folder.path), nup.path, "the one .nup in the folder")
        XCTAssertEqual(DumpIcon.nup(nup.path), nup.path)
        XCTAssertNil(DumpIcon.nup(dir.appendingPathComponent("gone").path))
    }

    func testAnIconIsAskedForOncePerFileAndNeverWhenThePictureIsThere() throws {
        let nup = dir.appendingPathComponent("g.nup"); try Data("NUP".utf8).write(to: nup)
        let repo = dir.appendingPathComponent("repo"); try FileManager.default.createDirectory(at: repo.appendingPathComponent("tools"), withIntermediateDirectories: true)
        try Data().write(to: repo.appendingPathComponent("tools/nup.py"))
        let art = dir.appendingPathComponent("art"); try FileManager.default.createDirectory(at: art, withIntermediateDirectories: true)
        var asked = 0
        let games = [(titleID: "0400AAAA0000B000", dump: nup.path)]
        // /usr/bin/false stands in for a Python whose reader finds no icon
        XCTAssertEqual(DumpIcon.fetchMissing(games, repo: repo.path, directory: art) { asked += 1; return "/usr/bin/false" }, [])
        XCTAssertEqual(DumpIcon.fetchMissing(games, repo: repo.path, directory: art) { asked += 1; return "/usr/bin/false" }, [])
        XCTAssertEqual(asked, 1, "the same file is not asked twice")
        try Data("x".utf8).write(to: DumpIcon.file("0400aaaa0000b000", in: art))
        XCTAssertNotNil(DumpIcon.cached("0400AAAA0000B000", in: art))
    }

    func testTheOldAppIsFoundOnlyWithItsOwnIdentifier() throws {
        let apps = dir.appendingPathComponent("Applications"), hermit = apps.appendingPathComponent("Hermit.app")
        let old = apps.appendingPathComponent("switch2mac.app/Contents")
        try FileManager.default.createDirectory(at: old, withIntermediateDirectories: true)
        XCTAssertNil(OldApp.find(beside: hermit, home: dir.path), "a folder of that name with no Info.plist is not it")
        try XCTUnwrap(NSDictionary(dictionary: ["CFBundleIdentifier": "com.example.other"])).write(to: old.appendingPathComponent("Info.plist"))
        XCTAssertNil(OldApp.find(beside: hermit, home: dir.path), "another app of that name stays")
        try XCTUnwrap(NSDictionary(dictionary: ["CFBundleIdentifier": "io.github.azmasm.switch2mac"])).write(to: old.appendingPathComponent("Info.plist"))
        XCTAssertEqual(OldApp.find(beside: hermit, home: dir.path)?.lastPathComponent, "switch2mac.app")
        XCTAssertNil(OldApp.find(beside: apps.appendingPathComponent("switch2mac.app"), home: dir.path), "never the app that is running")
    }
}
