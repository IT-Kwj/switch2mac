import AppKit
import XCTest
@testable import Switch2Mac
@testable import NXCore
@testable import NXLauncher

/// When the launcher comes back to the front after a game it started quits. Nothing here touches NSWorkspace.
@MainActor final class ReturnAfterPlayTests: IsolatedDefaultsTestCase {
    func testComesBackForAGameItStarted() {
        let watcher = GameReturnWatcher(observesSystem: false)
        var forward = 0, quit = 0
        watcher.didStart(pid: 4242) { quit += 1 }
        XCTAssertTrue(watcher.quit(pid: 4242, enabled: true) { forward += 1 })
        XCTAssertEqual(quit, 1, "the caller's bookkeeping ran")
        XCTAssertEqual(forward, 1, "the launcher came forward")
        XCTAssertFalse(watcher.quit(pid: 4242, enabled: true) { forward += 1 }, "only once per start")
        XCTAssertEqual(forward, 1)
    }

    func testStaysPutForOtherProcesses() {
        let watcher = GameReturnWatcher(observesSystem: false)
        var forward = 0
        watcher.didStart(pid: 4242)
        XCTAssertFalse(watcher.quit(pid: 1, enabled: true) { forward += 1 }, "a process the launcher did not start (a game opened from Finder)")
        XCTAssertEqual(forward, 0)
    }

    func testSwitchedOffStillRunsTheBookkeeping() {
        let watcher = GameReturnWatcher(observesSystem: false)
        var forward = 0, quit = 0
        watcher.didStart(pid: 4242) { quit += 1 }
        XCTAssertTrue(watcher.quit(pid: 4242, enabled: false) { forward += 1 })
        XCTAssertEqual(quit, 1, "console mode still ends its Starting state")
        XCTAssertEqual(forward, 0, "switched off in Settings: the launcher stays where it is")
    }

    func testOnUntilSwitchedOff() {
        let saved = UserDefaults.standard.object(forKey: ReturnAfterPlay.defaultsKey)
        defer { UserDefaults.standard.set(saved, forKey: ReturnAfterPlay.defaultsKey) }
        UserDefaults.standard.removeObject(forKey: ReturnAfterPlay.defaultsKey)
        XCTAssertTrue(ReturnAfterPlay.enabled)
        UserDefaults.standard.set(false, forKey: ReturnAfterPlay.defaultsKey)
        XCTAssertFalse(ReturnAfterPlay.enabled)
    }

    /// switch2mac is English only (l10n/en.json).
    func testTheSettingHasItsEnglishText() {
        for key in ["settings.whilePlaying", "settings.whilePlaying.note"] {
            XCTAssertNotEqual(L10n.string(key, .en), key)
        }
    }

    /// "Close while you play" never closes during a build (it would stop) or outside an app bundle (nothing to reopen), and is off by default.
    func testCloseWhilePlayingOnlyFromAnAppAndNotDuringABuild() {
        XCTAssertFalse(ReturnAfterPlay.closeUntilQuit(pid: 1, bundle: URL(fileURLWithPath: "/usr/bin"), buildRunning: false))
        XCTAssertFalse(ReturnAfterPlay.closeUntilQuit(pid: 1, bundle: URL(fileURLWithPath: "/Applications/switch2mac.app"), buildRunning: true))
        XCTAssertTrue(ReturnAfterPlay.reopenScript.contains("\"$1\"") && ReturnAfterPlay.reopenScript.contains("\"$2\""), "the paths arrive as arguments")
    }

    /// "Close while you play" waits for the game's window: it closes only once the game has been in front with a window for the settle time,
    /// starts over when the window goes away (a full-screen animation), brings the game forward at the limit, and stays if the game quit.
    func testCloseWaitsUntilTheGameShows() {
        var t = ReturnAfterPlay.CloseTiming(settle: 1, limit: 10)
        XCTAssertEqual(t.next(alive: true, shown: false, elapsed: 0.5), .wait)
        XCTAssertEqual(t.next(alive: true, shown: true, elapsed: 3.0), .wait)
        XCTAssertEqual(t.next(alive: true, shown: false, elapsed: 3.5), .wait, "hidden again: the settle time starts over")
        XCTAssertEqual(t.next(alive: true, shown: true, elapsed: 4.0), .wait)
        XCTAssertEqual(t.next(alive: true, shown: true, elapsed: 4.5), .wait)
        XCTAssertEqual(t.next(alive: true, shown: true, elapsed: 5.0), .quit)

        var never = ReturnAfterPlay.CloseTiming(settle: 1, limit: 10)
        XCTAssertEqual(never.next(alive: true, shown: false, elapsed: 9.9), .wait)
        XCTAssertEqual(never.next(alive: true, shown: false, elapsed: 10.0), .bringGameThenQuit)

        var gone = ReturnAfterPlay.CloseTiming(settle: 1, limit: 10)
        XCTAssertEqual(gone.next(alive: false, shown: false, elapsed: 2), .stay)
    }

    /// The in-game offer counts the Mac busy only past its cores; the sounds and the offer have their texts and are on (sounds) / quiet (offer) by default.
    func testPlayLoadAndInterfaceSounds() {
        XCTAssertFalse(PlayLoadWatcher.isBusy(7.5, cores: 10)); XCTAssertTrue(PlayLoadWatcher.isBusy(10.5, cores: 10)); XCTAssertFalse(PlayLoadWatcher.isBusy(0.5, cores: 0))
        for key in ["settings.interfaceSounds", "settings.interfaceSoundsNote", "settings.whilePlaying", "settings.whilePlaying.note"] { XCTAssertNotEqual(L10n.string(key, .en), key) }
    }

    /// The interface sounds are made in code: each is a valid WAV of the right length that macOS can play, and the three ticks differ.
    func testInterfaceSoundsAreValidAudio() throws {
        for kind in [InterfaceSound.Kind.tick, .hover, .open] {
            let r = InterfaceSound.recipe(kind, variant: 0), d = InterfaceSound.wav(r)
            XCTAssertEqual(String(decoding: d.prefix(4), as: UTF8.self), "RIFF")
            XCTAssertEqual(d.count, 44 + Int(r.length * 44_100) * 2)
            let sound = try XCTUnwrap(NSSound(data: d)); XCTAssertEqual(sound.duration, r.length, accuracy: 0.005)
        }
        XCTAssertNotEqual(InterfaceSound.wav(InterfaceSound.recipe(.tick, variant: 0)), InterfaceSound.wav(InterfaceSound.recipe(.tick, variant: 1)))
    }

    /// While a game runs the Library lets its pictures go once, says so, and is marked to read them again when it comes back.
    @MainActor func testMemoryTrimLetsGoOnceAndIsRestored() {
        MemoryTrim.restored()   // another test's game start may have trimmed (the test runner is never in front)
        var told = 0
        let o = NotificationCenter.default.addObserver(forName: MemoryTrim.didTrim, object: nil, queue: nil) { _ in told += 1 }
        defer { NotificationCenter.default.removeObserver(o); MemoryTrim.restored() }
        MemoryTrim.trim(); MemoryTrim.trim()
        XCTAssertTrue(MemoryTrim.trimmed); XCTAssertEqual(told, 1, "once until restored")
        MemoryTrim.restored(); XCTAssertFalse(MemoryTrim.trimmed)
    }
}
