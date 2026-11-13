import XCTest
@testable import Hermit
@testable import NXLauncher

/// Play shows the game's settings first unless the player turned that off (PlayFirst): on when nothing was ever chosen.
final class PlayFirstTests: XCTestCase {
    func testOnUntilThePlayerTurnsItOff() {
        let d = UserDefaults.standard, key = PlayFirst.defaultsKey, was = d.object(forKey: key)
        defer { if let was { d.set(was, forKey: key) } else { d.removeObject(forKey: key) } }
        d.removeObject(forKey: key); XCTAssertTrue(PlayFirst.on, "a new player sees the settings before the first start")
        d.set(false, forKey: key); XCTAssertFalse(PlayFirst.on)
        d.set(true, forKey: key); XCTAssertTrue(PlayFirst.on)
    }
}
