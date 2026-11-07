import SwiftUI
import NXCore
import NXModel
import NXLauncher

/// The Library page of the launcher: the hero, the collection row and the status line of a game. A move out of LauncherView.swift
///, the state stays in LauncherView.
extension LauncherView {
    var libraryPage: some View {
        GeometryReader { geometry in
            if library.games.isEmpty {
                emptyLibrary
            } else if let style = libraryLayout.cases {
                carouselPage(width: geometry.size.width, height: geometry.size.height, style: style)   // CaseCarousel.swift
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        if let game = heroGame {
                            hero(game, width: geometry.size.width, height: max(240, geometry.size.height - collectionHeight))
                        }
                        // The hero takes what the collection leaves: the row's height grows with the window's width (its cards
                        // do, up to 300 pt), so a fixed share left a fullscreen window's cards cut off at the bottom
                        collection(width: geometry.size.width)
                            .background(GeometryReader { g in Color.clear.preference(key: CollectionHeightKey.self, value: g.size.height) })
                    }
                }
                .onPreferenceChange(CollectionHeightKey.self) { h in if h > 0, abs(h - collectionHeight) > 0.5 { collectionHeight = h } }
            }
        }
    }

    var emptyLibrary: some View {
        VStack(alignment: .leading, spacing: 22) {
            Spacer()
            Image(systemName: "gamecontroller").font(.system(size: 44, weight: .light))
                .foregroundStyle(LauncherPalette.cream)
            Text(loc.t("library.welcome")).font(.manrope(54, .bold)).tracking(-1.8)
            Text(loc.t("library.welcomeNote")).font(.manrope(17)).foregroundStyle(.secondary)
                .frame(maxWidth: 490, alignment: .leading).fixedSize(horizontal: false, vertical: true)
            Button { newBuild() } label: {
                Label(loc.t("library.firstBuild"), systemImage: "plus")
                    .font(.manrope(16, .semibold))
                    .padding(.horizontal, 24).padding(.vertical, 15)
                    .foregroundStyle(.black).background(LauncherPalette.cream, in: Capsule())
            }
            .buttonStyle(.plain).padding(.top, 8)
            Button(action: chooseLibraryFolder) {
                Label(loc.t("library.chooseFolder"), systemImage: "folder")
                    .font(.manrope(14)).foregroundStyle(.secondary)
            }.buttonStyle(.plain)
            Spacer()
            Text(loc.t("library.localNote")).font(.manrope(12)).foregroundStyle(.secondary)
        }
        .padding(48).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }

    func hero(_ game: LibraryGame, width: CGFloat, height: CGFloat) -> some View {
        ZStack(alignment: .bottomLeading) {
            if let image = heroArt?.id == game.id ? heroArt?.image : artwork[game.id] {   // the full picture once read, the small one meanwhile
                FullBanner(image: image, width: width, height: height)   // the whole picture, sharp, on the right (BannerFocus.swift)
            } else {
                GameCover(name: game.name, titleID: game.titleID, large: true).frame(width: width, height: height).clipped()   // switch2mac's own cover (GameCover.swift)
            }
            LinearGradient(stops: [.init(color: .clear, location: 0.25),
                                   .init(color: .black.opacity(0.25), location: 0.45),
                                   .init(color: LauncherPalette.background, location: 1)],
                           startPoint: .top, endPoint: .bottom)
            LinearGradient(colors: [.black.opacity(0.24), .clear], startPoint: .leading, endPoint: .trailing)
            VStack(alignment: .leading, spacing: 14) {
                HStack(spacing: 14) {
                    status(game, prominent: true)
                    if game.isReady, let name = installedBuildName(game) {   // switch2mac: which build of a game with several is installed
                        Text(name).font(.manrope(12, .semibold)).foregroundStyle(.white.opacity(0.85))
                            .padding(.horizontal, 10).padding(.vertical, 4)
                            .overlay(Capsule().strokeBorder(Color.white.opacity(0.25)))
                            .help("This game can be built more than one way. Manage → Build with … switches.")
                    }
                    // a newer build of this game is out with changes a player would notice: the tag opens them, with Rebuild
                    if game.isReady, let standing = whatsNew.standings[game.id], standing.state == .behind, !standing.changes.isEmpty {
                        Button { updateInfoFor = game.id } label: {
                            Label("Update available", systemImage: "sparkles")
                                .font(.manrope(12, .semibold)).foregroundStyle(LauncherPalette.progress)
                                .padding(.horizontal, 10).padding(.vertical, 4)
                                .overlay(Capsule().strokeBorder(LauncherPalette.progress.opacity(0.45)))
                                .contentShape(Capsule())
                        }
                        .buttonStyle(.plain)
                        .help("What changed since your build")
                        .popover(isPresented: Binding(get: { updateInfoFor == game.id }, set: { if !$0 { updateInfoFor = nil } }), arrowEdge: .bottom) {
                            UpdateDetails(standing: standing, rebuildDisabled: m.running || game.inputs["base", default: []].isEmpty) {
                                updateInfoFor = nil
                                rebuildForUpdate(game, build: standing.build)
                            }
                        }
                        .padTarget("hero.update", scope: "main", radius: 12) { updateInfoFor = game.id }
                    }
                    if toolsAge.older.contains(game.id) && !(m.running && activeBuildID == game.id) {
                        Button { configureBuild(game) } label: {
                            Label(loc.t("library.rebuildShort"), systemImage: "arrow.clockwise")
                                .font(.manrope(12, .semibold)).foregroundStyle(LauncherPalette.cream)
                                .padding(.horizontal, 10).padding(.vertical, 4)
                                .overlay(Capsule().strokeBorder(LauncherPalette.cream.opacity(0.35)))
                                .contentShape(Capsule())
                        }
                        .buttonStyle(.plain).disabled(m.running || game.inputs["base", default: []].isEmpty)
                        .help(loc.t("library.olderToolsHelp"))
                        .padTarget("hero.rebuild", scope: "main", radius: 12) { if !m.running { configureBuild(game) } }
                    }
                }
                Text(game.name).font(.manrope(min(68, width * 0.052), .heavy))
                    .tracking(-1.6).lineLimit(2).shadow(color: .black.opacity(0.25), radius: 12)
                HStack(spacing: 18) {
                    Button { primaryAction(game) } label: {
                        LauncherHeroActionLabel(
                            title: game.primary == .play ? loc.t("library.play")
                                : (game.primary == .openOnDevice ? String(format: loc.t("dev.open"), devices.deviceName(game.installedDevice))
                                   : loc.t("library.newBuild")),
                            symbol: game.primary == .play ? "play.fill" : (game.primary == .openOnDevice ? "iphone" : "hammer.fill"),
                            fill: game.primary == .play ? LauncherPalette.building : LauncherPalette.cream)
                    }
                    .buttonStyle(.plain).disabled(launching || (m.running && !game.isReady))
                    .keyboardShortcut(.return, modifiers: [])
                    .padTarget("hero.play", scope: "main", radius: 30) { if !launching { primaryAction(game) } }
                    if game.isReady {
                        Button { optionsFor = game.id } label: {
                            Image(systemName: "slider.horizontal.3").font(.system(size: 17))
                                .frame(width: 48, height: 48)
                                .background(Color.white.opacity(0.10), in: Circle())
                                .overlay(Circle().strokeBorder(Color.white.opacity(0.14)))
                        }
                        .buttonStyle(.plain).help(loc.t("launch.title")).accessibilityLabel(loc.t("launch.title"))
                        .padTarget("hero.options", scope: "main", radius: 24) { optionsFor = game.id }
                    }
                    Button { manageOpenFor = manageOpenFor == nil ? game.id : nil } label: { ManageButtonLabel(title: loc.t("library.manage")) }
                        .buttonStyle(.plain).accessibilityLabel(loc.t("library.manage"))
                        .anchorPreference(key: ManageAnchorKey.self, value: .bounds) { $0 }
                        .padTarget("hero.manage", scope: "main", radius: 12) { manageOpenFor = game.id }
                }
                // A free Apple ID's provisioning profile lasts 7 days. Say when this app's runs out, and offer the
                // re-sign at any time: renewing early (before a trip, say) is as valid as renewing just in time.
                if game.onDevice && !game.isOlderIOSBuild {
                    HStack(spacing: 10) {
                        Image(systemName: "checkmark.seal").font(.system(size: 12))
                            .foregroundStyle(LauncherPalette.cream.opacity(0.7))
                        Text(signatureExpiry[game.id].map { AppSignature.describe($0, loc.t) } ?? loc.t("dev.expiryUnknown"))
                            .font(.manrope(12.5))
                            .foregroundStyle(signatureExpiry[game.id].map { AppSignature.isUrgent($0) } == true
                                             ? LauncherPalette.building : .secondary)
                        Button { resign(game) } label: {
                            Text(loc.t("dev.resign")).font(.manrope(12, .semibold))
                                .foregroundStyle(LauncherPalette.cream)
                                .padding(.horizontal, 10).padding(.vertical, 4)
                                .overlay(Capsule().strokeBorder(LauncherPalette.cream.opacity(0.35)))
                                .contentShape(Capsule())
                        }
                        .buttonStyle(.plain).disabled(m.running)
                        .help(loc.t("dev.resignHelp"))
                        .padTarget("hero.resign", scope: "main", radius: 12) { if !m.running { resign(game) } }
                    }
                }
                if let resignNote {
                    Text(resignNote).font(.manrope(12)).foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(.horizontal, 34).padding(.bottom, 34)
        }
        .frame(width: width, height: height).clipped()
        .task(id: game.id) {   // the hero's banner at full size, read in the background; only one is kept
            guard heroArt?.id != game.id else { return }
            let repo = m.repo.path
            let full = await Task.detached(priority: .userInitiated) { GameLibrary.artworkURL(for: game, repo: repo).flatMap { BoxArtStore.load($0, maxPixels: 1920) } }.value
            if let full, !Task.isCancelled { heroArt = (game.id, full) }
        }
    }

    /// The Library's heading and its switches: the layout, the console, the build filter and the count (the row, the covers and the carousel share them).
    var libraryControls: some View {
            HStack(spacing: 16) {
            Text(loc.t("library.collection")).font(.manrope(28, .bold)).tracking(-0.6)
            LauncherSegmented(options: LibraryLayout.allCases.map { ($0.rawValue, $0.label) }, selection: libraryLayout.rawValue) { v in
                let l = LibraryLayout(rawValue: v) ?? .row
                withAnimation(.easeInOut(duration: 0.2)) { libraryLayout = l }; l.save()
            }
            .frame(width: 440)   // five views, each label whole, beside the heading (the filters stay on the right)
            .padTarget("library.layout", scope: "main", radius: 17,   // a controller: A takes the next view, left and right step through them
                       activate: { stepLayout(1, wrap: true) }, adjust: { stepLayout($0) })
            Spacer()
            if ConsoleFilter.mixed(library.games) {   // Switch 1 and Switch 2 games in one library: which to show
                LauncherSegmented(options: ConsoleFilter.allCases.map { ($0.rawValue, loc.t($0.labelKey)) },
                                  selection: consoleFilter.rawValue) { setConsoleFilter(ConsoleFilter(rawValue: $0) ?? .all) }
                    .frame(width: LauncherControl.width * 1.3)
                    .padTarget("library.console", scope: "main", radius: 17, activate: { stepConsole(1, wrap: true) }, adjust: { stepConsole($0) })
            }
            LauncherSegmented(options: LibraryFilter.allCases.map { ($0.rawValue, loc.t($0.labelKey)) },
                              selection: libraryFilter.rawValue) { setLibraryFilter(LibraryFilter(rawValue: $0) ?? .owned) }
                .frame(width: LauncherControl.width)
                .padTarget("library.filter", scope: "main", radius: 17,
                           activate: { setLibraryFilter(libraryFilter == .owned ? .built : .owned) },
                           adjust: { d in   // past either end the focus moves on to the next control
                               let want: LibraryFilter = d > 0 ? .built : .owned
                               if want == libraryFilter { padFocus.move(dx: CGFloat(d), dy: 0) } else { setLibraryFilter(want) }
                           })
            Text(String(format: loc.t("library.gameCount"), library.games.filter(shows).count))
                .font(.manrope(12)).foregroundStyle(.secondary)
        }
    }

    /// A controller on the view switch: left and right take the previous or next view, as a click would; past either end the focus moves on to the
    /// control beside it. A takes the next view, round to the first.
    func stepLayout(_ by: Int, wrap: Bool = false) {
        let all = LibraryLayout.allCases, at = all.firstIndex(of: libraryLayout) ?? 0
        guard wrap || all.indices.contains(at + by) else { padFocus.move(dx: CGFloat(by), dy: 0); return }
        let l = all[(at + by + all.count) % all.count]
        withAnimation(.easeInOut(duration: 0.2)) { libraryLayout = l }; l.save()
    }
    /// A controller on the console switch (All, Switch, Switch 2), the same way.
    func stepConsole(_ by: Int, wrap: Bool = false) {
        let all = ConsoleFilter.allCases, at = all.firstIndex(of: consoleFilter) ?? 0
        guard wrap || all.indices.contains(at + by) else { padFocus.move(dx: CGFloat(by), dy: 0); return }
        setConsoleFilter(all[(at + by + all.count) % all.count])
    }

    func collection(width: CGFloat) -> some View {
        let cardWidth = min(300, max(190, (width - 124) / 5))
        let step = cardWidth + 14
        let _ = { row.cardStep = step; row.onPass = { InterfaceSound.ticks($0) } }()   // a click for every card the row passes, as the shelves do
        let games = filteredGames
        let heroID = heroGame?.id
        return VStack(alignment: .leading, spacing: 18) {
            libraryControls
            if games.isEmpty {
                Text(loc.t("library.noResults")).foregroundStyle(.secondary).padding(.vertical, 28)
            } else if libraryLayout == .covers {
                coverGrid(games, width: width, heroID: heroID)
            } else {
                ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 14) {
                            ForEach(games) { game in
                                let _ = LauncherWork.count(.card)
                                Button { library.selectedID = game.id } label: {
                                    VStack(alignment: .leading, spacing: 8) {
                                        ZStack {
                                            if let image = artwork[game.id] {
                                                Image(nsImage: image).resizable().scaledToFill()
                                            } else {
                                                cardCover(game)   // switch2mac's own cover (GameCover.swift)
                                            }
                                        }
                                        .frame(width: cardWidth, height: cardWidth / 1.8).clipped()
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                        .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(
                                            game.id == heroID ? LauncherPalette.cream : .clear, lineWidth: 2))
                                        Text(game.name).font(.manrope(16, .semibold)).lineLimit(1)
                                        status(game)
                                        Capsule().fill(game.id == heroID ? LauncherPalette.cream : .clear)
                                            .frame(height: 3).padding(.top, 4)
                                    }
                                    .frame(width: cardWidth, alignment: .leading).contentShape(Rectangle())
                                }
                                .buttonStyle(.plain)
                                .accessibilityAddTraits(game.id == heroID ? .isSelected : [])
                                .padTarget("card." + game.id.uuidString, scope: "main", radius: 7) { if !launching { primaryAction(game) } }
                            }
                        }
                        // Room for the controller's focus ring, which sits 4 pt outside a card: the row clips at its edges, so it
                        // gets the room inside and gives it back outside (the cards stay where they were)
                        .padding(.horizontal, Self.ringRoom).padding(.top, Self.ringRoom).padding(.bottom, 5 + Self.ringRoom)
                        .background(EnclosingScrollView(row: row))
                    }
                    .padding(.horizontal, -Self.ringRoom).padding(.vertical, -Self.ringRoom)
                    .onChange(of: padFocus.focused) { id in   // the focused card scrolls into the row's view
                        guard let id, id.hasPrefix("card.") else { return }
                        withAnimation(.easeInOut(duration: 0.25)) { proxy.scrollTo(id, anchor: .center) }
                    }
                }
                    .overlay(alignment: .topLeading) {
                        if row.canBack {
                            pager("chevron.left", height: cardWidth / 1.8) { row.page(-1, step: step) }.offset(x: -22)
                        }
                    }
                    .overlay(alignment: .topTrailing) {
                        if row.canForward {
                            pager("chevron.right", height: cardWidth / 1.8) { row.page(1, step: step) }.offset(x: 22)
                        }
                    }
            }
        }
        .padding(.horizontal, 34).padding(.top, 8).padding(.bottom, 22)
    }

    /// Every game as a cover (CoverArt.swift), as many to a line as the window fits: the whole library at a glance, for a big one. A click selects the game
    /// (the hero above shows it), as a card in the row does.
    func coverGrid(_ games: [LibraryGame], width: CGFloat, heroID: UUID?) -> some View {
        let inner = width - 68, coverW = min(190, max(130, (inner - 14 * 5) / 6))
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: coverW, maximum: coverW + 30), spacing: 16, alignment: .top)], alignment: .leading, spacing: 22) {
            ForEach(games) { game in
                Button { library.selectedID = game.id } label: {
                    VStack(alignment: .leading, spacing: 7) {
                        CoverImage(game: game, image: artwork[game.id], focus: bannerFocus[game.id], width: coverW, box: boxArt[game.id])
                            .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(game.id == heroID ? LauncherPalette.cream : .clear, lineWidth: 2))
                            .shadow(color: .black.opacity(0.35), radius: 8, y: 4)
                        Text(game.name).font(.manrope(13.5, .semibold)).lineLimit(2).frame(width: coverW, alignment: .leading)
                        status(game)
                    }
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .accessibilityAddTraits(game.id == heroID ? .isSelected : [])
                .padTarget("card." + game.id.uuidString, scope: "main", radius: 7) { if !launching { primaryAction(game) } }
            }
        }
    }

    /// A round button floating over the row's edge, centred on the artwork, shown while the row scrolls that way.
    func pager(_ symbol: String, height: CGFloat, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: symbol).font(.system(size: 16, weight: .semibold)).foregroundStyle(.white)
                .frame(width: 44, height: 44)
                .background(Color.black.opacity(0.72), in: Circle())
                .overlay(Circle().strokeBorder(Color.white.opacity(0.16)))
                .shadow(color: .black.opacity(0.4), radius: 10)
                .contentShape(Circle())
        }
        .buttonStyle(.plain)
        .frame(height: height)
        .accessibilityLabel(loc.t(symbol == "chevron.left" ? "library.scrollBack" : "library.scrollForward"))
        .transition(.opacity)
    }

    /// switch2mac: the installed build's name, for a game with several builds (GameBuilds); nil otherwise.
    func installedBuildName(_ game: LibraryGame) -> String? {
        let all = GameBuilds.list(titleID: game.titleID, repo: m.repo.path)
        guard !all.isEmpty else { return nil }
        let id = GameBuilds.installed(titleID: game.titleID) ?? all[0].id   // a game installed before the note was written: the first build, switch2mac's
        return all.first { $0.id == id }?.name
    }

    func status(_ game: LibraryGame, prominent: Bool = false) -> some View {
        let building = m.running && activeBuildID == game.id
        let color = building ? LauncherPalette.building : ((game.isReady || game.hasIOSBuild) ? LauncherPalette.ready : LauncherPalette.unbuilt)
        let key = building ? "library.building" : (game.isReady ? "library.ready" : (game.hasIOSBuild ? (game.isOlderIOSBuild ? "library.olderIOS" : "library.readyIOS") : "library.notBuilt"))
        return HStack(spacing: 7) {
            Circle().fill(color).frame(width: prominent ? 9 : 7, height: prominent ? 9 : 7)
            Text(prominent ? loc.t(key).uppercased() : loc.t(key))
                .font(prominent ? .manrope(12, .bold) : .manrope(13, .medium))
                .tracking(prominent ? 1.3 : 0)   // the eyebrow: the same face, in tracked capitals
                .foregroundStyle(color)
            if GameFolder.profileIsSwitch2(game.titleID, engineRoot: EngineLayout.root(m.repo.path)) {   // #445
                Text(loc.t("switch2.badge"))
                    .font(.manrope(prominent ? 11 : 10.5, .bold)).foregroundStyle(LauncherPalette.cream.opacity(0.85))
                    .padding(.horizontal, 7).padding(.vertical, 2)
                    .overlay(Capsule().strokeBorder(LauncherPalette.cream.opacity(0.35)))
                    .help(loc.t("switch2.help"))
            }
            if !building && toolsAge.older.contains(game.id) {   // a quiet note beside the status, not a warning
                Text("· " + loc.t(prominent ? "library.olderTools" : "library.olderToolsShort"))
                    .font(.manrope(prominent ? 13 : 12)).foregroundStyle(.secondary).lineLimit(1)
                    .help(loc.t("library.olderToolsHelp"))
            }
        }
        .accessibilityElement(children: .combine)
    }
}
