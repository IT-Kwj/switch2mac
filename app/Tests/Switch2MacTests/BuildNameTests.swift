import XCTest
@testable import Switch2Mac

final class BuildNameTests: XCTestCase {
    func testTheOwnBuildIsNotNamedAfterTheApp() {
        XCTAssertEqual(BuildName.shown("switch2mac"), "azmasm's build")
        XCTAssertEqual(BuildName.row("switch2mac"), "azmasm's build")
    }

    func testOtherBuildsKeepTheirNames() {
        XCTAssertEqual(BuildName.shown("nxnative"), "nxnative")
        XCTAssertEqual(BuildName.row("nxnative"), "nxnative build")
        XCTAssertEqual(BuildName.row("mkw-neo"), "mkw-neo build")
    }
}
