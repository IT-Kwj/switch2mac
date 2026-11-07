import SwiftUI
import NXCore
import NXLauncher

/// The terminal switches run before any window exists: `--install-shell` is the shell install of Route C without the GUI
/// (ShellInstall.swift). Everything else starts the app.
@main
enum Entry {
    static func main() {
        if CommandLine.arguments.contains("--install-shell") {
            exit(ShellCLI.run(Array(CommandLine.arguments.dropFirst())))
        }
        // A shared app's folder that an older version made inside the output folder moves to Application Support once (#427).
        // Here and not in the stores: a test that builds the stores must never move a folder in the real home.
        ShellRootMigration.migrateSavedRoot()
        Switch2MacApp.main()
    }
}

struct Switch2MacApp: App {
    /// The window's first size: the original launcher's, 1640 × 995, made smaller only on a screen that cannot fit it (macOS remembers a size the player sets).
    static var startSize: CGSize {
        let f = NSScreen.main?.visibleFrame.size ?? CGSize(width: 1640, height: 995)
        return CGSize(width: min(1640, f.width - 40), height: min(995, f.height - 40))
    }
    @NSApplicationDelegateAdaptor private var delegate: AppDelegate
    @StateObject private var console = ConsoleCoordinator()

    var body: some Scene {
        WindowGroup("switch2mac") {
            if let name = ProcessInfo.processInfo.environment["S2M_ONBOARDING_DEMO"],
               let scenario = MockOnboardingDriver.Scenario(rawValue: name) {
                OnboardingDemoHost(scenario: scenario)
            } else if let scenario = ProcessInfo.processInfo.environment["S2M_CONSOLE_DEMO"].flatMap(MockConsoleDriver.Scenario.init(rawValue:)) {
                ConsoleDemoView(scenario: scenario)
            } else { RootView(console: console) }
        }
            .windowStyle(.hiddenTitleBar)
            .defaultSize(width: Self.startSize.width, height: Self.startSize.height)   // switch2mac: the original launcher's size, 1640 × 995
            .windowResizability(.automatic)
            .commands {
                // View → Console Mode. Command-Option-K: Control-Command-F is the system's full screen, and the others are taken by Find and Show Colors.
                CommandGroup(after: .toolbar) {
                    Button(L10n.string(console.active ? "console.menuLeave" : "console.entry", Lang.initial())) { console.toggle() }
                        .keyboardShortcut("k", modifiers: [.command, .option]).disabled(!console.available && !console.active)
                }
            }
    }
}

/// `swift run` starts a bare executable with no Info.plist, which macOS does not treat as a
/// regular app: no Dock icon, and the window can stay hidden behind the terminal. Inside the
/// .app bundle this changes nothing.
final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.setActivationPolicy(.regular)
        NSApp.activate(ignoringOtherApps: true)
        MemoryTrim.watchPressure()   // pictures let go under memory pressure while in the background (MemoryTrim.swift)
    }

    /// Closing the window quits the app, as players expect of a one-window app. While a game builds it stays open in the Dock
    /// instead, so the build finishes (its notification says when); clicking the Dock icon brings the window back.
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        !ProcessGroups.buildProcessesAlive
    }
}
