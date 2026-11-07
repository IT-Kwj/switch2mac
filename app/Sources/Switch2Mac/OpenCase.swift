import AppKit
import SceneKit
import SwiftUI
import NXLauncher

// "Open case": the selected game's case, up close. It comes forward, opens like a book (the cover swings left on its spine), the instruction
// booklet slides out on the left and the cartridge out on the right; drag turns it, scroll zooms, Flip shows its back, Close case shuts it again.
// After PyroCade's open-case view (Pyrodrifter/PyroCade, MIT); the scene is switch2mac's own, and like the carousel it is drawn only while
// something moves.

/// What the page's buttons and keys tell the open case to do; the scene's coordinator registers itself here.
final class OpenCaseControl {
    let item: CaseItem
    let gameID: UUID
    fileprivate weak var scene: OpenCaseView.Coordinator?
    fileprivate var closing = false
    var onPlay: () -> Void = {}   // a click on the case: play (or build) the game
    var onBack: () -> Void = {}   // a click anywhere off the case: shut it and go back
    init(item: CaseItem, gameID: UUID) { self.item = item; self.gameID = gameID }

    func flip() { scene?.flip() }
    /// Shuts the case (the booklet and cartridge back in, the cover over them), then `done`.
    func close(_ done: @escaping () -> Void) {
        guard !closing else { return }
        closing = true
        if let scene { scene.close(done) } else { done() }
    }
}

/// An SCNView that hands its scroll wheel to the scene (zoom).
final class OpenCaseSCNView: SCNView {
    var onScroll: (CGFloat) -> Void = { _ in }
    override func scrollWheel(with event: NSEvent) { onScroll(event.scrollingDeltaY * (event.hasPreciseScrollingDeltas ? 0.004 : 0.04)) }
}

struct OpenCaseView: NSViewRepresentable {
    let control: OpenCaseControl

    static let w = CaseSceneView.caseW, h = CaseSceneView.caseH, d = CaseSceneView.caseD

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeNSView(context: Context) -> OpenCaseSCNView {
        let v = OpenCaseSCNView(); v.backgroundColor = .clear; v.antialiasingMode = .multisampling2X
        v.preferredFramesPerSecond = 120; v.rendersContinuously = false; v.isPlaying = false
        let scene = SCNScene(); scene.background.contents = NSColor.clear; scene.isPaused = true; v.scene = scene
        let cam = SCNNode(); cam.camera = SCNCamera(); cam.camera?.fieldOfView = 30
        cam.position = SCNVector3(0, 0.05, 3.1); cam.look(at: SCNVector3(0, 0, 0)); scene.rootNode.addChildNode(cam)
        let key = SCNNode(); key.light = SCNLight(); key.light?.type = .directional; key.light?.intensity = 950; key.eulerAngles = SCNVector3(-0.4, 0.35, 0)
        let rim = SCNNode(); rim.light = SCNLight(); rim.light?.type = .directional; rim.light?.intensity = 380; rim.eulerAngles = SCNVector3(-0.2, -2.6, 0)
        let fill = SCNNode(); fill.light = SCNLight(); fill.light?.type = .ambient; fill.light?.intensity = 480
        [cam, key, rim, fill].forEach { if $0.parent == nil { scene.rootNode.addChildNode($0) } }
        let c = context.coordinator
        c.view = v; c.camera = cam; c.control = control; control.scene = c
        c.build(control.item, in: scene.rootNode)
        v.onScroll = { [weak c] dy in c?.zoom(dy) }
        v.addGestureRecognizer(NSPanGestureRecognizer(target: c, action: #selector(Coordinator.dragged(_:))))
        v.addGestureRecognizer(NSClickGestureRecognizer(target: c, action: #selector(Coordinator.clicked(_:))))
        c.open()
        return v
    }

    func updateNSView(_ v: OpenCaseSCNView, context: Context) {}
    static func dismantleNSView(_ v: OpenCaseSCNView, coordinator: Coordinator) { coordinator.stop(); CaseSceneView.retire(v) }   // stopped and let go (CaseScene.swift)

    final class Coordinator: NSObject {
        weak var view: SCNView?
        weak var control: OpenCaseControl?
        var camera: SCNNode?
        let turntable = SCNNode()   // turned by dragging and Flip
        let body = SCNNode()        // the case, moved right as it opens so the open pair stays in the middle
        let hinge = SCNNode()       // the spine: the cover turns about it
        var booklet: SCNNode?
        var cartridge: SCNNode?
        private var busyUntil = Date.distantPast
        private var check: Timer?
        private var yaw: CGFloat = 0, pitch: CGFloat = 0, dragStart: (CGFloat, CGFloat) = (0, 0)

        // MARK: building

        func build(_ item: CaseItem, in root: SCNNode) {
            let w = OpenCaseView.w, h = OpenCaseView.h, d = OpenCaseView.d
            let shell = CaseSceneView.shellColor(item.switch2)
            let red = CaseSceneView.plastic(shell)
            let art = CaseArt.cached(item)
            // the tray: the case's back half, its inside a cartridge holder
            let tray = SCNBox(width: w, height: h, length: d * 0.8, chamferRadius: 0.008)
            let inside = CaseSceneView.plastic(shell); inside.diffuse.contents = Pictures.tray(shell)
            let back = CaseSceneView.plastic(shell); back.diffuse.contents = Pictures.back(item.name, shell)
            let spine = CaseSceneView.plastic(shell); if let art { spine.diffuse.contents = art.spine }
            tray.materials = [inside, red, back, spine, red, red]
            let trayNode = SCNNode(geometry: tray); trayNode.position = SCNVector3(0, 0, -d * 0.1)
            body.addChildNode(trayNode)
            // the cover: hinged at the spine, the box front outside, the booklet's clips inside
            let cover = SCNBox(width: w, height: h, length: 0.014, chamferRadius: 0.006)
            let front = SCNMaterial(); front.lightingModel = .physicallyBased; front.roughness.contents = 0.22
            front.diffuse.contents = art?.front ?? shell
            let lining = CaseSceneView.plastic(shell); lining.diffuse.contents = Pictures.lining(shell)
            cover.materials = [front, red, lining, red, red, red]
            let coverNode = SCNNode(geometry: cover); coverNode.position = SCNVector3(w / 2, 0, 0)
            hinge.position = SCNVector3(-w / 2, 0, d * 0.3 + 0.008)
            hinge.addChildNode(coverNode); body.addChildNode(hinge)
            // the booklet, lying on the inside of the cover (its picture on the side that faces out once the cover is open)
            let book = SCNBox(width: w * 0.86, height: h * 0.9, length: 0.006, chamferRadius: 0.003)
            let page = SCNMaterial(); page.lightingModel = .physicallyBased; page.roughness.contents = 0.5
            page.diffuse.contents = Pictures.booklet(art?.front, item.switch2)
            let paper = CaseSceneView.plastic(NSColor(white: 0.93, alpha: 1), roughness: 0.6)
            book.materials = [paper, paper, page, paper, paper, paper]
            let bookNode = SCNNode(geometry: book); bookNode.position = SCNVector3(w / 2, 0, -0.012); bookNode.opacity = 0
            hinge.addChildNode(bookNode); booklet = bookNode
            // the cartridge, in its holder until the case is open
            let cart = CaseSceneView.cartridgeNode(item)
            cart.position = SCNVector3(0, 0, d * 0.3 - 0.004); cart.opacity = 0
            body.addChildNode(cart); cartridge = cart
            turntable.addChildNode(body); root.addChildNode(turntable)
            turntable.scale = SCNVector3(0.7, 0.7, 0.7); turntable.opacity = 0
            yaw = -0.12; turntable.eulerAngles = SCNVector3(0, yaw, 0)
        }

        // MARK: moving

        private func run(_ seconds: TimeInterval) {
            busyUntil = max(busyUntil, Date().addingTimeInterval(seconds))
            guard let v = view else { return }
            if !v.isPlaying { v.isPlaying = true; v.scene?.isPaused = false }
            if check == nil {
                check = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
                    guard let self, let v = self.view, Date() >= self.busyUntil else { return }
                    v.isPlaying = false; v.scene?.isPaused = true; v.setNeedsDisplay(v.bounds); self.check?.invalidate(); self.check = nil
                }
            }
        }
        private func redraw() { view.map { $0.setNeedsDisplay($0.bounds) } }
        func stop() { check?.invalidate(); check = nil }

        private static func eased(_ a: SCNAction, _ mode: SCNActionTimingMode = .easeInEaseOut) -> SCNAction { a.timingMode = mode; return a }

        func open() {
            let w = OpenCaseView.w, d = OpenCaseView.d
            turntable.runAction(.group([Self.eased(.scale(to: 1, duration: 0.45), .easeOut), .fadeIn(duration: 0.3)]))
            hinge.runAction(.sequence([.wait(duration: 0.4), Self.eased(.rotateTo(x: 0, y: -.pi + 0.12, z: 0, duration: 0.75))]))
            body.runAction(.sequence([.wait(duration: 0.4), Self.eased(.move(to: SCNVector3(0.15, 0, 0), duration: 0.75))]))   // the open cover, tray and cartridge centred
            booklet?.runAction(.sequence([.wait(duration: 0.9), .fadeIn(duration: 0.01),
                                          Self.eased(.move(to: SCNVector3(w / 2 + 0.11, -0.02, -0.02), duration: 0.5), .easeOut)]))
            cartridge?.runAction(.sequence([.wait(duration: 1.0), .fadeIn(duration: 0.15),
                                            Self.eased(.group([.move(to: SCNVector3(w / 2 + 0.2, 0.14, d * 0.5), duration: 0.55),
                                                               .rotateTo(x: 0, y: -0.18, z: 0, duration: 0.55)]), .easeOut)]))
            run(1.7)
        }

        func close(_ done: @escaping () -> Void) {
            let d = OpenCaseView.d
            cartridge?.runAction(.sequence([Self.eased(.group([.move(to: SCNVector3(0, 0, d * 0.3 - 0.004), duration: 0.35), .rotateTo(x: 0, y: 0, z: 0, duration: 0.35)])),
                                            .fadeOut(duration: 0.05)]))
            booklet?.runAction(.sequence([Self.eased(.move(to: SCNVector3(OpenCaseView.w / 2, 0, -0.012), duration: 0.3)), .fadeOut(duration: 0.01)]))
            hinge.runAction(.sequence([.wait(duration: 0.3), Self.eased(.rotateTo(x: 0, y: 0, z: 0, duration: 0.6))]))
            body.runAction(.sequence([.wait(duration: 0.3), Self.eased(.move(to: SCNVector3Zero, duration: 0.6))]))
            turntable.runAction(.sequence([.wait(duration: 0.9), .group([Self.eased(.scale(to: 0.75, duration: 0.3)), .fadeOut(duration: 0.3)]),
                                           .run { _ in DispatchQueue.main.async(execute: done) }]))
            run(1.3)
        }

        func flip() {
            yaw += .pi
            turntable.runAction(Self.eased(.rotateTo(x: pitch, y: yaw, z: 0, duration: 0.7, usesShortestUnitArc: false)))
            run(0.8)
        }

        func zoom(_ dy: CGFloat) {
            guard let cam = camera else { return }
            cam.position.z = min(4.5, max(1.7, cam.position.z - dy)); redraw()
        }

        /// On the case (its cover, tray, booklet or cartridge): play. Anywhere else: back to the shelf.
        @objc func clicked(_ g: NSClickGestureRecognizer) {
            guard let v = view, let control, !control.closing else { return }
            let hit = v.hitTest(g.location(in: v), options: [.searchMode: SCNHitTestSearchMode.closest.rawValue]).first?.node
            var n = hit
            while let cur = n, cur !== turntable { n = cur.parent }
            if n != nil { control.onPlay() } else { control.onBack() }
        }

        @objc func dragged(_ g: NSPanGestureRecognizer) {
            guard let v = view else { return }
            if g.state == .began { dragStart = (yaw, pitch) }
            let t = g.translation(in: v)
            yaw = dragStart.0 + t.x * 0.008
            pitch = min(0.5, max(-0.5, dragStart.1 - t.y * 0.005))
            turntable.removeAllActions()
            turntable.eulerAngles = SCNVector3(pitch, yaw, 0); redraw()
        }
    }

    /// The case's inside pictures, drawn once per colour (no art from the game except where noted).
    enum Pictures {
        private static let cache = NSCache<NSString, NSImage>()
        private static func make(_ key: String, _ size: NSSize, _ draw: @escaping (NSRect) -> Void) -> NSImage {
            if let hit = cache.object(forKey: key as NSString) { return hit }
            let img = NSImage(size: size, flipped: true) { r in draw(r); return true }
            cache.setObject(img, forKey: key as NSString)
            return img
        }

        /// The tray's inside: the plastic with a recessed holder for the cartridge in the middle.
        static func tray(_ shell: NSColor) -> NSImage {
            make("tray-\(shell.description)", NSSize(width: 618, height: 1000)) { r in
                (shell.blended(withFraction: 0.08, of: .white) ?? shell).setFill(); r.fill()
                let slot = NSRect(x: r.midX - 70, y: r.midY - 125, width: 140, height: 250)
                (shell.blended(withFraction: 0.22, of: .black) ?? shell).setFill(); NSBezierPath(roundedRect: slot, xRadius: 16, yRadius: 16).fill()
                NSColor.black.withAlphaComponent(0.25).setStroke()
                let p = NSBezierPath(roundedRect: slot.insetBy(dx: 2, dy: 2), xRadius: 15, yRadius: 15); p.lineWidth = 4; p.stroke()
            }
        }

        /// The cover's inside: the plastic with the two clips that hold the booklet, beside the spine.
        static func lining(_ shell: NSColor) -> NSImage {
            make("lining-\(shell.description)", NSSize(width: 618, height: 1000)) { r in
                (shell.blended(withFraction: 0.04, of: .white) ?? shell).setFill(); r.fill()
                (shell.blended(withFraction: 0.18, of: .black) ?? shell).setFill()
                for y in [CGFloat(80), r.height - 104] { NSBezierPath(roundedRect: NSRect(x: r.width - 150, y: y, width: 90, height: 24), xRadius: 8, yRadius: 8).fill() }
            }
        }

        /// The case's back: the plastic with the game's name.
        static func back(_ name: String, _ shell: NSColor) -> NSImage {
            make("back-\(name)-\(shell.description)", NSSize(width: 618, height: 1000)) { r in
                (shell.blended(withFraction: 0.12, of: .black) ?? shell).setFill(); r.fill()
                let p = NSMutableParagraphStyle(); p.alignment = .center
                NSString(string: name).draw(in: r.insetBy(dx: 50, dy: 420),
                                            withAttributes: [.font: NSFont.systemFont(ofSize: 44, weight: .bold), .foregroundColor: NSColor.white.withAlphaComponent(0.9), .paragraphStyle: p])
            }
        }

        /// The instruction booklet: white paper, a coloured band, the game's box front, and its caption.
        static func booklet(_ front: CGImage?, _ switch2: Bool) -> NSImage {
            NSImage(size: NSSize(width: 530, height: 900), flipped: true) { r in
                NSColor(white: 0.96, alpha: 1).setFill(); r.fill()
                let art = NSRect(x: 34, y: 34, width: r.width - 68, height: r.height - 150)
                CaseSceneView.shellColor(switch2).setFill(); NSBezierPath(roundedRect: art.insetBy(dx: -6, dy: -6), xRadius: 10, yRadius: 10).fill()
                if let front, let ctx = NSGraphicsContext.current?.cgContext {
                    ctx.saveGState(); ctx.translateBy(x: 0, y: art.maxY + art.minY); ctx.scaleBy(x: 1, y: -1)
                    ctx.interpolationQuality = .high; ctx.draw(front, in: art); ctx.restoreGState()
                }
                let p = NSMutableParagraphStyle(); p.alignment = .center
                NSString(string: "INSTRUCTION BOOKLET").draw(in: NSRect(x: 0, y: r.height - 82, width: r.width, height: 40),
                    withAttributes: [.font: NSFont.systemFont(ofSize: 22, weight: .semibold), .kern: 2, .foregroundColor: NSColor(white: 0.25, alpha: 1), .paragraphStyle: p])
                return true
            }
        }
    }
}

extension LauncherView {
    /// The open case over the page: the room dimmed and blurred, the case up close, the game's name and the buttons.
    @ViewBuilder func openCaseOverlay(_ control: OpenCaseControl, game: LibraryGame?) -> some View {
        ZStack(alignment: .bottom) {
            Rectangle().fill(.ultraThinMaterial).overlay(Color.black.opacity(0.6))
                .onTapGesture { closeOpenCase() }
            OpenCaseView(control: control).padding(.bottom, 90)   // its own clicks: on the case plays, off it goes back
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(CaseStyle.label(control.item.switch2).uppercased()).font(.manrope(12, .semibold)).tracking(1.6).foregroundStyle(LauncherPalette.progress)
                    Text(control.item.name).font(.manrope(30, .bold)).tracking(-0.8).lineLimit(1)
                    Text("Click the case to \(game?.isReady == false ? "build" : "play")  ·  drag to turn it  ·  click outside to go back")
                        .font(.manrope(12)).foregroundStyle(.tertiary)
                }
                Spacer()
                HStack(spacing: 10) {
                    if let g = game {
                        Button { playFromCase(g.id) } label: {
                            Label(g.isReady ? "Play" : "Build game", systemImage: g.isReady ? "play.fill" : "hammer.fill")
                                .font(.manrope(14, .semibold)).padding(.horizontal, 18).padding(.vertical, 9)
                                .foregroundStyle(.black).background(g.isReady ? Color(red: 0.93, green: 0.27, blue: 0.24) : LauncherPalette.ready, in: Capsule())
                        }
                        .buttonStyle(.plain)
                    }
                    if let g = game {
                        if g.isReady {   // the game's settings, to change just before playing
                            Button { optionsFor = g.id } label: {
                                Image(systemName: "slider.horizontal.3").font(.system(size: 14)).foregroundStyle(.white).frame(width: 38, height: 38)
                                    .background(Color.white.opacity(0.08), in: Circle()).overlay(Circle().strokeBorder(Color.white.opacity(0.14)))
                            }
                            .buttonStyle(.plain).help(loc.t("launch.title")).accessibilityLabel(loc.t("launch.title"))
                        }
                        Button { manageOpenFor = manageOpenFor == nil ? g.id : nil } label: { ManageButtonLabel(title: loc.t("library.manage")) }   // ManageMenu.swift
                            .buttonStyle(.plain).accessibilityLabel(loc.t("library.manage"))
                            .anchorPreference(key: ManageAnchorKey.self, value: .bounds) { $0 }
                    }
                    caseButton("Flip", "arrow.left.and.right") { control.flip() }
                }
            }
            .padding(.horizontal, 34).padding(.bottom, 26)
        }
        .transition(.opacity)
    }

    private func caseButton(_ title: String, _ symbol: String?, _ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 6) {
                if let symbol { Image(systemName: symbol) }
                Text(title)
            }
            .font(.manrope(13, .semibold)).foregroundStyle(.white).padding(.horizontal, 14).padding(.vertical, 9)
            .background(Color.white.opacity(0.08), in: Capsule()).overlay(Capsule().strokeBorder(Color.white.opacity(0.14)))
        }
        .buttonStyle(.plain)
    }

    /// Opens the selected game's case.
    func showOpenCase(_ item: CaseItem) {
        guard openCase == nil else { return }
        let c = OpenCaseControl(item: item, gameID: item.id)
        c.onPlay = { playFromCase(item.id) }
        c.onBack = { closeOpenCase() }
        withAnimation(.easeOut(duration: 0.25)) { openCase = c }
        InterfaceSound.play(.open)
    }

    /// Plays (or builds) the open case's game: the view goes at once, so the shelf is there when the game closes.
    func playFromCase(_ id: UUID) {
        guard !launching, let g = library.games.first(where: { $0.id == id }) else { return }
        openCase = nil
        primaryAction(g)
    }

    /// Shuts the case (its animation), then leaves the open view.
    func closeOpenCase() {
        guard let c = openCase else { return }
        c.close { withAnimation(.easeOut(duration: 0.2)) { if openCase === c { openCase = nil } } }
    }
}
