import XCTest
@testable import Hermit

final class WhatsNewTests: XCTestCase {
    private let day = Date(timeIntervalSince1970: 1_793_000_000)

    func testUpdateLines() throws {
        let multi = try XCTUnwrap(WhatsNew.update(subject: "Pokemon Pokopia (pokopia-native build): pokopia-native 3559311eaa95 (pokopia-native 1.2.2: invisible characters on AMD, the name box with a controller)", sha: "a", date: day))
        XCTAssertEqual(multi.game, "Pokemon Pokopia"); XCTAssertEqual(multi.build, "pokopia-native"); XCTAssertEqual(multi.engine, "pokopia-native")
        XCTAssertEqual(multi.commit, "3559311eaa95")
        XCTAssertEqual(multi.note, "pokopia-native 1.2.2: invisible characters on AMD, the name box with a controller")
        let single = try XCTUnwrap(WhatsNew.update(subject: "Donkey Kong Bananza: nxnative cb39b33ad5e8 (fix(dk): white Donkey Kong (#1201))", sha: "b", date: day))
        XCTAssertEqual(single.build, ""); XCTAssertEqual(single.engine, "nxnative"); XCTAssertEqual(single.note, "White Donkey Kong")
        let new = try XCTUnwrap(WhatsNew.update(subject: "New game: Star Fox (nxnative 7bccfc88a4f2)", sha: "c", date: day))
        XCTAssertTrue(new.newGame); XCTAssertEqual(new.game, "Star Fox")
        XCTAssertNil(WhatsNew.update(subject: "switch2mac app 0.2.0: the Performance tab and Share", sha: "d", date: day))
    }

    func testQuietChanges() {
        XCTAssertTrue(WhatsNew.isQuiet("Typo in the readme"))
        XCTAssertTrue(WhatsNew.isQuiet("docs: profile notes"))
        XCTAssertFalse(WhatsNew.isQuiet("Fewer stray bright dots"))
    }

    func testChangelog() {
        let text = """
        # Changelog

        ## 2026-11-05 (9)

        - Builds now check every 5 minutes.
        - Shader lists: **388** rows,
          for the nxnative build.

        ## 2026-11-05 (8): switch2mac app 0.2.0

        - New Performance tab.
        """
        let news = WhatsNew.news(changelog: text)
        XCTAssertEqual(news.count, 2)
        XCTAssertEqual(news[0].points, ["Builds now check every 5 minutes.", "Shader lists: **388** rows, for the nxnative build."])
        XCTAssertNotNil(news[1].date)
        // the heading's day is the day shown, whatever the Mac's time zone (US Central showed "November 4" for 2026-11-05)
        let parts = Calendar.current.dateComponents([.year, .month, .day], from: news[1].date!)
        XCTAssertEqual([parts.year, parts.month, parts.day], [2026, 11, 5])
        XCTAssertTrue(WhatsNewPage.heading(news[1]).hasSuffix(" · switch2mac app 0.2.0"))
        XCTAssertFalse(WhatsNewPage.heading(news[0]).contains("(9)"))
    }

    /// A game app with S2M_ENGINE in its env.txt, and the repository's pins.
    private func app(_ engine: String) throws -> String {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".app/Contents/Resources/dm")
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        try "DM_LAUNCHER=0\nS2M_ENGINE=\(engine)\n".write(to: dir.appendingPathComponent("env.txt"), atomically: true, encoding: .utf8)
        return dir.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent().path
    }

    private let pins = WhatsNew.Pinned(name: "Mario Kart World", builds: [("switch2mac", "switch2mac", "971a9c1a38ed0000"), ("nxnative", "nxnative", "9f1c2ab0aaaa0000")])

    private func updates() -> [WhatsNew.Update] {
        [WhatsNew.update(subject: "Mario Kart World (nxnative build): nxnative 9f1c2ab0aaaa (Sky streaks fixed)", sha: "3", date: day + 300)!,
         WhatsNew.update(subject: "Mario Kart World (nxnative build): nxnative 77aa11bb22cc (docs: notes)", sha: "2", date: day + 200)!,
         WhatsNew.update(subject: "Mario Kart World (switch2mac build): switch2mac 971a9c1a38ed (Faster reflections)", sha: "1b", date: day + 150)!,
         WhatsNew.update(subject: "Mario Kart World (nxnative build): nxnative 84dea6983541 (Fewer stray dots)", sha: "1", date: day + 100)!]
    }

    func testBehindListsOnlyNoticeableChangesSinceYourBuild() throws {
        let s = try XCTUnwrap(WhatsNew.standing(appPath: try app("nxnative-84dea6983541"), pinned: pins, updates: updates(), installedBuild: nil))
        XCTAssertEqual(s.state, .behind)
        XCTAssertEqual(s.build, "nxnative"); XCTAssertEqual(s.mine, "84dea698"); XCTAssertEqual(s.newest, "9f1c2ab0")
        XCTAssertEqual(s.changes.map(\.note), ["Sky streaks fixed"])   // the docs change is quiet; the other build's is not this one's
    }

    func testUpToDate() throws {
        let s = try XCTUnwrap(WhatsNew.standing(appPath: try app("nxnative-9f1c2ab0aaaa"), pinned: pins, updates: updates(), installedBuild: nil))
        XCTAssertEqual(s.state, .upToDate)
    }

    func testOlderAppWithoutCommitUsesItsDate() throws {
        let path = try app("switch2mac")
        try FileManager.default.setAttributes([.modificationDate: day + 120], ofItemAtPath: path)
        let s = try XCTUnwrap(WhatsNew.standing(appPath: path, pinned: pins, updates: updates(), installedBuild: "switch2mac"))
        XCTAssertEqual(s.state, .behind); XCTAssertEqual(s.changes.map(\.note), ["Faster reflections"])
        try FileManager.default.setAttributes([.modificationDate: day + 400], ofItemAtPath: path)
        XCTAssertEqual(WhatsNew.standing(appPath: path, pinned: pins, updates: updates(), installedBuild: "switch2mac")?.state, .upToDate)
    }

    func testUntested() throws {
        XCTAssertEqual(WhatsNew.standing(appPath: try app("nxnative-untested"), pinned: pins, updates: [], installedBuild: nil)?.state, .untested)
    }

    func testEngineChangesAndTheGamesTheyName() throws {
        let api = """
        [{"sha":"1","commit":{"message":"Yoshi's 130 deleted reads translate\\n\\nmore","committer":{"date":"2026-11-05T09:59:00Z"}}},
         {"sha":"2","commit":{"message":"lint-python is green again: pack_quiet","committer":{"date":"2026-11-05T09:46:00Z"}}},
         {"sha":"3","commit":{"message":"Donkey Kong Bananza's white characters (#1100)","committer":{"date":"2026-11-05T01:56:00Z"}}},
         {"sha":"4","commit":{"message":"Float comparisons honour .FTZ on Ampere","committer":{"date":"2026-11-05T01:44:00Z"}}},
         {"sha":"5","commit":{"message":"Mario Kart World and Mario Tennis Fever (0400D4201C6EA000)","committer":{"date":"2026-11-05T01:00:00Z"}}}]
        """
        let changes = WhatsNew.engineChanges(fromAPI: Data(api.utf8))
        XCTAssertEqual(changes.map(\.sha), ["1", "3", "4", "5"])   // the lint line is housekeeping
        let pinned: [String: WhatsNew.Pinned] = [
            "0400245021D2C000": .init(name: "Yoshi and the Mysterious Book", builds: []),
            "040074A01BF12000": .init(name: "Donkey Kong Bananza", builds: []),
            "0400C3F00006E000": .init(name: "Mario Kart World", builds: []),
            "0400D4201C6EA000": .init(name: "Mario Tennis Fever", builds: []),
            "0400A3A01EE4C000": .init(name: "Pokemon Pokopia", builds: [])]
        XCTAssertEqual(WhatsNew.games(named: changes[0].body, pinned: pinned), ["Yoshi and the Mysterious Book"])
        XCTAssertEqual(WhatsNew.games(named: changes[1].body, pinned: pinned), ["Donkey Kong Bananza"])
        XCTAssertEqual(WhatsNew.games(named: changes[2].body, pinned: pinned), [])
        XCTAssertEqual(WhatsNew.games(named: changes[3].body, pinned: pinned), ["Mario Kart World", "Mario Tennis Fever"])
        XCTAssertEqual(WhatsNew.games(named: "Pokopia's 8,158 shaders", pinned: pinned), ["Pokemon Pokopia"])
    }
}
