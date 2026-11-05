import XCTest
@testable import NXCore
@testable import NXLauncher

/// Swedish, German and French as short names for the tests. The app has no such constants: its languages are the files in `frontend/l10n`.
extension Lang {
    static let sv = Lang("sv")
    static let de = Lang("de")
    static let fr = Lang("fr")
}

/// The language list comes from the files: the picker, the device detection and the names.
final class LanguageListTests: IsolatedDefaultsTestCase {
    private var temporary: URL!

    override func setUpWithError() throws {
        temporary = FileManager.default.temporaryDirectory.appendingPathComponent("nxnative-l10n-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: temporary, withIntermediateDirectories: true)
    }

    override func tearDownWithError() throws { try FileManager.default.removeItem(at: temporary) }

    /// The folder of the real files, copied, so a test can add a file to it.
    private func copyOfTheFiles() throws -> URL {
        let real = try XCTUnwrap(LocalizationFiles.directory())
        for name in try FileManager.default.contentsOfDirectory(atPath: real.path) {
            try FileManager.default.copyItem(at: real.appendingPathComponent(name), to: temporary.appendingPathComponent(name))
        }
        return temporary
    }

    /// switch2mac is English only (l10n/en.json): the picker has "follow the system" and English.
    func testThePickerListsEnglishOnly() {
        XCTAssertEqual(AppCard.languageCodes, ["", "en"])
        XCTAssertEqual(Lang.all.map(\.name), ["English"])
        XCTAssertEqual(Lang.all, [Lang.en])
    }

    func testFindKnowsACodeOnlyWhenAFileHasIt() {
        XCTAssertEqual(Lang.find("en"), .en)
        XCTAssertNil(Lang.find("sv"), "switch2mac has no Swedish file")
        XCTAssertNil(Lang.find(""))
        XCTAssertNil(Lang.find("xx"))
        XCTAssertNil(Lang.find("SV"))
    }

    /// switch2mac: with English the only file, every device language is English.
    func testTheDeviceLanguageIsEnglishWhateverItIs() {
        let inputs: [[String]] = [
            [], ["en-US"], ["en"], ["EN-gb"], ["zh-Hans-CN"], ["zh-Hant-TW"], ["zh-HK"], ["ZH"], ["sv-SE"], ["sv"], ["SV-fi"], ["de-DE"], ["de-AT"],
            ["de-CH"], ["fr-FR"], ["fr-CA"], ["fr"], ["ja-JP"], ["pt-BR"], ["es-419"], ["it-IT"], ["ko-KR"], ["da-DK"], ["nb-NO"], ["fi-FI"],
            ["en-US", "zh-Hans"], ["ja-JP", "de-DE"], ["de-DE", "en-US"], ["fr-FR", "sv-SE"], [""], ["x"], ["fry-NL"],
        ]
        let languages = LocalizationFiles.languages()
        for preferred in inputs { XCTAssertEqual(Lang.detect(preferred: preferred, among: languages), .en, "\(preferred)") }
    }

    func testEveryFileSelectsItsOwnLanguageByItsCode() {
        for lang in Lang.all {
            for locale in lang.locales {
                XCTAssertEqual(Lang.detect(preferred: [locale + "-XX"], among: LocalizationFiles.languages()), lang, locale)
            }
        }
    }

    func testASixthLanguageIsOneNewFileAndNothingElse() throws {
        let folder = try copyOfTheFiles()
        let file = """
        {
          "_language": { "name": "Xenia", "locales": ["xx", "xenian"] },
          "onboarding.start": "Go"
        }
        """
        try Data(file.utf8).write(to: folder.appendingPathComponent("xx.json"))
        // The folder is found the way the app finds it: from NX_L10N_DIR.
        XCTAssertEqual(LocalizationFiles.directory(environment: ["NX_L10N_DIR": folder.path])?.path, folder.path)
        let languages = LocalizationFiles.languages(from: folder)
        // It is in the picker, after English (switch2mac's one file), and shows its own name.
        XCTAssertEqual(languages.map(\.code), ["en", "xx"])
        XCTAssertEqual(AppCard.languageCodes(among: languages), ["", "en", "xx"])
        XCTAssertEqual(languages.last?.name, "Xenia")
        // The device language selects it by its prefix, and the others still select theirs.
        XCTAssertEqual(Lang.detect(preferred: ["xx-YY"], among: languages), Lang("xx"))
        XCTAssertEqual(Lang.detect(preferred: ["xenian"], among: languages), Lang("xx"))
        XCTAssertEqual(Lang.detect(preferred: ["de-DE"], among: languages), .en)
        XCTAssertEqual(Lang.detect(preferred: ["ja-JP"], among: languages), .en)
        // Its texts are read, and a key it lacks is not in its catalog (the lookup then shows English).
        let catalogs = LocalizationFiles.load(from: folder)
        XCTAssertEqual(catalogs["xx"]?["onboarding.start"], "Go")
        XCTAssertNil(catalogs["xx"]?["onboarding.later"])
        XCTAssertNotNil(catalogs["en"]?["onboarding.later"])
        XCTAssertEqual(catalogs.keys.sorted(), ["en", "xx"])
    }

    func testAFileWithoutALanguageEntryStillWorks() throws {
        try Data("{\"a\": \"b\"}".utf8).write(to: temporary.appendingPathComponent("yy.json"))
        let found = try XCTUnwrap(LocalizationFiles.languages(from: temporary).first)
        XCTAssertEqual(found, LocalizationFiles.Language(code: "yy", name: "yy", locales: ["yy"], order: nil))
    }

    func testLanguagesWithoutAnOrderComeAfterThoseWithOneByCode() throws {
        for (code, order) in [("bb", "\"order\": 9, "), ("aa", ""), ("cc", ""), ("dd", "\"order\": 1, ")] {
            let body = "{\"_language\": {\(order)\"name\": \"\(code)\", \"locales\": [\"\(code)\"]}}"
            try Data(body.utf8).write(to: temporary.appendingPathComponent("\(code).json"))
        }
        XCTAssertEqual(LocalizationFiles.languages(from: temporary).map(\.code), ["dd", "bb", "aa", "cc"])
    }
}
