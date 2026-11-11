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
    @State private var newsShown = WhatsNewPage.newsStep   // News shows its newest points; Show more adds the next few
    @State private var updatesShown = WhatsNewPage.updatesStep   // Build updates: five lines, then Show more

    var body: some View {
        CardPageHeading("What's New", note: "What changed in switch2mac, and new builds and games, checked every few minutes. Your games' updates show in the Library.")
        DotKey(newGames: !newGames.isEmpty)
        if !store.news.isEmpty { newsCard }
        if !newGames.isEmpty {
            CardGroup("New games") {
                ForEach(Array(newGames.enumerated()), id: \.element.id) { index, u in
                    if index > 0 { CardDivider() }
                    CardRow(u.game, detail: "Added \(Self.day(u.date).lowercased()): built with \(u.engine).",
                            dot: LauncherPalette.ready) {
                        Button("Build", action: newBuild)
                    }
                }
            }
        }
        if !days.isEmpty {
            buildUpdatesCard
        } else if store.failed {
            CardGroup("Build updates") {
                Text("GitHub could not be reached just now. What's New tries again in a few minutes.")
                    .font(.manrope(14)).foregroundStyle(.secondary).frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20).padding(.vertical, 16)
            }
        }
        if !engineChanges.isEmpty {
            CardGroup("nxnative's latest changes", footnote: "nxnative is the engine most games here are built with. A change reaches a game when that game's build next moves.") {
                ForEach(Array(engineChanges.enumerated()), id: \.element.id) { index, c in   // in full (the player's choice): the last three days
                    if index > 0 { CardDivider() }
                    EngineChangeRow(change: c, games: store.engineTags[c.sha] ?? [], owned: owned)
                }
            }
        }
    }

    static let newsStep = 5
    static let updatesStep = 5

    /// Every build update of the last week in one card, newest first, in full (the game, its build, the whole change message, when), the day as a small
    /// heading over its first row: five, then Show more. Your games' updates come first within a day.
    private var buildUpdatesCard: some View {
        let rows = days.flatMap { d in d.updates.sorted { owned.contains($0.game) && !owned.contains($1.game) }.map { (day: d.day, update: $0) } }
        let shown = Array(rows.prefix(updatesShown))
        return CardGroup("Build updates") {
            ForEach(Array(shown.enumerated()), id: \.element.update.id) { index, item in
                if index > 0 { CardDivider() }
                VStack(alignment: .leading, spacing: 4) {
                    if index == 0 || shown[index - 1].day != item.day {
                        Text(item.day).font(.manrope(12, .semibold)).foregroundStyle(LauncherPalette.unbuilt).padding(.horizontal, 18).padding(.top, 10)
                    }
                    UpdateRow(update: item.update, multi: (store.pinned.values.first { $0.name == item.update.game }?.builds.count ?? 1) > 1,
                              yours: owned.contains(item.update.game), whole: true)
                }
            }
            moreLess(shown: shown.count, total: rows.count, step: Self.updatesStep, value: $updatesShown)
        }
    }

    @ViewBuilder private func moreLess(shown: Int, total: Int, step: Int, value: Binding<Int>) -> some View {
        if total > step {
            CardDivider()
            HStack(spacing: 0) {
                if shown < total { newsButton("Show more", up: false) { value.wrappedValue += step } }
                if shown > step { newsButton("Show less", up: true) { value.wrappedValue = step } }
            }
        }
    }

    /// The changelog's points, newest first, each with its day: the newest five, then five more each time Show more is pressed
    /// (all of them at once was a long scroll), and Show less back to five once more are shown.
    private var newsCard: some View {
        let points = store.news.flatMap { n in n.points.map { (heading: Self.heading(n), point: $0) } }
        let shown = Array(points.prefix(newsShown))
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
            if points.count > Self.newsStep {
                CardDivider()
                HStack(spacing: 0) {
                    if shown.count < points.count {
                        newsButton("Show more", up: false) { newsShown += Self.newsStep }
                    }
                    if shown.count > Self.newsStep {
                        newsButton("Show less", up: true) { newsShown = Self.newsStep }
                    }
                }
            }
        }
    }

    private func newsButton(_ title: String, up: Bool, _ action: @escaping () -> Void) -> some View {
        Button { withAnimation(.easeInOut(duration: 0.2), action) } label: {
            HStack(spacing: 6) {
                Text(title).font(.manrope(13, .semibold))
                Image(systemName: "chevron.down").font(.system(size: 10, weight: .bold)).rotationEffect(.degrees(up ? 180 : 0))
            }
            .foregroundStyle(.secondary).frame(maxWidth: .infinity).padding(.vertical, 11).contentShape(Rectangle())
        }
        .buttonStyle(.plain)
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

    /// The build updates of the last week, by day; a game updated several times in a day shows once, its newest line.
    private var days: [(day: String, updates: [WhatsNew.Update])] {
        let recent = store.updates.filter { !$0.newGame && !$0.quiet && Date().timeIntervalSince($0.date) < 7 * 86400 }
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

/// What the dots on this page say, in one line under the heading: yellow = about a game in your Library, grey = another game (or every game),
/// green = a new game you can build (shown only while the New games card is there).
struct DotKey: View {
    let newGames: Bool
    var body: some View {
        HStack(spacing: 18) {
            item(LauncherPalette.progress, "About one of your games")
            item(LauncherPalette.unbuilt, "Other games")
            if newGames { item(LauncherPalette.ready, "New game you can build") }
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 4).padding(.bottom, 4)
        .accessibilityElement(children: .combine)
    }
    private func item(_ c: Color, _ text: String) -> some View {
        HStack(spacing: 7) {
            Circle().fill(c).frame(width: 7, height: 7)
            Text(text).font(.manrope(12)).foregroundStyle(.secondary)
        }
    }
}

/// One build update: the game, which build, and what changed.
struct UpdateRow: View {
    let update: WhatsNew.Update
    let multi: Bool
    var yours = false   // a game in your library: its dot stands out
    var compact = false   // one line
    var whole = false   // the whole change message, however long (What's New's Build updates)

    var body: some View {
        if compact { line } else { full }
    }

    private var note: String { update.note.isEmpty ? "Moved to \(BuildName.shown(update.engine)) \(update.commit.prefix(8))." : Self.summary(update.note) }

    private var line: some View {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Circle().fill(yours ? LauncherPalette.progress : LauncherPalette.unbuilt).frame(width: 7, height: 7)
            Text(update.game).font(.manrope(14, .semibold)).lineLimit(1).layoutPriority(2)
            Text(multi ? BuildName.row(update.build) : BuildName.shown(update.engine)).font(.manrope(12)).foregroundStyle(.secondary).lineLimit(1).layoutPriority(1)
            Text(note).font(.manrope(13)).foregroundStyle(.secondary).lineLimit(1).truncationMode(.tail)
            Spacer(minLength: 12)
            Text(update.date.formatted(.relative(presentation: .named))).font(.manrope(11.5)).foregroundStyle(.tertiary).lineLimit(1).layoutPriority(2)
        }
        .padding(.horizontal, 18).padding(.vertical, 10)
        .help(update.note.isEmpty ? note : update.note)
    }

    private var full: some View {
        HStack(alignment: .firstTextBaseline, spacing: 12) {
            Circle().fill(yours ? LauncherPalette.progress : LauncherPalette.unbuilt).frame(width: 7, height: 7)
            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 6) {
                    Text(update.game).font(.manrope(14, .semibold))
                    Text(multi ? BuildName.row(update.build) : BuildName.shown(update.engine)).font(.manrope(12)).foregroundStyle(.secondary)
                }
                Text(update.note.isEmpty ? "Moved to \(BuildName.shown(update.engine)) \(update.commit.prefix(8))." : whole ? update.note : Self.summary(update.note))
                    .font(.manrope(13)).foregroundStyle(.secondary).lineLimit(whole ? nil : 2).fixedSize(horizontal: false, vertical: whole).help(update.note)
            }
            Spacer(minLength: 12)
            VStack(alignment: .trailing, spacing: 3) {   // when, as nxnative's changes show it; the commit under it
                Text(update.date.formatted(.relative(presentation: .named))).font(.manrope(11.5)).foregroundStyle(.tertiary)
                Text(update.commit.prefix(8)).font(.mono(11)).foregroundStyle(.quaternary)
            }
        }
        .padding(.horizontal, 18).padding(.vertical, 12)
    }

    /// A commit message as one short line: its first sentence or clause, without the bracketed references (chain, issue and PR numbers) engine commits end with.
    static func summary(_ note: String) -> String {
        var s = note.replacingOccurrences(of: #"\s*\((chain|issue|PR|pull|#)[^)]*\)"#, with: "", options: .regularExpression)
        if let r = s.range(of: #"[.;](\s|$)"#, options: .regularExpression) { s = String(s[..<r.lowerBound]) }
        s = s.trimmingCharacters(in: .whitespaces)
        return s.isEmpty ? note : s + "."
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
                Text(UpdateRow.summary(change.text)).font(.manrope(13)).lineLimit(2).help(change.text)
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
        var s = "Yours: \(BuildName.shown(standing.engine))" + (standing.mine.isEmpty ? "" : " \(standing.mine)")
        if let d = standing.builtOn { s += " (\(d.formatted(.dateTime.month(.abbreviated).day())))" }
        if !standing.newest.isEmpty { s += "  →  newest: \(standing.newest)" }
        return s
    }
}
