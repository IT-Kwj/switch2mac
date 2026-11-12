import Foundation

/// Play opens the game's launch settings first: the player sets resolution, upscaler, frame generation and the rest before the game starts, instead of
/// changing them in the game (key 2), quitting and starting it again. On by default; the switch is in the sheet itself and in Settings › App.
package enum PlayFirst {
    package static let defaultsKey = "showSettingsBeforePlay"
    package static var on: Bool { UserDefaults.standard.object(forKey: defaultsKey) as? Bool ?? true }
}
