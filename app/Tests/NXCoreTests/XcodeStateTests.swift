import XCTest
@testable import NXCore

/// An App Store download that was never opened leaves `xcode-select -p` on CommandLineTools.
/// The Xcode row has to say that, and offer the one-click switch, instead of "no iOS SDK".
final class XcodeStateTests: XCTestCase {
    func testXcodeSelectedWithTheSDKIsReady() {
        XCTAssertEqual(Toolchain.xcodeState(selected: "/Applications/Xcode.app/Contents/Developer",
                                             xcodeApp: "/Applications/Xcode.app", iosSDK: true), .ready)
    }

    func testXcodeSelectedWithoutTheIOSPlatformAsksForTheDownload() {
        XCTAssertEqual(Toolchain.xcodeState(selected: "/Applications/Xcode.app/Contents/Developer",
                                             xcodeApp: "/Applications/Xcode.app", iosSDK: false),
                       .noIOSSDK(selected: "/Applications/Xcode.app/Contents/Developer"))
    }

    func testCommandLineToolsSelectedWhileXcodeIsInstalledIsItsOwnState() {
        XCTAssertEqual(Toolchain.xcodeState(selected: "/Library/Developer/CommandLineTools",
                                             xcodeApp: "/Applications/Xcode.app", iosSDK: false),
                       .commandLineToolsOnly(xcode: "/Applications/Xcode.app"))
    }

    func testNothingInstalled() {
        XCTAssertEqual(Toolchain.xcodeState(selected: nil, xcodeApp: nil, iosSDK: false), .notInstalled)
    }

    func testACommandLineToolsThatAnswersTheSDKIsUsable() {
        XCTAssertEqual(Toolchain.xcodeState(selected: "/Library/Developer/CommandLineTools",
                                             xcodeApp: nil, iosSDK: true), .ready)
    }

    /// switch2mac is English only (l10n/en.json).
    func testTheTwoXcodeStringsHaveTheirEnglishText() {
        for key in ["dep.xcode.notSelected", "dep.xcode.fix"] {
            let row = L10n.table[key]
            XCTAssertNotNil(row, key)
            XCTAssertFalse(row?.en.isEmpty ?? true, key)
        }
    }
}
