import XCTest
@testable import Switch2Mac

/// A Switch game file named only after its game is recognised by name (SwitchTitles, Library.swift), as switch2mac.py title_by_name does.
final class SwitchTitlesTests: XCTestCase {
    private func repo() throws -> String {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent("titles-\(UUID().uuidString)/games")
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        try "# header\n0100F2C0115B6000\tThe Legend of Zelda: Tears of the Kingdom\n01001F5010DFA000\tPokémon Legends: Arceus\n0400486024DEC000\tThe Legend of Zelda: Ocarina of Time\n"
            .write(to: dir.appendingPathComponent("titles.tsv"), atomically: true, encoding: .utf8)
        return dir.deletingLastPathComponent().path
    }

    func testUpdatesAndDLCAreNotTheGame() {
        XCTAssertTrue(SwitchTitles.looksLikeAddOn(URL(fileURLWithPath: "/R/Switch/Updates/The Legend of Zelda Tears of the Kingdom v.1.2.0.nsp")))
        XCTAssertTrue(SwitchTitles.looksLikeAddOn(URL(fileURLWithPath: "/R/Games/Bayonetta 3 Update 1.1.nsp")))
        XCTAssertTrue(SwitchTitles.looksLikeAddOn(URL(fileURLWithPath: "/R/Games/Some Game v1.2.0.nsp")))
        XCTAssertFalse(SwitchTitles.looksLikeAddOn(URL(fileURLWithPath: "/R/Switch/Games/The Legend of Zelda Tears of the Kingdom.xci")))
        XCTAssertFalse(SwitchTitles.looksLikeAddOn(URL(fileURLWithPath: "/R/Switch/Games/Some Game 1.0.0.xci")))
    }

    func testNameWithoutTitleID() throws {
        let r = try repo()
        XCTAssertEqual(SwitchTitles.byName("The Legend of Zelda Tears of the Kingdom.xci", repo: r), 0x0100F2C0115B6000)
        XCTAssertEqual(SwitchTitles.byName("Pokemon Legends Arceus [v0] (US).nsp", repo: r), 0x01001F5010DFA000)
        XCTAssertNil(SwitchTitles.byName("Some Other Game.xci", repo: r))
        XCTAssertNil(SwitchTitles.byName("The Legend of Zelda Ocarina of Time.xci", repo: r))   // a Switch 2 title: never matched as a Switch file
    }
}
