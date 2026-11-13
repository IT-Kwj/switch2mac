import AppKit
import UserNotifications

// While a game Hermit started is running and "Close while you play" is off, Hermit watches whether the Mac is struggling: macOS's own memory
// pressure signal (a dispatch source: it costs nothing until macOS raises it) and, every 30 seconds, the load average against the Mac's cores. When
// the Mac is short of memory, or busy beyond its cores for a minute, a notification offers to close Hermit until the game ends (the setting
// on, then ReturnAfterPlay.closeUntilQuit for the running game). It asks once per game session, and never again after "Don't ask again".

@MainActor final class PlayLoadWatcher {
    static let shared = PlayLoadWatcher()
    nonisolated static let category = "play-load"
    nonisolated static let acceptAction = "close-while-playing"
    nonisolated static let neverAction = "never-ask"
    nonisolated static let neverKey = "playLoadNeverAsk"

    private var pid: Int32?
    private var asked = false
    private var memory: DispatchSourceMemoryPressure?
    private var timer: Timer?
    private var busyChecks = 0

    /// A game Hermit started is running (its process ID).
    func start(pid: Int32) {
        guard !ReturnAfterPlay.closeWhilePlaying, !UserDefaults.standard.bool(forKey: Self.neverKey), Bundle.main.bundleURL.pathExtension == "app" else { return }
        stop()
        if UNUserNotificationCenter.current().delegate == nil { UNUserNotificationCenter.current().delegate = BuildNotifier.shared }   // its answer comes back here
        self.pid = pid; asked = false; busyChecks = 0
        let m = DispatchSource.makeMemoryPressureSource(eventMask: [.warning, .critical], queue: .main)
        m.setEventHandler { [weak self] in MainActor.assumeIsolated { self?.strained("memory") } }
        m.resume(); memory = m
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { [weak self] _ in MainActor.assumeIsolated { self?.checkLoad() } }
        timer?.tolerance = 10   // macOS may group it with other wake-ups
    }

    /// The game ended (or Hermit is closing): nothing more to watch.
    func stop() {
        memory?.cancel(); memory = nil
        timer?.invalidate(); timer = nil
        pid = nil
    }

    /// Busy beyond its cores for two checks in a row (a minute): the one-minute load average above the number of cores.
    private func checkLoad() {
        var load = [Double](repeating: 0, count: 3)
        guard getloadavg(&load, 3) > 0 else { return }
        busyChecks = Self.isBusy(load[0], cores: ProcessInfo.processInfo.activeProcessorCount) ? busyChecks + 1 : 0
        if busyChecks >= 2 { strained("load") }
    }

    nonisolated static func isBusy(_ load: Double, cores: Int) -> Bool { load > Double(max(cores, 1)) }

    private func strained(_ why: String) {
        guard pid != nil, !asked, !ReturnAfterPlay.closeWhilePlaying else { return }
        asked = true
        let center = UNUserNotificationCenter.current()
        let accept = UNNotificationAction(identifier: Self.acceptAction, title: "Close Hermit while I play", options: [])
        let never = UNNotificationAction(identifier: Self.neverAction, title: "Don't ask again", options: [])
        center.setNotificationCategories([UNNotificationCategory(identifier: Self.category, actions: [accept, never], intentIdentifiers: [], options: [])])
        center.requestAuthorization(options: [.alert, .sound]) { granted, _ in
            guard granted else { return }
            let content = UNMutableNotificationContent()
            content.title = why == "memory" ? "Your Mac is short of memory" : "Your Mac is working hard"
            content.body = "Hermit can close while you play, so the game gets everything, and open again when the game ends. Click to have Hermit close while you play."
            content.categoryIdentifier = Self.category
            center.add(UNNotificationRequest(identifier: "play-load", content: content, trigger: nil))
        }
    }

    /// The notification's answer (BuildNotifier, the notification delegate): clicked or "Close Hermit while I play" turns the setting on and closes
    /// Hermit until the running game ends; "Don't ask again" stops these prompts for good.
    func answered(_ action: String) {
        if action == Self.neverAction { UserDefaults.standard.set(true, forKey: Self.neverKey); stop(); return }
        guard action == Self.acceptAction || action == UNNotificationDefaultActionIdentifier else { return }
        UserDefaults.standard.set(true, forKey: ReturnAfterPlay.closeKey)
        if let pid, kill(pid, 0) == 0 { ReturnAfterPlay.closeUntilQuit(pid: pid) }
        stop()
    }
}
