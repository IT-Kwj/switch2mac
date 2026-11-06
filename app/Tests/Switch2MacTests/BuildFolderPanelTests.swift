import AppKit
import XCTest
import UniformTypeIdentifiers
@testable import Switch2Mac

/// The Build tab's Save to dialog must offer "New Folder": the folder for the IPA often does not exist yet (#477).
@MainActor final class BuildFolderPanelTests: IsolatedDefaultsTestCase {
    func testTheSaveToPanelCanCreateFolders() {
        let panel = LauncherStores.buildFolderPanel()
        XCTAssertTrue(panel.canCreateDirectories)
        XCTAssertTrue(panel.canChooseDirectories)
        XCTAssertFalse(panel.canChooseFiles)
    }

    /// The Build page's dump: a folder, or a .nup file (switch2mac.py reads it, the nxnative-based builds open it).
    func testTheDumpPanelTakesFoldersAndNupFiles() {
        let panel = LauncherStores.dumpPanel()
        XCTAssertTrue(panel.canChooseDirectories)
        XCTAssertTrue(panel.canChooseFiles)
        XCTAssertTrue(panel.allowedContentTypes.contains { $0.preferredFilenameExtension == "nup" })
    }
}
