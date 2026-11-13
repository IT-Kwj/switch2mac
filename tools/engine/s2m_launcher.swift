// (switch2mac) The settings window a game built by Hermit shows before it starts, when it is opened from Finder, the Dock or Spotlight: the same "Ready to play"
// screen as Hermit's own (its Play opens it there and starts the game with DM_LAUNCHER=0, so this window does not show twice). tools/engine/patch.py puts this
// file in place of nxnative's dm/mac/Launcher.swift when the engine's launcher model (dm/ios/Sources/LauncherSettings.swift) has what it reads; an engine without it keeps
// nxnative's own window. Everything else is nxnative's: launch.json's settings, the saved choices (launcher.<VAR> in the app's preferences, which Hermit's sheet
// writes too), launcher.c's handling of 0 / 1 / 2, "hold Option at launch" when the window is switched off. Play (Return) starts the game; the X (Esc, ⌘Q) quits
// without it. The window never takes focus by itself: an app opened in the background (open -g) keeps it behind until the player switches to it
import AppKit
import CoreText
import QuartzCore
import SwiftUI

private func info(_ key: String) -> String? { Bundle.main.object(forInfoDictionaryKey: key) as? String }

// Hermit's interface face, Manrope (SIL OFL 1.1, app/fonts), as base64: hermit.py's launcher_window writes the font into this line when it puts the window in
// place, so the game's window is set as Hermit's sheet is. Left empty (this file on its own), the window uses the system face.
let s2mManrope = ""

private enum S2MFont {   // as Hermit's Typography: the variable font at the weight SwiftUI names, each size and weight made once
    private static let face: CTFontDescriptor? = Data(base64Encoded: s2mManrope).flatMap { $0.isEmpty ? nil : CTFontManagerCreateFontDescriptorFromData($0 as CFData) }
    private struct Key: Hashable { let size: CGFloat; let weight: Font.Weight }
    private static var made: [Key: Font] = [:]
    private static func axis(_ w: Font.Weight) -> CGFloat {
        switch w {
        case .ultraLight: return 200
        case .thin, .light: return 300
        case .medium: return 500
        case .semibold: return 600
        case .bold: return 700
        case .heavy, .black: return 800
        default: return 400
        }
    }
    static func f(_ size: CGFloat, _ weight: Font.Weight = .regular) -> Font {
        let key = Key(size: size, weight: weight)
        if let font = made[key] { return font }
        var font = Font.system(size: size, weight: weight)
        if let face {
            let v = CTFontDescriptorCreateCopyWithAttributes(face, [kCTFontVariationAttribute: [0x7767_6874: axis(weight)]] as CFDictionary)
            font = Font(CTFontCreateWithFontDescriptor(v, size, nil))
        }
        made[key] = font
        return font
    }
}

// A switch that sets other settings while it is on (launcher.c's presets): those rows show the value it sets and can't be changed, so the window never says 60 fps
// while frame generation runs the game at 30
private let s2mPresets: [(on: String, sets: [String: String])] = [
    ("DM_FRAMEGEN", ["DM_FPS_TARGET": "30"]),                                // framegen_preset
    ("DM_FAST_720", ["DM_RENDER_SCALE": "0.82", "DM_UPSCALER": "metalfx"]),  // fast_preset
]

private enum S2M {   // Hermit's colours (app/Sources/NXLauncher/LauncherPalette.swift)
    static let background = Color(red: 0.055, green: 0.055, blue: 0.06)
    static let surface = Color(red: 0.10, green: 0.10, blue: 0.11)
    static let green = Color(red: 0.25, green: 0.84, blue: 0.47)
    static let red = Color(red: 0.92, green: 0.27, blue: 0.27)
    static let off = Color(red: 0.86, green: 0.24, blue: 0.24)
    static let controlWidth: CGFloat = 230
}

private struct S2MSwitch: ToggleStyle {   // Hermit's switch: green on, red off, a dark knob
    @Environment(\.isEnabled) private var enabled
    func makeBody(configuration: Configuration) -> some View {
        Button { withAnimation(.spring(response: 0.25, dampingFraction: 0.8)) { configuration.isOn.toggle() } } label: {
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                Capsule().fill(configuration.isOn ? S2M.green : S2M.off)
                Circle().fill(S2M.background).padding(3).shadow(color: .black.opacity(0.3), radius: 2, y: 1)
            }
            .frame(width: 40, height: 24).contentShape(Capsule())
        }
        .buttonStyle(.plain).opacity(enabled ? 1 : 0.45)
    }
}

private struct S2MSegmented: View {   // a choice of a few short options: one pill each, the chosen one green
    let options: [[String]]
    let selection: String
    let pick: (String) -> Void
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options, id: \.self) { o in
                let on = o[0] == selection
                Button { pick(o[0]) } label: {
                    Text(o.count > 1 ? o[1] : o[0]).font(S2MFont.f(13, .semibold)).lineLimit(1).minimumScaleFactor(0.8)
                        .foregroundStyle(on ? Color.black : Color.primary)
                        .frame(maxWidth: .infinity).padding(.vertical, 7)
                        .background(on ? S2M.green : Color.clear, in: Capsule()).contentShape(Capsule())
                }
                .buttonStyle(.plain)
            }
        }
        .padding(3).background(Color.white.opacity(0.06), in: Capsule()).overlay(Capsule().strokeBorder(Color.white.opacity(0.08)))
    }
}

private struct S2MDropdown: View {   // a longer choice: a pill with the current option and a chevron, a menu of the rest
    let options: [[String]]
    let selection: String
    let pick: (String) -> Void
    var body: some View {
        let current = options.first { $0[0] == selection }.map { $0.count > 1 ? $0[1] : $0[0] } ?? selection
        Menu {
            ForEach(options, id: \.self) { o in Button(o.count > 1 ? o[1] : o[0]) { pick(o[0]) } }
        } label: {
            HStack {
                Text(current).font(S2MFont.f(13, .semibold)).lineLimit(1)
                Spacer(minLength: 6)
                Image(systemName: "chevron.down").font(.system(size: 10, weight: .bold)).foregroundStyle(.secondary)
            }
            .padding(.horizontal, 16).padding(.vertical, 9)
            .background(Color.white.opacity(0.06), in: Capsule()).overlay(Capsule().strokeBorder(Color.white.opacity(0.08)))
            .contentShape(Capsule())
        }
        .menuStyle(.button).buttonStyle(.plain).menuIndicator(.hidden)
    }
}

private func s2mSectionName(_ s: String) -> String {   // the same headings as the in-game key-2 panel
    switch s {
    case "Game": return "显示"
    case "Controls": return "控制"
    case "Performance": return "性能"
    default: return s
    }
}

struct LauncherView: View {
    @ObservedObject var m: LauncherModel
    let done: (Bool) -> Void
    let fit: (CGFloat) -> Void
    @AppStorage("window.show") private var show = true
    @AppStorage("window.advanced") private var advanced = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // the header in one compact row: the game's icon, the title and the game's name, the X (quit without the game; Esc and ⌘Q too) on the right;
            // the note under it. No row of its own for the X, so nothing above the title but the window's margin
            HStack(alignment: .center, spacing: 14) {
                Image(nsImage: NSApp.applicationIconImage).resizable().interpolation(.high).aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 11, style: .continuous))
                    .accessibilityHidden(true)
                VStack(alignment: .leading, spacing: 2) {
                    Text("准备开玩").font(S2MFont.f(24, .heavy)).tracking(-0.5).lineLimit(1)
                    Text(info("CFBundleName") ?? "Game").font(S2MFont.f(14)).foregroundStyle(.secondary).lineLimit(1).truncationMode(.tail)
                }
                Spacer(minLength: 8)
                Button { done(false) } label: {
                    Image(systemName: "xmark").font(.system(size: 12, weight: .bold)).foregroundStyle(.secondary)
                        .frame(width: 30, height: 30).background(Color.white.opacity(0.08), in: Circle()).contentShape(Circle())
                }
                .buttonStyle(.plain).keyboardShortcut(.cancelAction).accessibilityLabel("退出")
            }
            .padding(.horizontal, 30).padding(.top, 24)
            Text("启动前检查游戏设置。进入游戏后可按 2 键修改。")
                .font(S2MFont.f(12.5)).foregroundStyle(.tertiary).fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 30).padding(.top, 12).padding(.bottom, 18)
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    sections(basic: true)
                    if !m.sections(basic: false).isEmpty {
                        card {
                            Button { withAnimation(.easeInOut(duration: 0.18)) { advanced.toggle() } } label: {
                                HStack(spacing: 8) {
                                    Text("高级设置").font(S2MFont.f(14, .medium))
                                    Image(systemName: "chevron.right").font(.system(size: 10, weight: .bold)).foregroundStyle(.secondary)
                                        .rotationEffect(.degrees(advanced ? 90 : 0))
                                    Spacer()
                                    Text("\(m.settings.filter { !$0.basic }.count)").font(S2MFont.f(12)).foregroundStyle(.secondary)
                                }
                                .padding(.horizontal, 18).frame(minHeight: 52).contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                        }
                        if advanced { sections(basic: false) }
                    }
                    CloudSavesCard()
                }
                .padding(.horizontal, 30).padding(.bottom, 24)
            }
            Divider().opacity(0.3)
            HStack(spacing: 14) {
                Toggle("", isOn: $show).toggleStyle(S2MSwitch()).labelsHidden()
                Text(show ? "启动前显示" : "启动前显示（启动时按住 Option 可再次显示）")
                    .font(S2MFont.f(12)).foregroundStyle(.secondary).lineLimit(2)
                Spacer(minLength: 8)
                if m.changed {
                    Button { m.reset() } label: {
                        Text("恢复测试默认值").font(S2MFont.f(13, .semibold)).lineLimit(1).fixedSize()
                            .padding(.horizontal, 16).padding(.vertical, 9)
                            .background(Color.white.opacity(0.06), in: Capsule()).overlay(Capsule().strokeBorder(Color.white.opacity(0.1)))
                    }
                    .buttonStyle(.plain)
                }
                Button { done(true) } label: {   // Play: red, as Hermit's Play
                    HStack(spacing: 7) {
                        Image(systemName: "play.fill").font(.system(size: 12, weight: .bold))
                        Text("开始游戏").font(S2MFont.f(13.5, .bold))
                    }
                    .lineLimit(1).fixedSize()
                    .foregroundStyle(.black).padding(.horizontal, 26).padding(.vertical, 9)
                    .background(S2M.red, in: Capsule())
                }
                .buttonStyle(.plain).keyboardShortcut(.defaultAction)
            }
            .padding(.horizontal, 30).padding(.vertical, 16)
        }
        .frame(minWidth: 560, idealWidth: 600, minHeight: 480)
        .ignoresSafeArea(.container, edges: .top)
        .background(S2M.background)
        .tint(S2M.green)
        .preferredColorScheme(.dark)
    }

    @ViewBuilder private func sections(basic: Bool) -> some View {
        ForEach(m.sections(basic: basic), id: \.self) { section in
            let rows = m.rows(in: section, basic: basic)
            if !rows.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    Text(s2mSectionName(section)).font(S2MFont.f(15, .semibold)).foregroundStyle(.secondary).padding(.leading, 2)
                    card {
                        ForEach(Array(rows.enumerated()), id: \.element.id) { i, s in
                            if i > 0 { Divider().opacity(0.25).padding(.leading, 18) }
                            row(s)
                        }
                    }
                }
            }
        }
    }

    private func card<Content: View>(@ViewBuilder _ content: () -> Content) -> some View {
        VStack(spacing: 0, content: content)
            .background(S2M.surface.opacity(0.75), in: RoundedRectangle(cornerRadius: 14))
            .overlay(RoundedRectangle(cornerRadius: 14).strokeBorder(Color.white.opacity(0.06)))
    }

    /// The value a preset that is on sets for this row, and the preset's name ("Frame generation"), or nil.
    private func preset(_ env: String) -> (value: String, by: String)? {
        for p in s2mPresets {
            guard let v = p.sets[env], let s = m.settings.first(where: { $0.env == p.on }), (m.values[p.on] ?? s.def) == s.onValue else { continue }
            return (v, s.label.components(separatedBy: " (").first ?? s.label)
        }
        return nil
    }

    @ViewBuilder private func row(_ s: Setting) -> some View {
        let set = preset(s.env)
        let value = set?.value ?? m.values[s.env] ?? s.def
        let fixed = m.fixed.contains(s.env) || set != nil
        HStack(alignment: .center, spacing: 16) {
            VStack(alignment: .leading, spacing: 3) {
                Text(s.label).font(S2MFont.f(14, .medium))
                if s.kind == "range" {
                    Text(m.rangeLabel(s, Double(value) ?? 1)).font(S2MFont.f(12)).foregroundStyle(.secondary)
                } else if !s.note.isEmpty {
                    Text(s.note).font(S2MFont.f(12)).foregroundStyle(.secondary).fixedSize(horizontal: false, vertical: true)
                }
                if let set { Text("开启时由“\(set.by)”设定").font(S2MFont.f(11.5)).foregroundStyle(.tertiary) }
                else if fixed { Text("由启动设置固定，无法在此更改").font(S2MFont.f(11.5)).foregroundStyle(.tertiary) }
            }
            Spacer(minLength: 12)
            control(s, value).frame(width: S2M.controlWidth, alignment: .trailing).disabled(fixed)
        }
        .padding(.horizontal, 18).padding(.vertical, 13).frame(minHeight: 52)
    }

    @ViewBuilder private func control(_ s: Setting, _ value: String) -> some View {
        switch s.kind {
        case "choice":
            let options = s.options ?? []
            let short = options.count <= 3 && options.allSatisfy { ($0.count > 1 ? $0[1] : $0[0]).count <= 12 }
            if short { S2MSegmented(options: options, selection: value) { m.values[s.env] = $0 } }
            else { S2MDropdown(options: options, selection: value) { m.values[s.env] = $0 } }
        case "range":
            let lo = s.min ?? 0, hi = max(s.max ?? 1, lo + 0.0001)
            Slider(value: Binding(get: { Double(value) ?? lo }, set: { m.values[s.env] = String(format: "%.2f", $0) }), in: lo...hi, step: s.step ?? 0.05)
        default:
            Toggle("", isOn: Binding(get: { value == s.onValue }, set: { m.values[s.env] = $0 ? s.onValue : s.offValue })).toggleStyle(S2MSwitch()).labelsHidden()
        }
    }
}

/// Cloud saves, as nxnative's window has them: a folder the save is synced through (dm/host/save_sync.h), kept in this app's preferences as cloudSaves.folder, which launcher.c
/// puts into DM_SAVE_SYNC before the host starts; a DM_SAVE_SYNC an env file or the launch environment set wins, and is shown.
private struct CloudSavesCard: View {
    @AppStorage("cloudSaves.folder") private var folder = ""
    private let fixed: String? = {
        let env = ProcessInfo.processInfo.environment
        let keys = ((env["DM_ENV_FILE_KEYS"] ?? "") + " " + (env["DM_ENV_LAUNCH_KEYS"] ?? "")).split(separator: " ")
        return keys.contains("DM_SAVE_SYNC") || env["DM_SAVE_SYNC"] != nil ? env["DM_SAVE_SYNC"] : nil
    }()
    static let drive = NSHomeDirectory() + "/Library/Mobile Documents/com~apple~CloudDocs"

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            VStack(alignment: .leading, spacing: 3) {
                Text("云存档").font(S2MFont.f(14, .medium))
                Text(fixed.map { "\(Self.shown($0)) (env.txt)" } ?? (folder.isEmpty ? "关闭：存档只保存在这台 Mac" : Self.shown(folder)))
                    .font(S2MFont.f(12)).foregroundStyle(.secondary).lineLimit(1).truncationMode(.head)
            }
            Spacer(minLength: 12)
            if fixed == nil {
                if !folder.isEmpty { Button("关闭") { folder = "" }.buttonStyle(.plain).font(S2MFont.f(13, .semibold)).foregroundStyle(.secondary) }
                Button { choose() } label: {
                    Text(folder.isEmpty ? "选择文件夹…" : "更改…").font(S2MFont.f(13, .semibold)).lineLimit(1).fixedSize()
                        .padding(.horizontal, 16).padding(.vertical, 8)
                        .background(Color.white.opacity(0.06), in: Capsule()).overlay(Capsule().strokeBorder(Color.white.opacity(0.1)))
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 18).padding(.vertical, 13).frame(minHeight: 52)
        .background(S2M.surface.opacity(0.75), in: RoundedRectangle(cornerRadius: 14))
        .overlay(RoundedRectangle(cornerRadius: 14).strokeBorder(Color.white.opacity(0.06)))
    }

    private func choose() {
        let panel = NSOpenPanel()
        panel.canChooseDirectories = true; panel.canChooseFiles = false; panel.allowsMultipleSelection = false; panel.canCreateDirectories = true
        panel.prompt = "用于云存档"
        panel.message = "iPhone 应用在其启动器“云存档”中选择的文件夹"
        panel.directoryURL = URL(fileURLWithPath: folder.isEmpty ? Self.drive : folder)
        if panel.runModal() == .OK, let url = panel.url { folder = url.path }
    }

    static func shown(_ path: String) -> String {   // a path under iCloud Drive as the Finder names it
        guard path == drive || path.hasPrefix(drive + "/") else { return path }
        return (["iCloud Drive"] + path.dropFirst(drive.count).split(separator: "/").map(String.init)).joined(separator: " › ")
    }
}

private final class Launcher: NSObject, NSApplicationDelegate, NSWindowDelegate {
    let model: LauncherModel
    var window: NSWindow?
    var play = false

    init(_ model: LauncherModel) { self.model = model }

    func applicationDidFinishLaunching(_ n: Notification) {
        let name = info("CFBundleName") ?? "Game"
        let menu = NSMenu(), item = NSMenuItem(), app = NSMenu()
        app.addItem(withTitle: "关闭窗口", action: #selector(NSWindow.performClose(_:)), keyEquivalent: "w")
        app.addItem(withTitle: "退出 \(name)", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        item.submenu = app; menu.addItem(item); NSApp.mainMenu = menu
        // Hermit's look: no title bar or window buttons (the X in the view closes it), dark, moved by its background
        let w = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 600, height: 720), styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView], backing: .buffered, defer: false)
        w.title = name; w.isReleasedWhenClosed = false; w.delegate = self
        w.titlebarAppearsTransparent = true; w.titleVisibility = .hidden; w.isMovableByWindowBackground = true
        for b in [NSWindow.ButtonType.closeButton, .miniaturizeButton, .zoomButton] { w.standardWindowButton(b)?.isHidden = true }
        w.appearance = NSAppearance(named: .darkAqua); w.backgroundColor = NSColor(red: 0.055, green: 0.055, blue: 0.06, alpha: 1)
        w.contentMinSize = NSSize(width: 560, height: 480)
        window = w
        if let screen = w.screen ?? NSScreen.main {
            let h = min(720, screen.visibleFrame.height - 40)
            w.setFrame(NSRect(x: screen.visibleFrame.midX - 300, y: screen.visibleFrame.midY - h / 2, width: 600, height: h), display: false)
        }
        w.contentView = NSHostingView(rootView: LauncherView(m: model, done: { [weak self] in self?.finish($0) }, fit: { _ in }))
        // no activation and no ordering in front of another app's windows: LaunchServices activates an app opened from Finder or the Dock (applicationDidBecomeActive), open -g does not
        if NSApp.isActive { w.makeKeyAndOrderFront(nil) } else { w.orderBack(nil) }
    }
    func applicationDidBecomeActive(_ n: Notification) { window?.makeKeyAndOrderFront(nil) }
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {   // ⌘Q, or a logout or restart: the app ends without the game (exit 0, as Quit)
        fputs("launcher: quit without starting the game\n", stderr)
        return .terminateNow
    }
    func windowWillClose(_ n: Notification) { finish(false) }

    func finish(_ play: Bool) {
        guard let w = window else { return }
        window = nil; self.play = play
        // The main thread blocks in launcher.c's waitpid once run() returns, so the window leaves the screen now (no fade-out), and dmMacLauncher flushes the order-out
        w.animationBehavior = .none
        w.delegate = nil; w.orderOut(nil)
        NSApp.stop(nil)
        NSApp.postEvent(NSEvent.otherEvent(with: .applicationDefined, location: .zero, modifierFlags: [], timestamp: 0, windowNumber: 0, context: nil, subtype: 0, data1: 0, data2: 0)!, atStart: true)
    }
}

enum LauncherWindowLayout {   // nxnative's (dm/ios/tests/launcher_layout_check.swift checks it)
    static func fitted(_ frame: NSRect, extraHeight: CGFloat, visible: NSRect) -> NSRect {
        let top = min(frame.maxY, visible.maxY)
        let height = min(frame.height + extraHeight, top - visible.minY)
        return NSRect(x: frame.minX, y: top - height, width: frame.width, height: height)
    }
}

// 1: Play (the window's settings are in the environment), 0: the player quit, 2: no window (no launcher.json, or "Show before playing" off): launcher.c applies the saved choices
@_cdecl("dm_mac_launcher")
public func dmMacLauncher() -> Int32 {
    guard let url = Bundle.main.resourceURL?.appendingPathComponent("dm/launcher.json"), let data = try? Data(contentsOf: url) else { return 2 }
    guard let file = try? JSONDecoder().decode(SettingsFile.self, from: data), !file.settings.isEmpty else { fputs("[RED] launcher: dm/launcher.json cannot be read; starting the game\n", stderr); return 2 }
    if (UserDefaults.standard.object(forKey: "window.show") as? Bool) == false && !NSEvent.modifierFlags.contains(.option) {
        fputs("launcher: settings window off (hold Option at launch to show it)\n", stderr)
        return 2
    }
    let model = LauncherModel(file.settings)
    let app = NSApplication.shared, launcher = Launcher(model)
    app.setActivationPolicy(.regular)
    app.delegate = launcher
    fputs("launcher: \(file.settings.count) settings shown (Hermit's window)\n", stderr)
    app.run()
    CATransaction.flush()
    app.setActivationPolicy(.prohibited)   // the host is the game's app from here on
    guard launcher.play else { fputs("launcher: quit without starting the game\n", stderr); return 0 }
    model.apply()
    return 1
}
