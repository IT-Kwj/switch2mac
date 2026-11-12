import XCTest

/// The base of every test in this target. A test process shares one UserDefaults domain (`com.apple.dt.xctest.tool`), and the domain
/// outlives the run: a key one test wrote, or a killed run left behind, was read by the next test and the next run (a stale
/// `exportIPA` or a `repoPath` in a deleted folder failed the shell install tests).
///
/// - `testDefaults` is a suite of its own for the test, removed after it. A test hands it to `LauncherStores(defaults:)` and to every
///   store or helper that takes a `defaults`, so nothing reads or writes the shared domain.
/// - The shared domain is emptied once per process, so a leftover of an earlier run is gone before the first test.
/// - After each test the shared domain must be as it was before: a test that leaves a key there fails, and the key is put back.
/// - The preferences daemon can write a suite's file after the test removed it, so files of earlier runs are swept once per
///   process (`TestPreferenceFiles`): without it ~/Library/Preferences gathered thousands of them.
class IsolatedDefaultsTestCase: XCTestCase {
    /// The suite of this test, created on first use.
    var testDefaults: UserDefaults {
        if let suite = isolatedSuite { return suite.defaults }
        let name = TestPreferenceFiles.prefix + UUID().uuidString
        let defaults = UserDefaults(suiteName: name)!
        isolatedSuite = (name, defaults)
        return defaults
    }
    private var isolatedSuite: (name: String, defaults: UserDefaults)?

    /// The domain the process reads and writes through `UserDefaults.standard`.
    static var sharedDomain: String { Bundle.main.bundleIdentifier ?? ProcessInfo.processInfo.processName }

    private static let sharedDomainCleared: Void = {
        UserDefaults.standard.removePersistentDomain(forName: sharedDomain)
        TestPreferenceFiles.sweep()
    }()

    static func sharedKeys() -> [String: Any] { UserDefaults.standard.persistentDomain(forName: sharedDomain) ?? [:] }

    override func invokeTest() {
        _ = Self.sharedDomainCleared
        let before = Self.sharedKeys()
        isolatedSuite = nil
        super.invokeTest()
        if let suite = isolatedSuite {
            UserDefaults().removePersistentDomain(forName: suite.name)
            try? FileManager.default.removeItem(atPath: NSHomeDirectory() + "/Library/Preferences/\(suite.name).plist")   // no file per test
        }
        isolatedSuite = nil
        let after = Self.sharedKeys()
        let changed = Set(before.keys).union(after.keys).filter { !Self.same(before[$0], after[$0]) }.sorted()
        if !changed.isEmpty {
            XCTFail("\(name) left \(changed.joined(separator: ", ")) in the shared test defaults (\(Self.sharedDomain)). "
                    + "Give the store or helper `testDefaults`, or restore the key.")
            for key in changed { UserDefaults.standard.set(before[key], forKey: key) }   // the next test starts clean
        }
    }

    private static func same(_ a: Any?, _ b: Any?) -> Bool {
        switch (a, b) {
        case (nil, nil): return true
        case let (a?, b?): return (a as AnyObject).isEqual(b)
        default: return false
        }
    }
}

/// The guard's own tests: the suite is separate from the shared domain, and the shared domain starts empty.
final class SharedDefaultsGuardTests: IsolatedDefaultsTestCase {
    func testTheTestSuiteIsNotTheSharedDomain() {
        let before = Self.sharedKeys()
        testDefaults.set("somewhere", forKey: "repoPath")
        testDefaults.set(true, forKey: "exportIPA")
        XCTAssertEqual(testDefaults.string(forKey: "repoPath"), "somewhere")
        XCTAssertEqual(NSDictionary(dictionary: Self.sharedKeys()), NSDictionary(dictionary: before))
    }

    func testTheSharedDomainIsEmptyBeforeTheTest() {
        XCTAssertTrue(Self.sharedKeys().isEmpty, "left over: \(Self.sharedKeys().keys.sorted())")
    }
}

/// The preference files test suites leave behind. A run's own files are removed after each test; a file the daemon wrote late,
/// or one of a killed run, is removed by the next run once it is a few minutes old (a parallel run's live files are younger).
enum TestPreferenceFiles {
    static let prefix = "hermit-test-"
    /// The other names the app's test suites use (each followed by a UUID), and names earlier versions used.
    static let oldPrefixes = ["switch2mac-test-", "hermit-identity-tests-", "nxmodel-", "onboarding.tests.", "nspb-", "nx2apple-test-",
                              "org.nxnative.frontendtests.", "ConsoleLiveTests-", "ConsolePadTests.", "nxnative-tests-",
                              "engine-selection-", "uninstall-test-"]
    private static let uuid = try! NSRegularExpression(pattern: "[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}")

    /// A test suite's file: one of the names above with a UUID in it.
    static func isTestFile(_ name: String) -> Bool {
        name.hasSuffix(".plist") && ([prefix] + oldPrefixes).contains(where: { name.hasPrefix($0) })
            && uuid.firstMatch(in: name, range: NSRange(name.startIndex..., in: name)) != nil
    }

    static var folder: String { NSHomeDirectory() + "/Library/Preferences" }

    /// Removes test preference files older than `age` seconds; returns how many went.
    @discardableResult
    static func sweep(in folder: String = folder, olderThan age: TimeInterval = 600, now: Date = Date()) -> Int {
        let fm = FileManager.default
        guard let names = try? fm.contentsOfDirectory(atPath: folder) else { return 0 }
        var removed = 0
        for name in names where isTestFile(name) {
            let path = folder + "/" + name
            guard let date = (try? fm.attributesOfItem(atPath: path))?[.modificationDate] as? Date,
                  now.timeIntervalSince(date) > age else { continue }
            if (try? fm.removeItem(atPath: path)) != nil { removed += 1 }
        }
        return removed
    }
}

final class TestPreferenceFilesTests: XCTestCase {
    func testOnlyOldTestFilesAreSwept() throws {
        let fm = FileManager.default, dir = NSTemporaryDirectory() + "prefs-sweep-" + UUID().uuidString
        try fm.createDirectory(atPath: dir, withIntermediateDirectories: true)
        defer { try? fm.removeItem(atPath: dir) }
        let old = Date().addingTimeInterval(-3600)
        let id = "0B523C81-793A-4221-AE7F-F768992D39FD"
        for name in ["hermit-test-\(id).plist", "switch2mac-test-\(id).plist", "nxmodel-repo-tests-\(id).plist",
                     "io.github.azmasm.hermit.plist", "nxmodel-settings.plist"] {
            fm.createFile(atPath: dir + "/" + name, contents: Data())
            try fm.setAttributes([.modificationDate: old], ofItemAtPath: dir + "/" + name)
        }
        let fresh = "hermit-test-11111111-2222-3333-4444-555555555555.plist"
        fm.createFile(atPath: dir + "/" + fresh, contents: Data())   // a running test's file
        XCTAssertEqual(TestPreferenceFiles.sweep(in: dir), 3)
        XCTAssertEqual(Set(try fm.contentsOfDirectory(atPath: dir)), ["io.github.azmasm.hermit.plist", "nxmodel-settings.plist", fresh])
    }
}
