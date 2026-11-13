import Foundation

/// The app's name and its own folder. The app was called switch2mac until it became Hermit: the repository is azmasm/hermit now, while
/// hermit.py and the "switch2mac" build id keep their names; the app, its bundle id and its folder are Hermit's.
package enum AppIdentity {
    package static let name = "Hermit"
    package static let bundleID = "io.github.azmasm.hermit"
    package static let legacyBundleID = "io.github.azmasm.switch2mac"
    /// The folder in ~/Library/Application Support (its copy of the code, build tools, engines, build leftovers, pictures, records).
    /// Hermit, or switch2mac's old name when that folder could not be moved (migrate), so the app keeps finding its files.
    nonisolated(unsafe) package private(set) static var folder = "Hermit"
    package static let legacyFolder = "switch2mac"
    package static func support(home: String = NSHomeDirectory()) -> String { home + "/Library/Application Support/" + folder }
    package static func legacySupport(home: String = NSHomeDirectory()) -> String { home + "/Library/Application Support/" + legacyFolder }

    /// Once, at the first start of Hermit: switch2mac's folder becomes Hermit's (moved, so nothing is copied twice), and a link with the
    /// old name points at it, so paths written by switch2mac (the Python venv's scripts, an older switch2mac app still installed) keep
    /// working. switch2mac's settings are copied into Hermit's (the old ones stay). Runs only from the bundled app, never in tests.
    package static func migrate(home: String = NSHomeDirectory(), defaults: UserDefaults = .standard) {
        let fm = FileManager.default, new = support(home: home), old = legacySupport(home: home)
        let oldIsLink = (try? fm.destinationOfSymbolicLink(atPath: old)) != nil
        if !fm.fileExists(atPath: new), fm.fileExists(atPath: old), !oldIsLink {
            do {
                try fm.moveItem(atPath: old, toPath: new)
                try? fm.createSymbolicLink(atPath: old, withDestinationPath: new)
            } catch {
                // left where it is, and used there: Hermit must not start empty beside the player's files
                NSLog("Hermit: could not move %@ to %@: %@", old, new, String(describing: error))
                folder = legacyFolder
            }
        }
        let flag = "hermit.migratedSettings"
        if !defaults.bool(forKey: flag) {
            if let oldDomain = defaults.persistentDomain(forName: legacyBundleID) {
                for (key, value) in oldDomain where defaults.object(forKey: key) == nil {
                    // saved paths into switch2mac's folder now point into Hermit's
                    if let s = value as? String, folder != legacyFolder, s.contains(old) { defaults.set(s.replacingOccurrences(of: old, with: new), forKey: key) }
                    else { defaults.set(value, forKey: key) }
                }
            }
            defaults.set(true, forKey: flag)
        }
    }
}
