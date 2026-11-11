import AppKit
import XCTest
@testable import Switch2Mac

/// A quit while a game builds asks first; with no build it goes ahead without asking. The alert itself is not shown here.
final class QuitDuringBuildTests: XCTestCase {
    func testNoBuildQuitsWithoutAsking() {
        var asked = 0
        XCTAssertEqual(QuitDuringBuild.reply(buildRunning: false) { asked += 1; return false }, .terminateNow)
        XCTAssertEqual(asked, 0)
    }

    func testKeepBuildingCancelsTheQuit() {
        var asked = 0
        XCTAssertEqual(QuitDuringBuild.reply(buildRunning: true) { asked += 1; return false }, .terminateCancel)
        XCTAssertEqual(asked, 1)
    }

    func testQuitAndStopGoesAhead() {
        XCTAssertEqual(QuitDuringBuild.reply(buildRunning: true) { true }, .terminateNow)
    }
}
