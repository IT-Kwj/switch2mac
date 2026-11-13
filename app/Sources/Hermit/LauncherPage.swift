import SwiftUI
import NXCore

enum LauncherPage: String, CaseIterable {
    case library, builds, whatsNew, performance, settings
    /// The tabs in the header. Builds has none: + Build game opens it (and shows a running build).
    static let tabs: [LauncherPage] = [.library, .whatsNew, .performance, .settings]
    var symbol: String {
        switch self {
        case .library: return "gamecontroller"
        case .builds: return "shippingbox"
        case .whatsNew: return "sparkles"
        case .performance: return "gauge.with.dots.needle.67percent"
        case .settings: return "slider.horizontal.3"
        }
    }
}

/// The library's console filter: every game, or only Switch games, or only Switch 2 games. Remembered between launches; shown only while the library holds
/// games of both. A Switch 2 dump (a game folder or a .nup) is a Switch 2 game whatever its title ID: a Switch 2 Edition keeps its Switch game's ID
/// (Pokémon Legends: Z-A Switch 2 Edition, 0100F43008C44000). Otherwise the title ID says it: 04… Switch 2, 01… Switch.
enum ConsoleFilter: String, CaseIterable, Identifiable {
    case all, switch1, switch2
    var id: String { rawValue }
    var labelKey: String { "filter.console." + rawValue }

    static func console(of game: LibraryGame) -> ConsoleFilter {
        if game.inputs[GameLibrary.folderInput] != nil || game.titleID.hasPrefix("04") { return .switch2 }
        return .switch1
    }
    func includes(_ game: LibraryGame) -> Bool { self == .all || Self.console(of: game) == self }
    /// Whether the filter is worth showing: the library has games of both consoles.
    static func mixed(_ games: [LibraryGame]) -> Bool { Set(games.map(console(of:))).count > 1 }

    static func load(_ defaults: UserDefaults = .standard) -> ConsoleFilter {
        ConsoleFilter(rawValue: defaults.string(forKey: "libraryConsole") ?? "") ?? .all
    }
    func save(_ defaults: UserDefaults = .standard) { defaults.set(rawValue, forKey: "libraryConsole") }
}

/// The library's filter: every game in the games folder, or only those with a build. Remembered between launches.
enum LibraryFilter: String, CaseIterable, Identifiable {
    case owned, built
    var id: String { rawValue }
    var labelKey: String { "filter." + rawValue }

    /// Owned shows every game without reading its build, so the default filter costs nothing per card.
    func includes(_ game: LibraryGame) -> Bool { self == .owned || game.isReady || game.hasIOSBuild }

    static func load(_ defaults: UserDefaults = .standard) -> LibraryFilter {
        LibraryFilter(rawValue: defaults.string(forKey: "libraryFilter") ?? "") ?? .owned
    }
    func save(_ defaults: UserDefaults = .standard) { defaults.set(rawValue, forKey: "libraryFilter") }

    /// The selection and the controller's focus after a switch to this filter. A selected game the filter hides gives way to the
    /// first one it shows, and a focus on a hidden card is dropped, so neither the hero nor the A button reaches a game that is not
    /// on screen.
    func reconcile(games: [LibraryGame], selectedID: UUID?, focused: String?) -> (selectedID: UUID?, focused: String?) {
        Self.reconcile(games: games, selectedID: selectedID, focused: focused, shows: includes)
    }
    /// The same for any test of which games are on screen (the build filter and the console filter together).
    static func reconcile(games: [LibraryGame], selectedID: UUID?, focused: String?, shows: (LibraryGame) -> Bool) -> (selectedID: UUID?, focused: String?) {
        let shown = games.filter(shows)
        let selection = shown.contains { $0.id == selectedID } ? selectedID : shown.first?.id
        guard let focused, focused.hasPrefix("card.") else { return (selection, focused) }
        return (selection, shown.contains { "card." + $0.id.uuidString == focused } ? focused : nil)
    }
}
