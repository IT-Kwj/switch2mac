import XCTest
@testable import Hermit
@testable import NXCore
@testable import NXLauncher

/// The Controls page's layout and the DM_KEYMAP / DM_PAD_MAP it passes (read by dm/host/input_map.h).
final class ControlsTests: IsolatedDefaultsTestCase {
    private var defaults: UserDefaults!
    private let suite = "nxnative-controls-tests"

    override func setUp() {
        defaults = UserDefaults(suiteName: suite)
        defaults.removePersistentDomain(forName: suite)
    }

    override func tearDown() { defaults.removePersistentDomain(forName: suite) }

    private func fn(_ id: String) -> ControlLayout.Function { ControlLayout.functions.first { $0.id == id }! }

    func testDefaultsPassNothing() {
        let layout = ControlLayout(defaults: defaults)
        XCTAssertTrue(layout.isDefault)
        XCTAssertEqual(layout.environment, [:])
        XCTAssertEqual(layout.key(fn("A")), 38)
        XCTAssertNil(layout.key(fn("RUp")))
    }

    func testAssigningAnotherFunctionsKeyLeavesThatFunctionOnNone() {
        let layout = ControlLayout(defaults: defaults)
        layout.assign(fn("A"), key: 40)   // K, B's key
        XCTAssertEqual(layout.key(fn("A")), 40)
        XCTAssertNil(layout.key(fn("B")))
        XCTAssertEqual(layout.environment, ["DM_KEYMAP": "A=40,B=none"])
        layout.assign(fn("B"), key: 38)   // and B to J: a swap
        XCTAssertEqual(layout.environment, ["DM_KEYMAP": "A=40,B=38"])
    }

    func testMovingBackToTheDefaultKeyDropsTheEntry() {
        let layout = ControlLayout(defaults: defaults)
        layout.assign(fn("RUp"), key: 126)   // ↑, the D-pad's
        XCTAssertEqual(layout.environment, ["DM_KEYMAP": "RUp=126,Up=none"])
        layout.assign(fn("Up"), key: 126)
        XCTAssertTrue(layout.isDefault, "RUp lost ↑ and is back on no key, its default")
    }

    func testControllerButtonsAndPersistence() {
        let layout = ControlLayout(defaults: defaults)
        layout.setSends("A", "B"); layout.setSends("B", "A"); layout.setSends("Minus", "none")
        layout.assign(fn("Shake"), key: nil)
        XCTAssertEqual(layout.environment, ["DM_KEYMAP": "Shake=none", "DM_PAD_MAP": "A=B,B=A,Minus=none"])
        XCTAssertEqual(layout.changeCount, 4)
        let reloaded = ControlLayout(defaults: defaults)
        XCTAssertEqual(reloaded.environment, layout.environment)
        reloaded.setSends("A", "A")
        XCTAssertEqual(reloaded.environment["DM_PAD_MAP"], "B=A,Minus=none")
        reloaded.resetKeyboard(); reloaded.resetController()
        XCTAssertTrue(ControlLayout(defaults: defaults).isDefault)
    }

    func testEveryFunctionHasALabelAndTheDefaultKeysAreDistinct() {
        let keys = ControlLayout.functions.compactMap(\.defaultKey)
        XCTAssertEqual(Set(keys).count, keys.count)
        for f in ControlLayout.functions { XCTAssertNotNil(L10n.table["controls.fn." + f.id], f.id) }
        XCTAssertEqual(ControlLayout.keyName(49), "Space")
        XCTAssertEqual(ControlLayout.keyName(126), "↑")
        // switch2mac is English only: the names come from en.json
        let en = { (k: String) in L10n.string(k, .en) }
        XCTAssertEqual(ControlLayout.keyName(49, en), "Space")
        XCTAssertEqual(ControlLayout.keyName(83, en), "Keypad 1")
        XCTAssertEqual(ControlLayout.keyName(0, en), "A", "a letter stays a letter")
        XCTAssertEqual(ControlLayout.keyName(200, en), "Key 200")
    }
}

final class StageNameTests: IsolatedDefaultsTestCase {
    /// switch2mac is English only: the names are en.json's (which a test with a stand-in lookup shows are looked up, not passed through).
    func testTheScriptsStageNamesAreShownInTheLaunchersLanguage() {
        let en = { (k: String) in L10n.string(k, .en) }
        let marked = { (k: String) in L10n.table[k].map { "<" + $0.en + ">" } ?? k }
        XCTAssertEqual(Stage.localizedName("Mac shaders", en), "Mac shaders")
        XCTAssertEqual(Stage.localizedName("Mac shaders", marked), "<Mac shaders>")
        XCTAssertEqual(Stage.localizedName("survey: code modules", marked), "<survey: code modules>")
        XCTAssertEqual(Stage.localizedName("extract v1.2.0", marked), "<extract v1.2.0>", "the version is kept")
        XCTAssertEqual(Stage.localizedName("Vulkan shader capture", marked), "<Vulkan shader capture>")
        XCTAssertEqual(Stage.localizedName("a stage added later", marked), "a stage added later", "an unknown name stays as the script wrote it")
        XCTAssertEqual(Stage.localizedName("Mac app", { $0 }), "Mac app")
    }

    /// A Switch 2 game folder packs its versions (pack_dump.py), a NUP unpacks them (pack_nup.py): build_ipa_from_nsp.py's
    /// stages "pack v458752", "pack DLC" and "unpack v196608" were shown in English in every language (#445).
    func testTheGameFolderStagesAreShownInTheLaunchersLanguage() {
        let marked = { (k: String) in L10n.table[k].map { "<" + $0.en + ">" } ?? k }   // switch2mac is English only
        XCTAssertEqual(Stage.localizedName("pack v458752", marked), "<pack v458752>")
        XCTAssertEqual(Stage.localizedName("pack DLC", marked), "<pack DLC>", "the DLC stage is its own row, not pack of \"DLC\"")
        XCTAssertEqual(Stage.localizedName("unpack v196608", marked), "<unpack v196608>")
        for lang in Lang.all {
            for key in ["stage.pack", "stage.pack_dlc", "stage.unpack"] { XCTAssertNotEqual(L10n.string(key, lang), key, "\(key) in \(lang)") }
        }
    }
}
