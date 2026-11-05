import AppKit
import SwiftUI
import NXLauncher
import NXModel

// The What's New page (WhatsNew.swift): your games against their newest builds first, with what changed since yours and Rebuild; then
// new games to build, every build update day by day, and the changelog's news.

struct WhatsNewPage: View {
    @ObservedObject var store: WhatsNewStore
    @ObservedObject var library: GameLibrary
    let artwork: [UUID: NSImage]
    let newBuild: () -> Void
    @State private var allNews = false   // News shows its newest points until Show all

    var body: some View {
        CardPageHeading("What's New", note: "What changed in switch2mac, and new builds and games, checked every few minutes. Your games' updates show in the Library.")
        if !store.news.isEmpty { newsCard }
        if !newGames.isEmpty {
            CardGroup("New games") {
                ForEach(Array(newGames.enumerated()), id: \.element.id) { index, u in
                    if index > 0 { CardDivider() }
                    CardRow(u.game, detail: "Added \(Self.day(u.date).lowercased()): built with \(u.engine). Untested by switch2mac so far: players' reports say how it runs.",
                            dot: LauncherPalette.ready) {
                        Button("Build", action: newBuild)
                    }
                }
            }
        }
        if !days.isEmpty {
            ForEach(days, id: \.day) { group in
                CardGroup("Build updates · \(group.day)") {
                    ForEach(Array(group.updates.enumerated()), id: \.element.id) { index, u in
                        if index > 0 { CardDivider() }
                        UpdateRow(update: u, multi: (store.pinned.values.first { $0.name == u.game }?.builds.count ?? 1) > 1)
                    }
                }
            }
        } else if store.failed {
            CardGroup("Build updates") {
                Text("GitHub could not be reached just now. What's New tries again in a few minutes.")
                    .font(.manrope(14)).foregroundStyle(.secondary).frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20).padding(.vertical, 16)
            }
        }
        if !engineChanges.isEmpty {
            CardGroup("nxnative's latest changes", footnote: "nxnative is the engine most games here are built with, and it changes many times a day. A change reaches a game when that game's build next moves (Build updates above); changes for every game come along with it.") {
                ForEach(Array(engineChanges.enumerated()), id: \.element.id) { index, c in
                    if index > 0 { CardDivider() }
                    EngineChangeRow(change: c, games: WhatsNew.games(named: c.body, pinned: store.pinned), owned: owned)
                }
            }
        }
    }

    /// The changelog's points, newest first, each with its day; the newest five until Show all.
    private var newsCard: some View {
        let points = store.news.flatMap { n in n.points.map { (heading: Self.heading(n), point: $0) } }
        let shown = allNews ? points : Array(points.prefix(5))
        return CardGroup("News") {
            ForEach(Array(shown.enumerated()), id: \.offset) { index, item in
                if index > 0 { CardDivider() }
                VStack(alignment: .leading, spacing: 4) {
                    if index == 0 || shown[index - 1].heading != item.heading {
                        Text(item.heading).font(.manrope(12, .semibold)).foregroundStyle(LauncherPalette.unbuilt)
                    }
                    Text(Self.markdown(item.point)).font(.manrope(13.5)).fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20).padding(.vertical, 12)
            }
            if points.count > 5 {
                CardDivider()
                Button { withAnimation(.easeInOut(duration: 0.2)) { allNews.toggle() } } label: {
                    HStack(spacing: 6) {
                        Text(allNews ? "Show less" : "Show all \(points.count)").font(.manrope(13, .semibold))
                        Image(systemName: "chevron.down").font(.system(size: 10, weight: .bold)).rotationEffect(.degrees(allNews ? 180 : 0))
                    }
                    .foregroundStyle(.secondary).frame(maxWidth: .infinity).padding(.vertical, 11).contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
        }
    }

    /// nxnative's changes of the last three days, at most twenty.
    private var engineChanges: [WhatsNew.EngineChange] {
        Array(store.engine.filter { Date().timeIntervalSince($0.date) < 3 * 86400 }.prefix(20))
    }

    /// The names (as game.json writes them) of the games in the library.
    private var owned: Set<String> {
        Set(library.games.compactMap { store.pinned[$0.titleID.uppercased()]?.name })
    }

    private var newGames: [WhatsNew.Update] {
        store.updates.filter { $0.newGame && Date().timeIntervalSince($0.date) < 30 * 86400 }
    }

    /// The build updates of the last two weeks, by day; a game updated several times in a day shows once, its newest line.
    private var days: [(day: String, updates: [WhatsNew.Update])] {
        let recent = store.updates.filter { !$0.newGame && !$0.quiet && Date().timeIntervalSince($0.date) < 14 * 86400 }
        var out: [(day: String, updates: [WhatsNew.Update])] = []
        for u in recent {
            let d = Self.day(u.date)
            if out.last?.day != d { out.append((d, [])) }
            if !out[out.count - 1].updates.contains(where: { $0.game == u.game && $0.build == u.build }) { out[out.count - 1].updates.append(u) }
        }
        return out
    }

    static func day(_ date: Date) -> String {
        if Calendar.current.isDateInToday(date) { return "Today" }
        if Calendar.current.isDateInYesterday(date) { return "Yesterday" }
        return date.formatted(.dateTime.weekday(.wide).month(.wide).day())
    }

    /// "## 2026-11-05 (8): switch2mac app 0.2.0" → "Thursday, November 5 · switch2mac app 0.2.0".
    static func heading(_ n: WhatsNew.News) -> String {
        guard let date = n.date else { return n.heading }
        let rest = n.heading.dropFirst(10).replacingOccurrences(of: #"^\s*(\(\d+\))?:?\s*"#, with: "", options: .regularExpression)
        return date.formatted(.dateTime.weekday(.wide).month(.wide).day()) + (rest.isEmpty ? "" : " · " + rest)
    }

    static func markdown(_ s: String) -> AttributedString {
        (try? AttributedString(markdown: s, options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace))) ?? AttributedString(s)
    }
}

/// One build update: the game, which build, and what changed.
struct UpdateRow: View {
    let update: WhatsNew.Update
    let multi: Bool

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 12) {
            Circle().fill(LauncherPalette.ready).frame(width: 7, height: 7)
            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 6) {
                    Text(update.game).font(.manrope(14, .semibold))
                    Text(multi ? "\(update.build) build" : update.engine).font(.manrope(12)).foregroundStyle(.secondary)
                }
                Text(update.note.isEmpty ? "Moved to \(update.engine) \(update.commit.prefix(8))." : update.note)
                    .font(.manrope(13)).foregroundStyle(.secondary).fixedSize(horizontal: false, vertical: true)
            }
            Spacer(minLength: 12)
            Text(update.commit.prefix(8)).font(.mono(11.5)).foregroundStyle(.tertiary)
        }
        .padding(.horizontal, 18).padding(.vertical, 12)
    }
}

/// One of nxnative's changes: what it says, and the games it names (yours stand out).
struct EngineChangeRow: View {
    let change: WhatsNew.EngineChange
    let games: [String]
    let owned: Set<String>

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 12) {
            Circle().fill(games.contains(where: owned.contains) ? LauncherPalette.progress : LauncherPalette.unbuilt).frame(width: 7, height: 7)
            VStack(alignment: .leading, spacing: 6) {
                Text(change.text).font(.manrope(13)).lineLimit(3).fixedSize(horizontal: false, vertical: true).help(change.text)
                HStack(spacing: 6) {
                    ForEach(games, id: \.self) { g in
                        Text(g).font(.manrope(11.5, .semibold))
                            .foregroundStyle(owned.contains(g) ? Color.black : Color.secondary)
                            .padding(.horizontal, 8).padding(.vertical, 3)
                            .background(owned.contains(g) ? LauncherPalette.progress : Color.white.opacity(0.08), in: Capsule())
                    }
                    if games.isEmpty { Text("Every game").font(.manrope(11.5)).foregroundStyle(.tertiary) }
                    Spacer(minLength: 0)
                    Text(change.date.formatted(.relative(presentation: .named))).font(.manrope(11.5)).foregroundStyle(.tertiary)
                }
            }
        }
        .padding(.horizontal, 18).padding(.vertical, 12)
    }
}

/// The Library's "Update available" details: your build against the newest, what changed in between, and Rebuild.
struct UpdateDetails: View {
    let standing: WhatsNew.Standing
    let rebuildDisabled: Bool
    let rebuild: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(standing.changes.count == 1 ? "1 update since your build" : "\(standing.changes.count) updates since your build")
                .font(.manrope(16, .bold))
            Text(versions).font(.mono(12)).foregroundStyle(.secondary).lineLimit(1).truncationMode(.middle)
            VStack(alignment: .leading, spacing: 8) {
                ForEach(standing.changes.prefix(8)) { u in
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text("•").foregroundStyle(.secondary)
                        Text(u.note).font(.manrope(13)).fixedSize(horizontal: false, vertical: true)
                        Spacer(minLength: 8)
                        Text(WhatsNewPage.day(u.date)).font(.manrope(12)).foregroundStyle(.tertiary).fixedSize()
                    }
                }
                if standing.changes.count > 8 { Text("and \(standing.changes.count - 8) more").font(.manrope(12)).foregroundStyle(.secondary) }
            }
            HStack {
                Text("Rebuilding keeps your saves.").font(.manrope(12)).foregroundStyle(.secondary)
                Spacer(minLength: 12)
                Button(action: rebuild) {
                    Label("Rebuild", systemImage: "arrow.clockwise").font(.manrope(13.5, .bold)).foregroundStyle(.black)
                        .padding(.horizontal, 16).padding(.vertical, 8)
                        .background(LauncherPalette.ready, in: Capsule())
                }
                .buttonStyle(.plain).disabled(rebuildDisabled).opacity(rebuildDisabled ? 0.5 : 1)
            }
            .padding(.top, 4)
        }
        .padding(20)
        .frame(width: 440)
        .background(LauncherPalette.background)
        .preferredColorScheme(.dark)
    }

    private var versions: String {
        var s = "Yours: \(standing.engine)" + (standing.mine.isEmpty ? "" : " \(standing.mine)")
        if let d = standing.builtOn { s += " (\(d.formatted(.dateTime.month(.abbreviated).day())))" }
        if !standing.newest.isEmpty { s += "  →  newest: \(standing.newest)" }
        return s
    }
}
