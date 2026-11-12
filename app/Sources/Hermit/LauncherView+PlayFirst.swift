import SwiftUI
import NXLauncher

extension LauncherView {
    /// Whether Play shows the game's settings first (PlayFirst): on, and its app lists settings to show (a MacNativeGames app or an older build lists none and starts at once).
    func showsSettingsFirst(_ game: LibraryGame) -> Bool {
        PlayFirst.on && !(LaunchSetting.forMac(app: game.appPath, titleID: game.titleID, repo: m.repo.path, labels: loc.t) ?? []).isEmpty
    }

    /// Play in the settings sheet: the sheet goes, then the game starts as Play would have started it.
    func playAfterOptions(_ id: UUID) {
        optionsFor = nil; optionsPlay = false
        guard let game = library.games.first(where: { $0.id == id }) else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { primaryAction(game, settingsShown: true) }
    }
}
