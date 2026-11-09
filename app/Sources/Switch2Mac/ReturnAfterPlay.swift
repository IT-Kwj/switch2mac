import AppKit
import NXCore

// The launcher comes back to the front when a game it started quits. Play opens the game's own app and the
// launcher stayed wherever it was: after a session (often played with a controller) there was nothing in front to
// pick the next game with, and the launcher had to be found in the Dock. One watcher serves both ways of starting a
// game, the desktop Play button (LauncherView) and console mode (LiveConsoleDriver), so they behave the same: each
// registers the process it opened, by its process ID (an app opened from Finder is left alone), and one Settings
// switch (Settings > App) decides whether the launcher comes forward.

enum ReturnAfterPlay {
    static let defaultsKey = "returnAfterPlay"

    /// On unless switched off in Settings.
    static var enabled: Bool { UserDefaults.standard.object(forKey: defaultsKey) as? Bool ?? true }

    /// "Close while you play" (Settings > App): switch2mac quits once a game it started is running, so the game has the whole Mac, and a tiny
    /// waiter (a shell that checks every two seconds whether the game still runs) opens it again when the game closes. Off unless switched on.
    static let closeKey = "closeWhilePlaying"
    static var closeWhilePlaying: Bool { UserDefaults.standard.bool(forKey: closeKey) }

    /// The waiter: `$1` the game's process ID, `$2` this app. Both arrive as arguments, never spliced into the script.
    static let reopenScript = """
        while kill -0 "$1" 2>/dev/null; do sleep 2; done
        sleep 1
        exec /usr/bin/open "$2"
        """

    /// Quits switch2mac until the game `pid` closes, then it opens again. Not while a build runs (the build would stop), and only from an app
    /// bundle (under swift run there is nothing to reopen). Returns whether it is closing.
    @discardableResult
    static func closeUntilQuit(pid: Int32, bundle: URL = Bundle.main.bundleURL, buildRunning: Bool = ProcessGroups.buildProcessesAlive) -> Bool {
        guard bundle.pathExtension == "app", !buildRunning else { return false }
        let p = Process()
        p.executableURL = URL(fileURLWithPath: "/bin/sh")
        p.arguments = ["-c", reopenScript, "sh", String(pid), bundle.path]
        p.standardInput = FileHandle.nullDevice; p.standardOutput = FileHandle.nullDevice; p.standardError = FileHandle.nullDevice
        guard (try? p.run()) != nil else { return false }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { NSApp.terminate(nil) }   // the game is open by now; the waiter outlives this app
        return true
    }

    /// The launcher's windows forward: unhidden, active, its main window in front.
    static func bringForward() {
        NSApp.unhide(nil)
        NSApp.activate(ignoringOtherApps: true)
        NSApp.windows.first { $0.canBecomeMain }?.makeKeyAndOrderFront(nil)
    }
}

/// The games the launcher started, by process ID, and what each start wants done when its game quits.
@MainActor final class GameReturnWatcher {
    static let shared = GameReturnWatcher()
    private var started: [Int32: () -> Void] = [:]
    private var observer: NSObjectProtocol?
    private let observesSystem: Bool

    /// `observesSystem` false: no NSWorkspace observer, `quit(pid:)` is called by hand (the tests).
    init(observesSystem: Bool = true) { self.observesSystem = observesSystem }

    /// Called once the game's app has been opened; `onQuit` is the caller's own bookkeeping (console mode ends its
    /// Starting state there), run whether or not the launcher comes forward.
    func didStart(pid: Int32, onQuit: @escaping () -> Void = {}) {
        started[pid] = onQuit
        if observesSystem, ReturnAfterPlay.closeWhilePlaying, ReturnAfterPlay.closeUntilQuit(pid: pid) { return }
        if observesSystem { PlayLoadWatcher.shared.start(pid: pid); MemoryTrim.gameStarted() }   // PlayLoad.swift, MemoryTrim.swift   // offers to close if the Mac struggles while it runs (PlayLoad.swift)
        guard observesSystem, observer == nil else { return }
        observer = NSWorkspace.shared.notificationCenter.addObserver(forName: NSWorkspace.didTerminateApplicationNotification,
                                                                     object: nil, queue: .main) { [weak self] note in
            let pid = (note.userInfo?[NSWorkspace.applicationUserInfoKey] as? NSRunningApplication)?.processIdentifier
            MainActor.assumeIsolated { if let pid { self?.quit(pid: pid) } }
        }
    }

    /// A process quit. Returns whether it was a game the launcher started: its `onQuit` ran, and the launcher came
    /// forward if the switch is on.
    @discardableResult
    func quit(pid: Int32, enabled: Bool = ReturnAfterPlay.enabled, bringForward: () -> Void = ReturnAfterPlay.bringForward) -> Bool {
        guard let onQuit = started.removeValue(forKey: pid) else { return false }
        if observesSystem { PlayLoadWatcher.shared.stop() }
        onQuit()
        if enabled { bringForward() }
        return true
    }
}
