import XCTest
@testable import Switch2Mac

/// MacNativeGames' apps carry no DMTitleID: the game pages' "app_ids" name their game, so the Library shows them as built.
final class OtherBuilderAppsTests: XCTestCase {
    private var dir: URL!
    override func setUpWithError() throws {
        dir = FileManager.default.temporaryDirectory.appendingPathComponent("s2m-other-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: dir.appendingPathComponent("games/totk"), withIntermediateDirectories: true)
        try Data(#"{"title_id": "0100f2c0115b6000", "name": "The Legend of Zelda: Tears of the Kingdom", "builds": [{"id": "macnativegames", "app_ids": ["org.macnativegames.totk"]}, {"id": "nxnative"}]}"#.utf8)
            .write(to: dir.appendingPathComponent("games/totk/game.json"))
    }
    override func tearDownWithError() throws { try? FileManager.default.removeItem(at: dir) }

    func testAppIDsMapToTheirGame() {
        let table = OtherBuilderApps.load(repo: dir.path)
        XCTAssertEqual(table["org.macnativegames.totk"], .init(titleID: "0100F2C0115B6000", name: "The Legend of Zelda: Tears of the Kingdom"))
        XCTAssertEqual(table.count, 1, "a build without app_ids adds nothing")
        XCTAssertTrue(OtherBuilderApps.load(repo: dir.appendingPathComponent("none").path).isEmpty)
    }

    func testAnAppWithoutDMTitleIDAndUnknownBundleIsNotAGame() throws {
        let app = dir.appendingPathComponent("Other.app")
        try FileManager.default.createDirectory(at: app.appendingPathComponent("Contents/MacOS"), withIntermediateDirectories: true)
        let plist: [String: Any] = ["CFBundleIdentifier": "com.example.notagame", "CFBundleExecutable": "Other"]
        try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0).write(to: app.appendingPathComponent("Contents/Info.plist"))
        FileManager.default.createFile(atPath: app.appendingPathComponent("Contents/MacOS/Other").path, contents: Data(), attributes: [.posixPermissions: 0o755])
        XCTAssertThrowsError(try MacGameBundle.read(app))
    }
}
