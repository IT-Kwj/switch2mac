import AppKit
import NXCore

/// Quitting while a game builds asks first. A quit ends the build's processes (ProcessGroups.endAll), and nothing said so: a build left
/// running overnight stopped at its last step when the app was quit and opened again. Keep building is the default button (Return), so a
/// quick ⌘Q, a script's quit or a logout does not end hours of work; the steps already done are kept either way (a new Build carries on).
enum QuitDuringBuild {
    /// The game being built, named in the question ("" when it is not known). Set where the build store is made (LauncherStores).
    static var gameName: () -> String = { "" }

    /// The answer to a quit: go ahead when no build runs, else what the player chose (`ask` true = quit and stop the build).
    static func reply(buildRunning: Bool, ask: () -> Bool) -> NSApplication.TerminateReply {
        guard buildRunning else { return .terminateNow }
        return ask() ? .terminateNow : .terminateCancel
    }

    /// The question, as a window-less alert: true when the player chose to quit and stop the build.
    @MainActor static func ask() -> Bool {
        let lang = Lang.initial(), name = gameName()
        let a = NSAlert()
        a.messageText = name.isEmpty ? L10n.string("quit.building.titleAny", lang) : String(format: L10n.string("quit.building.title", lang), name)
        a.informativeText = L10n.string("quit.building.body", lang)
        a.alertStyle = .warning
        a.addButton(withTitle: L10n.string("quit.building.keep", lang))   // the first button is the default
        a.addButton(withTitle: L10n.string("quit.building.quit", lang)).hasDestructiveAction = true
        NSApp.activate(ignoringOtherApps: true)
        return a.runModal() == .alertSecondButtonReturn
    }
}
