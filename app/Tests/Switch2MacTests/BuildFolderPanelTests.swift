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

    /// A Switch 1 game: its .nsp / .nsz / .xci / .xcz files can be chosen too; the keys panel takes one file.
    func testTheDumpPanelTakesSwitch1FilesAndTheKeysPanelOneFile() {
        let exts = Set(LauncherStores.dumpPanel().allowedContentTypes.compactMap(\.preferredFilenameExtension))
        for e in ["nsp", "xci"] { XCTAssertTrue(exts.contains(e), e) }
        let keys = LauncherStores.keysPanel()
        XCTAssertTrue(keys.canChooseFiles); XCTAssertFalse(keys.canChooseDirectories); XCTAssertFalse(keys.allowsMultipleSelection)
    }
}
