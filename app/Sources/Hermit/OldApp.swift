import AppKit
import NXCore

// The app was called switch2mac. An installer's Hermit lands beside the old switch2mac.app, which nothing removes (the in-app update
// replaces it itself). Once, at Hermit's first start, the player is asked whether the old app may go to the Trash: asked, never done
// silently, and the Trash keeps it recoverable. Its folder and settings are Hermit's already (AppIdentity.migrate).
enum OldApp {
    static let askedKey = "hermit.oldAppAsked"

    /// The old app to offer: switch2mac.app with switch2mac's own identifier, beside Hermit or in an Applications folder. Never Hermit itself.
    static func find(beside current: URL = Bundle.main.bundleURL, home: String = NSHomeDirectory()) -> URL? {
        let dirs = [current.deletingLastPathComponent().path, "/Applications", home + "/Applications"]
        for dir in dirs {
            let app = URL(fileURLWithPath: dir).appendingPathComponent("switch2mac.app")
            guard app.standardizedFileURL != current.standardizedFileURL,
                  let info = NSDictionary(contentsOf: app.appendingPathComponent("Contents/Info.plist")),
                  info["CFBundleIdentifier"] as? String == AppIdentity.legacyBundleID else { continue }
            return app
        }
        return nil
    }

    /// Asks once (only the bundled Hermit app, never a test or swift run), and not while the old app is open.
    @MainActor static func offer(defaults: UserDefaults = .standard) {
        guard Bundle.main.bundleIdentifier == AppIdentity.bundleID, !defaults.bool(forKey: askedKey), let app = find() else { return }
        guard NSRunningApplication.runningApplications(withBundleIdentifier: AppIdentity.legacyBundleID).isEmpty else { return }   // asked at the next start
        defaults.set(true, forKey: askedKey)
        let alert = NSAlert()
        alert.messageText = "switch2mac is now Hermit"
        alert.informativeText = "Your library, settings, builds and saves are here in Hermit. The old switch2mac app is still in \(app.deletingLastPathComponent().lastPathComponent). Move it to the Trash?"
        alert.addButton(withTitle: "Move to Trash")
        alert.addButton(withTitle: "Keep It")
        if alert.runModal() == .alertFirstButtonReturn {
            do { try FileManager.default.trashItem(at: app, resultingItemURL: nil) }
            catch { NSLog("Hermit: could not move %@ to the Trash: %@", app.path, String(describing: error)) }
        }
    }
}
