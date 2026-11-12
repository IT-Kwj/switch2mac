import AppKit

// While a game Hermit started is running and Hermit stays open behind it ("Come back after" or "Stay open"), the Library's pictures and 3D
// scene are let go: the banners and box fronts (read again in the background when Hermit comes back to the front), the 3D cases' pictures, the
// cover cuts and the background glows. The same happens when macOS reports memory pressure while Hermit is in the background. Nothing the player
// chose is lost; coming back costs a moment of loading.
@MainActor enum MemoryTrim {
    static let didTrim = Notification.Name("io.github.azmasm.hermit.memoryTrim")
    /// Pictures were let go and are not read again yet.
    private(set) static var trimmed = false
    private static var pressure: DispatchSourceMemoryPressure?

    /// Lets the pictures go (once until `restored`).
    static func trim() {
        guard !trimmed else { return }
        trimmed = true
        CaseArt.purge(); CoverArt.purge(); AmbientGlow.purge(); ArtworkLoader.shared.purge()
        NotificationCenter.default.post(name: didTrim, object: nil)
    }

    /// The Library read its pictures again.
    static func restored() { trimmed = false }

    /// A game started from Hermit: trim once it is in front (Hermit is then in the background).
    static func gameStarted() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { if !NSApp.isActive { trim() } }
    }

    /// macOS's memory pressure signal (free until raised): trim when it comes while Hermit is in the background.
    static func watchPressure() {
        guard pressure == nil else { return }
        let s = DispatchSource.makeMemoryPressureSource(eventMask: [.warning, .critical], queue: .main)
        s.setEventHandler { MainActor.assumeIsolated { if !NSApp.isActive { trim() } } }
        s.resume(); pressure = s
    }
}
