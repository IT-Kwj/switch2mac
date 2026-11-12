import XCTest
@testable import Hermit

/// The booklet's pages (GameBooklet.swift) and the shop text they come from (Artwork.swift).
final class GameBookletTests: XCTestCase {
    func testAShortTextIsOnePageAndALongOneNeverOverflows() {
        XCTAssertEqual(Booklet.fill(["One.", "Two."], limit: 100), ["One.\n\nTwo."])
        let long = String(repeating: "A sentence of some length. ", count: 80)
        let pages = Booklet.fill([long, "The end."], limit: 300)
        XCTAssertGreaterThan(pages.count, 5)
        XCTAssertTrue(pages.allSatisfy { $0.count <= 300 }, "a page holds at most the limit")
        XCTAssertEqual(pages.joined(separator: " ").components(separatedBy: "A sentence").count - 1, 80, "nothing is lost")
        XCTAssertTrue(pages.last!.hasSuffix("The end."))
    }

    func testAWordWithNoSpacesStillEnds() {
        let pages = Booklet.fill([String(repeating: "x", count: 1000)], limit: 300)
        XCTAssertEqual(pages.map(\.count).reduce(0, +), 1000)
    }

    func testPagesAreCoverTextDetailsThenTheMacPage() {
        var info = GameInfo(); info.intro = "Race anywhere."; info.description = "Race anywhere.\n\n\nDrive across a wide world."
        info.publisher = "Nintendo"; info.releaseDate = 20250605; info.players = 4; info.categories = ["Racing"]; info.rating = "E"
        let pages = Booklet.pages(info)
        XCTAssertEqual(pages.first, .cover)
        XCTAssertEqual(pages[1], .text(heading: "About the game", body: "Race anywhere.\n\nDrive across a wide world."), "the intro is not said twice")
        guard case let .table(_, rows, _) = pages[2] else { return XCTFail("details") }
        XCTAssertEqual(rows.map(\.1), ["Nintendo", "5 June 2025", "1 to 4", "Racing", "E"])
        XCTAssertEqual(pages.last, .mac)
    }

    func testReportsPutThisMacsChipFirstAndSkipRowsWithNoFrameRate() {
        let tsv = "# notes\nMacBook Air\tM5\t24\t27.0\tswitch2mac\t60\t20.2\tfine\tissue\nMac mini\tM4\t16\t27\tnxnative\t\t\tno fps\tx\n"
            + "MacBook Pro\tM1 Pro\t32\t27\tnxnative 0123456789ab\t50\t\t\tx\nMacBook Pro\tM1 Max\t64\t26.6\tswitch2mac\t58.7\t20.1\tRaces\tplaytest\n"
        let rows = Booklet.reports(tsv: tsv, chip: "Apple M1 Max")
        XCTAssertEqual(rows.map(\.chip), ["M1 Max", "M1 Pro", "M5"], "the same chip, then its generation, then the rest; a row with no frame rate is left out")
        XCTAssertEqual(rows[1].build, "nxnative", "the commit after a build's name is dropped")
        let pages = Booklet.pages(nil, controls: [("Move", "W A S D")], reports: rows)
        XCTAssertEqual(pages.count, 5)   // cover, no shop text, controls, how it ran, your Mac
        XCTAssertEqual(pages[3], .reports(rows))
    }

    func testTheControlsPageNamesTheKeysThePlayerSet() {
        let defaults = UserDefaults(suiteName: "booklet-controls-test")!; defaults.removePersistentDomain(forName: "booklet-controls-test")
        let rows = Booklet.controls(ControlLayout(defaults: defaults))
        XCTAssertEqual(rows[0].1, "W A S D")
        XCTAssertEqual(rows[2].1, "J  ·  K")
    }

    func testAGameTheListDoesNotKnowSaysSo() {
        XCTAssertEqual(Booklet.pages(nil), [.cover, .empty("The shop's list has no pages for this game."), .mac])
        XCTAssertEqual(Booklet.pages(GameInfo(), loading: true)[1], .empty("Fetching this game's pages…"))
    }

    func testTheShopTextIsTheGamesOwnProductAndGamesOnly() throws {
        let json = """
        {"1": {"id": "0100ABCD01234000", "name": "Game Deluxe Bundle", "nsuId": 2, "bannerUrl": "https://x/b.jpg", "description": "The bundle."},
         "2": {"id": "0100ABCD01234000", "name": "Game", "nsuId": 1, "bannerUrl": "https://x/a.jpg", "description": "The game.", "intro": 5,
               "publisher": "P", "releaseDate": 20240102, "numberOfPlayers": 2, "category": ["Action"], "rating": 13},
         "3": {"id": "0100ABCD01235001", "name": "Game DLC", "description": "Add-on."},
         "4": {"id": "0100EEEE00000000", "name": "No text"}}
        """
        let products = Array(try JSONDecoder().decode([String: BannerPick.Product].self, from: Data(json.utf8)).values)
        let info = BannerPick.info(products)
        XCTAssertEqual(Array(info.keys), ["0100ABCD01234000"])
        let game = try XCTUnwrap(info["0100ABCD01234000"])
        XCTAssertEqual(game.description, "The game.")
        XCTAssertEqual(game.intro, "", "a field of the wrong type is left out")
        XCTAssertEqual([game.publisher, game.rating, game.released], ["P", "Ages 13 and up", "2 January 2024"])
        XCTAssertEqual(ArtworkStore.infoShard("0100abcd01234000"), "AB")
    }
}
