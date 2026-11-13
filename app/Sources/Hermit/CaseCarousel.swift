import AppKit
import CoreImage
import SwiftUI
import NXLauncher
import NXModel

// The Library's Carousel: every game as a game case in a turning row, the selected one large in the middle with its cartridge sliding out beside it,
// its name, console and Play below, and the room lit by its cover. The idea and the layout follow PyroCade (Pyrodrifter/PyroCade, MIT: its carousel and
// physical cases); the drawing is Hermit's own, natively in SwiftUI. Cases and cartridges are drawn by the app in plain plastic colours with no
// console maker's logo or artwork; the front is the game's retail box front downloaded onto the player's Mac (BoxArt.swift), else a cover cut from its
// eShop banner (CoverArt.swift), else Hermit's own cover.

/// The plastic of a console's case and cartridge (no logo: the box front carries the game's own art).
enum CaseStyle {
    static func shell(_ switch2: Bool) -> Color { switch2 ? Color(red: 0.78, green: 0.11, blue: 0.19) : Color(red: 0.86, green: 0.05, blue: 0.11) }
    static func label(_ switch2: Bool) -> String { switch2 ? "Switch 2" : "Switch" }
}

/// One game case seen from the front, with the thickness of its spine on the left: the box front, a plastic edge and a sheen.
struct GameCaseView: View {
    let game: LibraryGame
    let box: NSImage?
    let banner: NSImage?
    let focus: CGPoint?
    let width: CGFloat
    let switch2: Bool

    var body: some View {
        let height = width / CoverArt.aspect, spine = max(4, width * 0.07)
        HStack(spacing: 0) {
            // the spine: plastic with the game's name running down it
            ZStack {
                LinearGradient(colors: [CaseStyle.shell(switch2).opacity(0.75), CaseStyle.shell(switch2)], startPoint: .leading, endPoint: .trailing)
                Text(game.name).font(.manrope(max(6, spine * 0.55), .semibold)).foregroundStyle(.white.opacity(0.9))
                    .lineLimit(1).fixedSize().rotationEffect(.degrees(90)).frame(width: height * 0.9).clipped()
                    .frame(width: spine, height: height).clipped()
            }
            .frame(width: spine, height: height)
            ZStack {
                if let box { Image(nsImage: box).resizable().interpolation(.high).scaledToFill() }
                else { CoverImage(game: game, image: banner, focus: focus, width: width, box: nil) }
                LinearGradient(stops: [.init(color: .white.opacity(0.16), location: 0), .init(color: .clear, location: 0.35),
                                       .init(color: .clear, location: 0.8), .init(color: .black.opacity(0.18), location: 1)],
                               startPoint: .topLeading, endPoint: .bottomTrailing)   // the clear sleeve's sheen
            }
            .frame(width: width, height: height).clipped()
        }
        .clipShape(RoundedRectangle(cornerRadius: width * 0.025))
        .overlay(RoundedRectangle(cornerRadius: width * 0.025).strokeBorder(Color.white.opacity(0.14), lineWidth: 1))
        .shadow(color: .black.opacity(0.55), radius: width * 0.08, y: width * 0.05)
    }
}

/// The game's cartridge: a small plastic card with a notch and the game's art as its label.
struct CartridgeView: View {
    let label: NSImage?
    let width: CGFloat
    let switch2: Bool

    var body: some View {
        let height = width * 1.25
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: width * 0.08).fill(CaseStyle.shell(switch2))
            RoundedRectangle(cornerRadius: width * 0.05).fill(Color.black.opacity(0.25)).frame(width: width * 0.36, height: height * 0.07).offset(y: -height * 0.01)
            Group {
                if let label { Image(nsImage: label).resizable().interpolation(.high).scaledToFill() } else { Color.white.opacity(0.85) }
            }
            .frame(width: width * 0.82, height: height * 0.74).clipShape(RoundedRectangle(cornerRadius: width * 0.04)).padding(.top, height * 0.13)
        }
        .frame(width: width, height: height)
        .shadow(color: .black.opacity(0.5), radius: 8, y: 5)
    }
}

extension LauncherView {
    /// The Carousel page: the controls on top, the turning cases, then the selected game's name, console, status and Play.
    func carouselPage(width: CGFloat, height: CGFloat, style: CaseLayout = .carousel) -> some View {
        let games = filteredGames
        let sel = heroGame.flatMap { h in games.firstIndex { $0.id == h.id } } ?? 0
        let current = games.indices.contains(sel) ? games[sel] : nil
        return ZStack(alignment: .topLeading) {
            // the room lit by the selected game's cover
            if let g = current, let img = boxArt[g.id] ?? artwork[g.id] {
                Image(nsImage: AmbientGlow.of(img, key: g.id)).resizable().interpolation(.medium).scaledToFill()   // blurred once, small, then stretched
                    .frame(width: width, height: height).opacity(0.55).clipped()
                    .allowsHitTesting(false)   // a filled image overflows its frame and would take the header's clicks (the tabs)
                    .id(g.id).transition(.opacity)
            }
            LinearGradient(colors: [LauncherPalette.background.opacity(0.35), LauncherPalette.background.opacity(0.92)], startPoint: .top, endPoint: .bottom)
                .allowsHitTesting(false)
            VStack(alignment: .leading, spacing: 0) {
                libraryControls.padding(.horizontal, 34).padding(.top, 14)
                if games.isEmpty {
                    Text(loc.t("library.noResults")).foregroundStyle(.secondary).padding(34)
                } else {
                    let window = games.indices.filter { abs($0 - sel) <= style.shown + 4 }   // four more a side than are shown: their pictures are made ahead
                    let items = window.map { caseItem(games[$0]) }
                    let local = window.firstIndex(of: sel) ?? 0
                    ZStack {
                        CaseSceneView(items: items, selected: local, style: style,
                                      onSelect: { i in if items.indices.contains(i) { library.selectedID = items[i].id } },
                                      onActivate: { if let g = current { showOpenCase(caseItem(g)) } })   // a click on the selected case opens it (OpenCase.swift)
                        if !style.vertical {   // the round arrows at both sides, as the carousel pages; the stack is scrolled instead
                            HStack {
                                carouselArrow("arrow.left") { step(games, sel, -1) }.disabled(sel == 0)
                                Spacer()
                                carouselArrow("arrow.right") { step(games, sel, 1) }.disabled(sel >= games.count - 1)
                            }
                            .padding(.horizontal, 26)
                        }
                    }
                    .frame(width: width, height: max(320, height * 0.56))
                    HStack(spacing: 14) {   // where you are in the list
                        Text("\(sel + 1) / \(games.count)").font(.manrope(12, .semibold)).foregroundStyle(.secondary).monospacedDigit()
                        GeometryReader { g in
                            ZStack(alignment: .leading) {
                                Capsule().fill(Color.white.opacity(0.10))
                                Capsule().fill(LauncherPalette.progress)   // stretched, not re-laid out: an animated width redid the window's layout every frame
                                    .scaleEffect(x: max(0.07, CGFloat(sel + 1) / CGFloat(max(games.count, 1))), y: 1, anchor: .leading)
                            }
                        }
                        .frame(width: 90, height: 3)
                        .animation(.easeOut(duration: 0.3), value: sel)
                    }
                    .padding(.horizontal, 34).padding(.bottom, 6)
                    if let g = current { carouselDetails(g, index: sel, count: games.count) }
                }
            }
            if let c = openCase { openCaseOverlay(c, game: games.first { $0.id == c.gameID }) }   // OpenCase.swift
        }
        .frame(width: width, height: height).clipped().contentShape(Rectangle())   // clicks stay inside the page
        .modifier(CarouselKeys(back: { if bookletFor != nil { Booklet.turn(-1) } else if openCase == nil { step(games, sel, -1) } },
                               next: { if bookletFor != nil { Booklet.turn(1) } else if openCase == nil { step(games, sel, 1) } },
                               enter: { if let g = current, !launching, bookletFor == nil { if openCase != nil { openCase = nil }; primaryAction(g) } },
                               space: { if openCase != nil { closeOpenCase() } else if let g = current { showOpenCase(caseItem(g)) } },
                               escape: { if openCase != nil { closeOpenCase() } }))
    }

    private func carouselArrow(_ symbol: String, _ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: symbol).font(.system(size: 15, weight: .semibold)).foregroundStyle(.white)
                .frame(width: 40, height: 40).background(.black.opacity(0.45), in: RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.white.opacity(0.12)))
        }
        .buttonStyle(.plain)
    }

    /// A controller on the 3D shelves (Carousel, Flipbook, Stack), with no focus ring showing: the D-pad or stick moves along the shelf (up and down in the
    /// stack), A opens the selected case and A again plays, B shuts the case; with a case open, left and right flip it. Up from the carousel or flipbook
    /// shows the focus ring on the controls above (the filters, the tabs), and B or Down past the last row brings the shelf back. X (the game's
    /// settings), Y (Manage), L and R (the pages) work as everywhere. Returns whether it handled the press.
    func shelfPad(_ action: LauncherGamepad.Action) -> Bool {
        let vertical = libraryLayout.cases?.vertical == true
        if padFocus.visible {   // on the controls above the shelf
            if action == .b { padFocus.hide(); return true }
            if action == .down, !vertical {
                let before = padFocus.focused
                padFocus.move(dx: 0, dy: 1)
                if padFocus.focused == before { padFocus.hide() }   // nothing further down: back to the shelf
                return true
            }
            return false
        }
        if let c = openCase {
            switch action {
            case .a: if bookletFor != nil { bookletFor = nil } else { c.onPlay() }; return true
            case .b: closeOpenCase(); return true
            case .left, .right: if bookletFor != nil { Booklet.turn(action == .left ? -1 : 1) } else { c.flip() }; return true
            case .up, .down: return true
            default: return false
            }
        }
        switch action {
        case .left: stepShelf(-1); return true
        case .right: stepShelf(1); return true
        case .up:
            if vertical { stepShelf(-1) } else { padFocus.show(default: "library.layout") }   // the view switch, the first control above
            return true
        case .down: if vertical { stepShelf(1) }; return true
        case .a:
            if let g = heroGame { showOpenCase(caseItem(g)) }
            return true
        case .b: return true
        default: return false
        }
    }

    /// Moves the shelf's selection `n` games on (a controller, LauncherView.padAction).
    func stepShelf(_ n: Int) {
        let games = filteredGames
        guard !games.isEmpty else { return }
        let sel = heroGame.flatMap { h in games.firstIndex { $0.id == h.id } } ?? 0
        library.selectedID = games[min(max(sel + n, 0), games.count - 1)].id
    }

    /// A game as the 3D scenes show it: its box front, or its cover cut from the banner.
    func caseItem(_ g: LibraryGame) -> CaseItem {
        CaseItem(id: g.id, name: g.name, front: boxArt[g.id] ?? artwork[g.id].flatMap { CoverArt.portrait($0, focus: bannerFocus[g.id], key: g.titleID) },
                 switch2: ConsoleFilter.console(of: g) == .switch2)
    }

    private func step(_ games: [LibraryGame], _ sel: Int, _ by: Int) {
        guard !games.isEmpty else { return }
        library.selectedID = games[min(max(sel + by, 0), games.count - 1)].id
    }

    /// A case at `offset` from the selected one: the selected case faces the player, the others turn towards it and step back, smaller and darker.
    @ViewBuilder private func caseInCarousel(_ g: LibraryGame, offset k: Int, caseW: CGFloat, total: CGFloat) -> some View {
        let side = k == 0 ? 0 : (k < 0 ? -1.0 : 1.0), d = Double(abs(k))
        let x = k == 0 ? 0 : side * (caseW * 0.95 + (d - 1) * caseW * 0.42)
        let s2 = ConsoleFilter.console(of: g) == .switch2
        ZStack {
            if k == 0 {   // the cartridge slides out from behind the selected case
                CartridgeView(label: boxArt[g.id] ?? artwork[g.id].flatMap { CoverArt.portrait($0, focus: bannerFocus[g.id], key: g.titleID) }, width: caseW * 0.34, switch2: s2)
                    .rotationEffect(.degrees(8)).offset(x: caseW * 0.62, y: -caseW * 0.28)
                    .transition(.move(edge: .leading).combined(with: .opacity))
            }
            GameCaseView(game: g, box: boxArt[g.id], banner: artwork[g.id], focus: bannerFocus[g.id], width: caseW, switch2: s2)
        }
        .scaleEffect(k == 0 ? 1 : max(0.5, 0.74 - d * 0.03))
        .rotation3DEffect(.degrees(-side * 38), axis: (x: 0, y: 1, z: 0), perspective: 0.45)
        .brightness(k == 0 ? 0 : -min(0.35, d * 0.06))
        .opacity(d > 6 ? 0 : 1)
        .offset(x: x)
        .zIndex(-d)
        .onTapGesture { if k == 0 { if !launching { primaryAction(g) } } else { library.selectedID = g.id } }
        .accessibilityLabel(g.name)
    }

    /// The selected game below the cases: its console and place in the list, its name, its status and Play / Manage, as the hero shows them.
    @ViewBuilder private func carouselDetails(_ g: LibraryGame, index: Int, count: Int) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Text(CaseStyle.label(ConsoleFilter.console(of: g) == .switch2).uppercased())
                    .font(.manrope(12, .semibold)).tracking(1.6).foregroundStyle(LauncherPalette.progress)
                status(g)
            }
            Text(g.name).font(.manrope(44, .bold)).tracking(-1.2).lineLimit(1).minimumScaleFactor(0.6)
                .id(g.id).transition(.opacity.combined(with: .move(edge: .bottom)))
            HStack(spacing: 12) {
                Button { if !launching { primaryAction(g) } } label: {
                    Label(g.isReady ? "Play" : "Build game", systemImage: g.isReady ? "play.fill" : "hammer.fill")
                        .font(.manrope(15, .semibold)).padding(.horizontal, 22).padding(.vertical, 11)
                        .foregroundStyle(.black).background(g.isReady ? Color(red: 0.93, green: 0.27, blue: 0.24) : LauncherPalette.ready, in: Capsule())
                }
                .buttonStyle(.plain)
                if g.isReady {   // the game's settings (launch options), as the hero has them
                    Button { optionsFor = g.id } label: {
                        Image(systemName: "slider.horizontal.3").font(.system(size: 15)).frame(width: 42, height: 42)
                            .background(Color.white.opacity(0.10), in: Circle()).overlay(Circle().strokeBorder(Color.white.opacity(0.14)))
                    }
                    .buttonStyle(.plain).help(loc.t("launch.title")).accessibilityLabel(loc.t("launch.title"))
                }
                Button { manageOpenFor = manageOpenFor == nil ? g.id : nil } label: { ManageButtonLabel(title: loc.t("library.manage")) }   // ManageMenu.swift
                    .buttonStyle(.plain).accessibilityLabel(loc.t("library.manage"))
                    .anchorPreference(key: ManageAnchorKey.self, value: .bounds) { openCase == nil ? $0 : nil }   // the open case's own Manage button anchors the menu while it is open
                Text("Click the case to open it  ·  drag or scroll to browse").font(.manrope(12)).foregroundStyle(.tertiary)
            }
        }
        .padding(.horizontal, 34).padding(.top, 8)
        .animation(.easeOut(duration: 0.25), value: g.id)
    }
}

/// ← → (↑ ↓) move along, ↩ plays, space opens or shuts the case, esc shuts it (macOS 14 and later; a controller and clicks work everywhere).
struct CarouselKeys: ViewModifier {
    let back: () -> Void, next: () -> Void, enter: () -> Void, space: () -> Void, escape: () -> Void
    func body(content: Content) -> some View {
        if #available(macOS 14.0, *) {
            content.focusable().focusEffectDisabled()
                .onKeyPress(.leftArrow) { back(); return .handled }
                .onKeyPress(.upArrow) { back(); return .handled }
                .onKeyPress(.rightArrow) { next(); return .handled }
                .onKeyPress(.downArrow) { next(); return .handled }
                .onKeyPress(.return) { enter(); return .handled }
                .onKeyPress(.space) { space(); return .handled }
                .onKeyPress(.escape) { escape(); return .handled }
        } else {
            content
        }
    }
}

/// The carousel's background glow: the game's art blurred once into a small picture and kept (a full-size blur every frame was what made the page lag).
enum AmbientGlow {
    private static let cache = NSCache<NSString, NSImage>()
    static func purge() { cache.removeAllObjects() }   // MemoryTrim
    private static let context = CIContext(options: [.cacheIntermediates: false])   // one for all (making one is slow); thread-safe, so CaseArt makes glows in the background
    static func of(_ image: NSImage, key: UUID) -> NSImage {
        if let hit = cache.object(forKey: key.uuidString as NSString) { return hit }
        var rect = CGRect(origin: .zero, size: image.size)
        guard let cg = image.cgImage(forProposedRect: &rect, context: nil, hints: nil) else { return image }
        let small = CIImage(cgImage: cg).transformed(by: CGAffineTransform(scaleX: 96 / CGFloat(max(cg.width, 1)), y: 96 / CGFloat(max(cg.width, 1))))
        let blurred = small.clampedToExtent().applyingGaussianBlur(sigma: 9).cropped(to: small.extent)
        guard let out = context.createCGImage(blurred, from: small.extent) else { return image }
        let result = NSImage(cgImage: out, size: NSSize(width: out.width, height: out.height))
        cache.setObject(result, forKey: key.uuidString as NSString)
        return result
    }
}
