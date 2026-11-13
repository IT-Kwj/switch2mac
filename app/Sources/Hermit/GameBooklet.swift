import AppKit
import SwiftUI
import NXLauncher

// The open case's instruction booklet, readable: a click on the booklet (or Read booklet) opens it as paper pages over the case.
// Switch games ship without a printed booklet, so the pages hold what the game's own shop page says about it: its introduction and
// description, and its details (publisher, release date, players, genre, rating). That text is the eShop's, as the community title
// database blawar/titledb lists it; like the banners it is downloaded onto the player's Mac at run time (Artwork.swift) and is in
// neither this repository nor the app. The last page is Hermit's own: how the game was built and the keys of its overlay and settings.
// Nothing is read or drawn until the booklet is opened: one small file from disk, off the main thread.

/// What the shop's list says about a game (ArtworkStore keeps it in small files by title ID).
struct GameInfo: Codable, Equatable {
    var name = ""
    var intro = ""
    var description = ""
    var publisher = ""
    var releaseDate = 0          // 20250605
    var players = 0
    var categories: [String] = []
    var rating = ""

    var isEmpty: Bool { intro.isEmpty && description.isEmpty }

    /// "5 June 2025", or "" when the list gives no date.
    var released: String {
        guard releaseDate > 19000000 else { return "" }
        var c = DateComponents(); c.year = releaseDate / 10000; c.month = releaseDate / 100 % 100; c.day = releaseDate % 100
        guard let d = Calendar(identifier: .gregorian).date(from: c) else { return "" }
        let f = DateFormatter(); f.locale = Locale(identifier: "en_US_POSIX"); f.dateFormat = "d MMMM yyyy"
        return f.string(from: d)
    }
}

/// One page of the booklet.
enum BookletPage: Equatable {
    case cover
    case text(heading: String?, body: String)
    case table(heading: String, rows: [(String, String)], footnote: String?)
    case reports([Booklet.Report])
    case mac
    case empty(String)   // no shop text for this game (or still being fetched): what to say instead

    static func == (a: BookletPage, b: BookletPage) -> Bool {
        switch (a, b) {
        case (.cover, .cover), (.mac, .mac): return true
        case let (.text(h1, b1), .text(h2, b2)): return h1 == h2 && b1 == b2
        case let (.table(h1, d1, f1), .table(h2, d2, f2)): return h1 == h2 && f1 == f2 && d1.map(\.0) == d2.map(\.0) && d1.map(\.1) == d2.map(\.1)
        case let (.reports(r1), .reports(r2)): return r1 == r2
        case let (.empty(x), .empty(y)): return x == y
        default: return false
        }
    }
}

enum Booklet {
    /// The arrow keys and the controller turn the open booklet's pages through this (the shelf has the keyboard).
    static let turnNote = Notification.Name("hermit.booklet.turn")
    static func turn(_ by: Int) { NotificationCenter.default.post(name: turnNote, object: by) }

    /// How much text a page holds at the reader's type size (a heading takes some of it).
    static let pageChars = 780

    /// The shop's text as paragraphs: its line breaks kept, runs of blank lines and stray spaces dropped.
    static func paragraphs(_ text: String) -> [String] {
        text.replacingOccurrences(of: "\r", with: "").components(separatedBy: "\n")
            .map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
    }

    /// Paragraphs laid onto pages of about `limit` characters: a paragraph stays whole where it fits, and one longer than a page
    /// is cut at a sentence end (or a space) so no page overflows.
    static func fill(_ paragraphs: [String], limit: Int = pageChars) -> [String] {
        var pages: [String] = [], page = ""
        func close() { if !page.isEmpty { pages.append(page); page = "" } }
        for var p in paragraphs {
            while !p.isEmpty {
                let room = limit - page.count - (page.isEmpty ? 0 : 2)
                if p.count <= room { page += (page.isEmpty ? "" : "\n\n") + p; p = ""; break }
                if !page.isEmpty && p.count <= limit { close(); continue }   // it fits the next page whole
                guard room > limit / 4 else { close(); continue }
                let head = String(p.prefix(room))
                let cut = head.range(of: ". ", options: .backwards)?.upperBound ?? head.range(of: " ", options: .backwards)?.upperBound ?? head.endIndex
                let piece = String(head[..<cut]).trimmingCharacters(in: .whitespaces)
                page += (page.isEmpty ? "" : "\n\n") + piece
                p = String(p.dropFirst(head.distance(from: head.startIndex, to: cut))).trimmingCharacters(in: .whitespaces)
                close()
            }
        }
        close()
        return pages
    }

    /// How the game ran on a player's Mac: a row of the game's reports table (games/<game>/reports.tsv).
    struct Report: Equatable { var mac = "", chip = "", memory = "", build = "", fps = "", peak = "", notes = "" }

    /// The reports table's rows that give a frame rate, those on this Mac's chip first (the same chip, then the same generation).
    static func reports(tsv: String, chip: String) -> [Report] {
        func generation(_ c: String) -> String { String(c.split(separator: " ").first ?? "") }
        let mine = chip.replacingOccurrences(of: "Apple ", with: "")
        var rows: [Report] = []
        for line in tsv.split(separator: "\n") where !line.hasPrefix("#") {
            let f = line.split(separator: "\t", omittingEmptySubsequences: false).map(String.init)
            guard f.count >= 7, !f[5].isEmpty else { continue }
            let build = String(f[4].split(separator: " ").first ?? "")
            rows.append(Report(mac: f[0], chip: f[1], memory: f[2], build: build, fps: f[5], peak: f[6], notes: f.count > 7 ? f[7] : ""))
        }
        func rank(_ r: Report) -> Int {
            if r.chip == mine { return 0 }
            return !mine.isEmpty && generation(r.chip) == generation(mine) ? 1 : 2
        }
        var ranked: [(rank: Int, at: Int, row: Report)] = []
        for (i, r) in rows.enumerated() { ranked.append((rank(r), i, r)) }
        ranked.sort { a, b in a.rank != b.rank ? a.rank < b.rank : a.at < b.at }
        return ranked.map { $0.row }
    }

    /// The reports table of a game, by title ID ("" when the repository has no page or no reports for it). Reads files: call it off the main thread.
    static func reportsTable(titleID: String, repo: String) -> String {
        let games = URL(fileURLWithPath: repo).appendingPathComponent("games")
        for dir in (try? FileManager.default.contentsOfDirectory(at: games, includingPropertiesForKeys: nil)) ?? [] {
            guard let data = try? Data(contentsOf: dir.appendingPathComponent("game.json")),
                  let o = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any],
                  (o["title_id"] as? String)?.uppercased() == titleID.uppercased() else { continue }
            return (try? String(contentsOf: dir.appendingPathComponent("reports.tsv"), encoding: .utf8)) ?? ""
        }
        return ""
    }

    /// The keyboard's keys for the booklet's Controls page, as the player set them (Settings › Controls).
    static func controls(_ layout: ControlLayout) -> [(String, String)] {
        func key(_ id: String) -> String { ControlLayout.functions.first { $0.id == id }.flatMap { ControlLayout.keyName(layout.key($0)) } ?? "–" }
        var rows = [("Move", ["LUp", "LLeft", "LDown", "LRight"].map(key).joined(separator: " ")), ("D-pad", ["Up", "Left", "Down", "Right"].map(key).joined(separator: " "))]
        rows += [("A  ·  B", "\(key("A"))  ·  \(key("B"))"), ("X  ·  Y", "\(key("X"))  ·  \(key("Y"))"), ("L  ·  R", "\(key("L"))  ·  \(key("R"))"),
                 ("ZL  ·  ZR", "\(key("ZL"))  ·  \(key("ZR"))"), ("+  ·  −", "\(key("Plus"))  ·  \(key("Minus"))")]
        return rows
    }

    /// The booklet's pages for a game: cover, the shop's text and details, then Hermit's own pages (controls, how it ran, your Mac).
    static func pages(_ info: GameInfo?, loading: Bool = false, controls: [(String, String)] = [], reports: [Report] = []) -> [BookletPage] {
        var out: [BookletPage] = [.cover]
        var tail: [BookletPage] = []   // Hermit's own pages, after the shop's
        if !controls.isEmpty { tail.append(.table(heading: "Controls", rows: controls, footnote: "A controller plays as on the console. Change keys and buttons in Settings › Controls.")) }
        if !reports.isEmpty { tail.append(.reports(Array(reports.prefix(5)))) }
        tail.append(.mac)
        guard let info, !info.isEmpty else {
            out.append(.empty(loading ? "Fetching this game's pages…" : "The shop's list has no pages for this game."))
            return out + tail
        }
        var paras = paragraphs(info.description)
        let intro = paragraphs(info.intro).joined(separator: " ")
        if !intro.isEmpty, paras.first != intro { paras.insert(intro, at: 0) }
        for (i, body) in fill(paras).enumerated() { out.append(.text(heading: i == 0 ? "About the game" : nil, body: body)) }
        var rows: [(String, String)] = []
        if !info.publisher.isEmpty { rows.append(("Publisher", info.publisher)) }
        if !info.released.isEmpty { rows.append(("Released", info.released)) }
        if info.players > 0 { rows.append(("Players", info.players == 1 ? "1" : "1 to \(info.players)")) }
        if !info.categories.isEmpty { rows.append(("Genre", info.categories.prefix(4).joined(separator: ", "))) }
        if !info.rating.isEmpty { rows.append(("Rating", info.rating)) }
        if !rows.isEmpty { out.append(.table(heading: "Details", rows: rows, footnote: "From the game's Nintendo eShop page, fetched onto your Mac. Not part of Hermit.")) }
        return out + tail
    }
}

/// The booklet, open over the case: two paper pages side by side, turned with the arrows, the arrow keys or a click on a page's half.
struct BookletReader: View {
    let name: String
    let titleID: String
    let switch2: Bool
    let front: NSImage?
    let build: String?        // the installed build's name, for Hermit's page
    let repo: String          // where the game's reports table is
    let close: () -> Void

    @State private var pages: [BookletPage] = Booklet.pages(nil, loading: true)
    @State private var spread = 0   // the left page's index / 2

    private static let ink = Color(red: 0.13, green: 0.13, blue: 0.15)
    private static let paper = Color(red: 0.975, green: 0.97, blue: 0.955)
    private var spreads: Int { (pages.count + 1) / 2 }

    var body: some View {
        GeometryReader { geo in
            let h = min(geo.size.height - 150, 640), w = h * 0.68
            ZStack {
                Color.black.opacity(0.55).contentShape(Rectangle()).onTapGesture(perform: close)
                VStack(spacing: 16) {
                    HStack(spacing: 0) {
                        page(spread * 2, w, h, left: true)
                        Rectangle().fill(Color.black.opacity(0.18)).frame(width: 1, height: h)
                        page(spread * 2 + 1, w, h, left: false)
                    }
                    .background(Self.paper).clipShape(RoundedRectangle(cornerRadius: 6))
                    .shadow(color: .black.opacity(0.5), radius: 24, y: 10)
                    HStack(spacing: 14) {
                        arrow("chevron.left", spread > 0) { turn(-1) }
                        Text("\(spread + 1) of \(spreads)").font(.manrope(12, .semibold)).foregroundStyle(.secondary).frame(minWidth: 60)
                        arrow("chevron.right", spread < spreads - 1) { turn(1) }
                        Button(action: close) {
                            Text("Close booklet").font(.manrope(13, .semibold)).foregroundStyle(.white).padding(.horizontal, 14).padding(.vertical, 8)
                                .background(Color.white.opacity(0.08), in: Capsule()).overlay(Capsule().strokeBorder(Color.white.opacity(0.14)))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .task(id: titleID) {
            let controls = Booklet.controls(ControlLayout())
            let (id, repo) = (titleID, repo)
            let reports = await Task.detached { Booklet.reports(tsv: Booklet.reportsTable(titleID: id, repo: repo), chip: MacSpecs.read().chip) }.value
            pages = Booklet.pages(nil, loading: true, controls: controls, reports: reports)   // Hermit's own pages at once, the shop's when they arrive
            let info = await ArtworkStore.shared.info(titleID)
            pages = Booklet.pages(info, controls: controls, reports: reports); spread = min(spread, spreads - 1)
        }
        .onReceive(NotificationCenter.default.publisher(for: Booklet.turnNote)) { n in if let by = n.object as? Int { turn(by) } }
        .transition(.opacity)
    }

    func turn(_ by: Int) {
        let next = min(max(spread + by, 0), spreads - 1)
        guard next != spread else { return }
        spread = next   // no animation: the pages change in place (a layout animation would redraw the whole window)
        InterfaceSound.play(.tick)
    }

    private func arrow(_ symbol: String, _ on: Bool, _ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: symbol).font(.system(size: 13, weight: .semibold)).foregroundStyle(.white.opacity(on ? 1 : 0.3)).frame(width: 34, height: 34)
                .background(Color.white.opacity(0.08), in: Circle()).overlay(Circle().strokeBorder(Color.white.opacity(0.14)))
        }
        .buttonStyle(.plain).disabled(!on)
    }

    @ViewBuilder private func page(_ i: Int, _ w: CGFloat, _ h: CGFloat, left: Bool) -> some View {
        ZStack(alignment: .bottom) {
            Group {
                if i < pages.count { content(pages[i], w) } else { Color.clear }
            }
            .frame(width: w - 56, height: h - 76, alignment: .topLeading).padding(.horizontal, 28).padding(.top, 30).padding(.bottom, 46)
            if i > 0, i < pages.count { Text("\(i + 1)").font(.manrope(10, .medium)).foregroundStyle(Self.ink.opacity(0.4)).padding(.bottom, 16) }
        }
        .frame(width: w, height: h).contentShape(Rectangle())
        .onTapGesture { turn(left ? -1 : 1) }
    }

    @ViewBuilder private func content(_ p: BookletPage, _ w: CGFloat) -> some View {
        switch p {
        case .cover:
            VStack(spacing: 14) {
                Rectangle().fill(CaseStyle.shell(switch2)).frame(height: 8)
                if let front { Image(nsImage: front).resizable().aspectRatio(contentMode: .fit).clipShape(RoundedRectangle(cornerRadius: 4)) }
                else { Text(name).font(.manrope(24, .bold)).foregroundStyle(Self.ink).multilineTextAlignment(.center).frame(maxHeight: .infinity) }
                Text("INSTRUCTION BOOKLET").font(.manrope(11, .semibold)).tracking(2.2).foregroundStyle(Self.ink.opacity(0.7))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        case let .text(heading, body):
            VStack(alignment: .leading, spacing: 12) {
                if let heading { self.heading(heading) }
                Text(body).font(.manrope(12.5)).lineSpacing(3.5).foregroundStyle(Self.ink).minimumScaleFactor(0.8)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        case let .table(title, rows, footnote):
            VStack(alignment: .leading, spacing: 12) {
                heading(title)
                ForEach(rows, id: \.0) { row in
                    VStack(alignment: .leading, spacing: 2) {
                        Text(row.0.uppercased()).font(.manrope(9.5, .semibold)).tracking(1.4).foregroundStyle(Self.ink.opacity(0.5))
                        Text(row.1).font(.manrope(13, .medium)).foregroundStyle(Self.ink)
                    }
                }
                Spacer(minLength: 0)
                if let footnote { Text(footnote).font(.manrope(9.5)).foregroundStyle(Self.ink.opacity(0.45)) }
            }
        case let .reports(list):
            VStack(alignment: .leading, spacing: 12) {
                heading("How it ran")
                ForEach(Array(list.enumerated()), id: \.offset) { _, r in
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(r.mac) · \(r.chip) · \(r.memory) GB".uppercased()).font(.manrope(9.5, .semibold)).tracking(1.2).foregroundStyle(Self.ink.opacity(0.5))
                        Text("\(r.fps) fps" + (r.peak.isEmpty ? "" : ", \(r.peak) GB of memory") + (r.build.isEmpty ? "" : " · \(BuildName.shown(r.build))"))
                            .font(.manrope(13, .medium)).foregroundStyle(Self.ink)
                    }
                }
                Spacer(minLength: 0)
                Text("Players' reports, Macs like yours first. Add yours from Performance › Share.").font(.manrope(9.5)).foregroundStyle(Self.ink.opacity(0.45))
            }
        case .mac:
            VStack(alignment: .leading, spacing: 12) {
                heading("On your Mac")
                if let build { note("Built with", build) }
                note("Key 1", "Shows how the game runs: frames per second, and more when pressed again.")
                note("Key 2", "The game's settings. Changes apply the next time it starts.")
                note("Your save", "Stays on your Mac, and is kept when you build the game again.")
                Spacer(minLength: 0)
            }
        case let .empty(message):
            VStack(alignment: .leading, spacing: 12) {
                heading("About the game")
                Text(message).font(.manrope(12.5)).foregroundStyle(Self.ink.opacity(0.6))
            }
        }
    }

    private func heading(_ s: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(s).font(.manrope(17, .bold)).foregroundStyle(Self.ink)
            Rectangle().fill(CaseStyle.shell(switch2)).frame(width: 34, height: 3)
        }
    }

    private func note(_ title: String, _ text: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title.uppercased()).font(.manrope(9.5, .semibold)).tracking(1.4).foregroundStyle(Self.ink.opacity(0.5))
            Text(text).font(.manrope(12.5)).foregroundStyle(Self.ink).fixedSize(horizontal: false, vertical: true)
        }
    }
}
