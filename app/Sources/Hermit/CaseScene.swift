import AppKit
import SceneKit
import SwiftUI

// The Carousel's cases in real 3D (SceneKit): each game is a box the size of a game case, its front the game's box front (BoxArt.swift) or cover,
// its left side a plastic spine with the game's name, its other edges the same red plastic with a dark seam where it opens; the selected case stands large in the middle, turned a little
// so its spine shows, with its cartridge sliding out from behind it; the others stand in a row on each side, every one turned towards the middle so
// its outer side shows (the spines on the left, the red edges on the right), over a dark floor that reflects them. The look follows PyroCade's carousel
// (Pyrodrifter/PyroCade, MIT); the scene is Hermit's own. No console maker's logo is drawn: only the downloaded box fronts carry the games' own art.
//
// Kept light, since a game may be running beside it: the pictures are made in the background before a case comes into view, the scene draws only
// while something moves, the selected case's sway settles after a few seconds, and nothing draws while Hermit is not the app in front.

/// What the scene shows of one game.
struct CaseItem: Equatable {
    let id: UUID
    let name: String
    let front: NSImage?
    let switch2: Bool
    static func == (a: CaseItem, b: CaseItem) -> Bool { a.id == b.id && a.front === b.front && a.name == b.name && a.switch2 == b.switch2 }
}

/// How the cases stand, after PyroCade's views: a carousel (a row each side, turned towards the middle), a flipbook (the others close together
/// like books on a shelf, spines and edges out) or a vertical stack (a filmstrip of small cases beside the selected one).
enum CaseLayout: Equatable {
    case carousel, flipbook, stack
    /// Cases a side drawn in the scene (one more is kept invisible at the edge, ready to come in).
    var shown: Int { switch self { case .carousel: return 8; case .flipbook: return 7; case .stack: return 4 } }
    var vertical: Bool { self == .stack }
}

/// An SCNView that hands its scroll wheel and trackpad scrolls to the scene (browsing).
final class CaseSCNView: SCNView {
    var onScroll: (NSEvent) -> Void = { _ in }
    var onHover: (CGPoint?) -> Void = { _ in }   // the pointer over the view (nil: it left)
    private var lastHover = CGPoint(x: -100, y: -100)
    override func scrollWheel(with event: NSEvent) { onScroll(event) }
    override func updateTrackingAreas() {
        super.updateTrackingAreas()
        trackingAreas.forEach(removeTrackingArea)
        addTrackingArea(NSTrackingArea(rect: .zero, options: [.mouseMoved, .mouseEnteredAndExited, .activeInKeyWindow, .inVisibleRect], owner: self))
    }
    override func mouseMoved(with event: NSEvent) {
        let p = convert(event.locationInWindow, from: nil)
        guard hypot(p.x - lastHover.x, p.y - lastHover.y) > 2 else { return }   // a hit test only when the pointer really moved
        lastHover = p; onHover(p)
    }
    override func mouseExited(with event: NSEvent) { lastHover = CGPoint(x: -100, y: -100); onHover(nil) }
}

struct CaseSceneView: NSViewRepresentable {
    let items: [CaseItem]   // the games around the selection, in order (a few more than are shown: their pictures are made ahead)
    let selected: Int
    var style: CaseLayout = .carousel
    var onSelect: (Int) -> Void = { _ in }
    var onActivate: () -> Void = {}

    // A Switch case is 105 × 170 × 11 mm: the scene's unit is the case height. Deeper than a real case, so its thickness reads on screen.
    static let caseW: CGFloat = 105.0 / 170.0, caseH: CGFloat = 1.0, caseD: CGFloat = 0.12
    static let camZ: CGFloat = 2.9

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeNSView(context: Context) -> SCNView {
        let v = CaseSCNView(); v.backgroundColor = .clear; v.antialiasingMode = .multisampling2X; v.allowsCameraControl = false
        v.preferredFramesPerSecond = 120; v.rendersContinuously = false; v.isPlaying = false   // played only while something moves (Coordinator.updatePlaying), at the display's rate
        let scene = SCNScene(); scene.background.contents = NSColor.clear; scene.isPaused = true   // runs only while something moves
        v.scene = scene
        // a level camera a little way back (as PyroCade's): perspective enough for the turned cases to show their sides, the row still straight
        let cam = SCNNode(); cam.camera = SCNCamera(); cam.camera?.fieldOfView = 34; cam.camera?.wantsHDR = false
        cam.position = SCNVector3(0, 0.14, Self.camZ); cam.look(at: SCNVector3(0, -0.03, 0)); scene.rootNode.addChildNode(cam)
        let key = SCNNode(); key.light = SCNLight(); key.light?.type = .directional; key.light?.intensity = 1000; key.eulerAngles = SCNVector3(-0.45, 0.5, 0)
        let rim = SCNNode(); rim.light = SCNLight(); rim.light?.type = .directional; rim.light?.intensity = 420; rim.eulerAngles = SCNVector3(-0.2, -2.4, 0)
        let fill = SCNNode(); fill.light = SCNLight(); fill.light?.type = .ambient; fill.light?.intensity = 450
        scene.rootNode.addChildNode(key); scene.rootNode.addChildNode(rim); scene.rootNode.addChildNode(fill)
        let floor = SCNFloor(); floor.reflectivity = 0.14; floor.reflectionFalloffEnd = 0.45; floor.reflectionResolutionScaleFactor = 0.4   // a soft reflection, drawn small
        let fm = SCNMaterial(); fm.diffuse.contents = NSColor(white: 0.04, alpha: 0.35); fm.lightingModel = .constant; fm.writesToDepthBuffer = true
        floor.materials = [fm]
        let floorNode = SCNNode(geometry: floor); floorNode.position = SCNVector3(0, -0.5, 0); scene.rootNode.addChildNode(floorNode)
        context.coordinator.root = scene.rootNode; context.coordinator.view = v
        context.coordinator.watchActivity()
        let click = NSClickGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.clicked(_:))); v.addGestureRecognizer(click)
        // hold and drag to swipe through the games (sideways; up and down in the stack), the wheel or trackpad to scroll through them
        v.addGestureRecognizer(NSPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.dragged(_:))))
        v.onScroll = { [weak c = context.coordinator] e in c?.scrolled(e) }
        v.onHover = { [weak c = context.coordinator] p in c?.hover(at: p) }
        return v
    }

    func updateNSView(_ v: SCNView, context: Context) {
        let c = context.coordinator
        c.onSelect = onSelect; c.onActivate = onActivate
        if c.style != style { c.style = style; c.lastSelected = -2 }   // a new view: every case to its new place
        guard c.items != items || c.lastSelected != selected else { return }   // SwiftUI redraws for many reasons: the scene moves only when the games or the selection do
        c.items = items
        c.layout(items: items, selected: selected)
    }

    /// Gone from the page (another view chosen): everything stopped and let go. A scene whose actions were still running (a case mid-sway) went on
    /// drawing unseen at the display's rate, 15-25 % CPU, after the Row view replaced it.
    static func dismantleNSView(_ v: SCNView, coordinator: Coordinator) { coordinator.stopWatching(); retire(v) }
    static func retire(_ v: SCNView) {
        v.isPlaying = false
        v.scene?.isPaused = true
        v.scene?.rootNode.enumerateHierarchy { n, _ in n.removeAllActions() }
        v.scene = nil
    }

    final class Coordinator: NSObject {
        var root: SCNNode?
        weak var view: SCNView?
        var nodes: [UUID: SCNNode] = [:]
        var built: [UUID: CaseItem] = [:]
        var items: [CaseItem] = []
        var cartridge: (id: UUID, node: SCNNode)?
        var onSelect: (Int) -> Void = { _ in }
        var onActivate: () -> Void = {}
        var lastSelected = -1
        var style: CaseLayout = .carousel
        private var previousID: UUID?   // the game selected at the last layout
        private var observers: [NSObjectProtocol] = []
        private var quietAfter = Date.distantPast   // the end of the latest move (a SCNTransaction: 0.5 s, the cartridge 0.55 s)
        private var check: Timer?

        /// The scene runs only while something moves (a move, the sway, a case settling), Hermit is the app in front and its window can be
        /// seen; otherwise it is not drawn at all (an SCNView that is playing draws every frame, moving or not: 12 % CPU at rest).
        func watchActivity() {
            let nc = NotificationCenter.default
            for name in [NSApplication.didBecomeActiveNotification, NSApplication.didResignActiveNotification, NSWindow.didChangeOcclusionStateNotification,
                         NSWindow.didMiniaturizeNotification, NSWindow.didDeminiaturizeNotification] {
                observers.append(nc.addObserver(forName: name, object: nil, queue: .main) { [weak self] _ in self?.updatePlaying() })
            }
        }
        func stopWatching() { for o in observers { NotificationCenter.default.removeObserver(o) }; observers = []; check?.invalidate(); check = nil }

        private func updatePlaying() {
            guard let v = view else { return }
            let visible = v.window.map { $0.occlusionState.contains(.visible) && !$0.isMiniaturized } ?? false
            let moving = Date() < quietAfter || nodes.values.contains { n in
                n.childNode(withName: "body", recursively: true)?.hasActions == true || n.childNode(withName: "pop", recursively: false)?.hasActions == true }
            let run = NSApp.isActive && visible && moving
            if v.isPlaying != run { v.isPlaying = run; v.scene?.isPaused = !run; v.setNeedsDisplay(v.bounds) }   // paused, its actions wait and draw nothing; a stopped view still draws once, at its final state
            if run, check == nil {   // once a second while it plays: stop when everything has come to rest
                check = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in self?.updatePlaying() }
            } else if !run { check?.invalidate(); check = nil }
        }

        /// Every case to its place for the selection: the selected one in front, up to eight a side, the rest removed. The pictures of every game
        /// handed in (a few beyond the eighth) are made in the background, so a case that scrolls in has them ready.
        func layout(items: [CaseItem], selected: Int) {
            guard let root else { return }
            for item in items where CaseArt.cached(item) == nil { CaseArt.request(item) { _ in } }
            let window = items.indices.filter { abs($0 - selected) <= style.shown }
            let keep = Set(window.map { items[$0].id })
            for (id, n) in nodes where !keep.contains(id) { n.removeFromParentNode(); nodes[id] = nil; built[id] = nil }
            SCNTransaction.begin()
            SCNTransaction.animationDuration = lastSelected == -1 ? 0 : 0.5
            SCNTransaction.animationTimingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.9, 0.25, 1)
            var fresh: [SCNNode] = []
            for i in window {
                let item = items[i]
                let n: SCNNode
                if let have = nodes[item.id], built[item.id] == item { n = have }
                else {
                    nodes[item.id]?.removeFromParentNode()
                    n = CaseSceneView.caseNode(item); n.name = item.id.uuidString
                    root.addChildNode(n); nodes[item.id] = n; built[item.id] = item; fresh.append(n)
                    n.transform = transform(offset: i - selected, entering: true)
                    if CaseArt.cached(item) == nil {   // not made yet: the case shows plain plastic until its pictures arrive
                        CaseArt.request(item) { [weak self, weak n] art in
                            guard let n, self?.built[item.id] == item else { return }
                            CaseSceneView.dress(n, item, art); self?.view.map { $0.setNeedsDisplay($0.bounds) }
                        }
                    }
                }
                n.transform = transform(offset: i - selected, entering: false)
                n.opacity = abs(i - selected) >= style.shown ? 0 : 1
            }
            SCNTransaction.commit()
            if let v = view, !fresh.isEmpty, lastSelected >= 0 { v.prepare(fresh) { _ in } }   // their textures go to the GPU in the background, before they show
            if items.indices.contains(selected) { showCartridge(items[selected]); sway(items[selected].id) }
            if lastSelected >= 0, let was = previousID, items.indices.contains(selected), was != items[selected].id {   // the selection moved along the shelf, by any means:
                InterfaceSound.ticks(items.firstIndex { $0.id == was }.map { abs($0 - selected) } ?? 1)   // a tick for every game it passed
            }
            previousID = items.indices.contains(selected) ? items[selected].id : nil
            lastSelected = selected
            quietAfter = Date().addingTimeInterval(1.0)
            updatePlaying()
            view?.setNeedsDisplay(view?.bounds ?? .zero)
        }

        /// A case's place at `offset` from the selected one. The side cases turn towards the middle by their angle from the camera and a bit more,
        /// so each shows its outer side (the left ones their spines) at any distance; the right row starts further out, leaving room for the cartridge.
        func transform(offset k: Int, entering: Bool) -> SCNMatrix4 {
            switch style {
            case .carousel: return carousel(offset: k, entering: entering)
            case .flipbook: return flipbook(offset: k, entering: entering)
            case .stack: return stack(offset: k, entering: entering)
            }
        }

        private static func place(turn: CGFloat, scale: CGFloat, _ x: CGFloat, _ y: CGFloat, _ z: CGFloat) -> SCNMatrix4 {
            var t = SCNMatrix4MakeRotation(turn, 0, 1, 0)
            t = SCNMatrix4Mult(t, SCNMatrix4MakeScale(scale, scale, scale))
            return SCNMatrix4Mult(t, SCNMatrix4MakeTranslation(x, y, z))
        }

        /// Flipbook: the selected case faces the player; the nearest on each side turns half towards it, the rest stand close behind it nearly
        /// edge-on, like books on a shelf (the left ones' spines, the right ones' edges).
        private func flipbook(offset k: Int, entering: Bool) -> SCNMatrix4 {
            if k == 0 { return Self.place(turn: 0.06, scale: 1, 0, 0, 0.25) }
            let side: CGFloat = k < 0 ? -1 : 1, d = CGFloat(abs(k)), scale: CGFloat = 0.8
            let x = side * ((k < 0 ? 0.84 : 0.88) + (d - 1) * 0.125 + (d > 1 ? 0.08 : 0))
            let turn = side * -(d == 1 ? 0.62 : 1.22)
            return Self.place(turn: turn, scale: scale, x + (entering ? side * 0.3 : 0), -0.5 + scale * 0.5, -0.12 - d * 0.03)
        }

        /// Vertical stack: the selected case large, right of the middle; the others in a filmstrip on its left, the earlier ones above and the later
        /// ones below, on an arc whose ends reach round towards the large case, stepping back as they go. Every case stays upright (a case tilted with
        /// the arc caught the light above as a white flash).
        private func stack(offset k: Int, entering: Bool) -> SCNMatrix4 {
            if k == 0 { return Self.place(turn: 0.16, scale: 0.92, 0.22, -0.5 + 0.46, 0.2) }
            let d = CGFloat(k) + (entering ? (k < 0 ? -1 : 1) : 0), a = d * 0.27, bend = 1 - cos(a)
            return Self.place(turn: 0.30 - 0.25 * bend, scale: 0.37, -0.70 + 0.55 * bend, -0.92 * sin(a) - (k < 0 ? -0.01 : 0.01), -0.30 - 0.35 * bend)
        }

        private func carousel(offset k: Int, entering: Bool) -> SCNMatrix4 {
            let side: CGFloat = k == 0 ? 0 : (k < 0 ? -1 : 1), d = CGFloat(abs(k))
            let scale: CGFloat = k == 0 ? 1 : 0.78   // as in PyroCade's carousel: the side cases about three quarters of the middle one
            let first: CGFloat = k < 0 ? 0.76 : 0.92
            let x: CGFloat = k == 0 ? 0 : side * (first + (d - 1) * 0.33)
            let z: CGFloat = k == 0 ? 0.25 : -0.22 - d * 0.04
            let y: CGFloat = -0.5 + scale * 0.5   // every case stands on the floor
            let sight = atan(abs(x) / (CaseSceneView.camZ - z))
            let turn: CGFloat = k == 0 ? 0.30 : side * -(sight + 0.42)   // the middle case shows its spine; the others turn towards it
            var t = SCNMatrix4MakeRotation(turn, 0, 1, 0)
            t = SCNMatrix4Mult(t, SCNMatrix4MakeScale(scale, scale, scale))
            return SCNMatrix4Mult(t, SCNMatrix4MakeTranslation(x + (entering ? side * 0.4 : 0), y, z))
        }

        /// The selected case comes forward with a small lift and sways gently for a few seconds, then rests (a scene at rest is not drawn).
        func sway(_ id: UUID) {
            for (other, n) in nodes where other != id {
                if let b = n.childNode(withName: "body", recursively: true), b.hasActions || b.position.y != 0 {
                    b.removeAllActions(); b.runAction(.group([.rotateTo(x: 0, y: 0, z: 0, duration: 0.3), .move(to: SCNVector3Zero, duration: 0.3)]))
                }
            }
            guard let b = nodes[id]?.childNode(withName: "body", recursively: true), !b.hasActions else { return }
            let lift = SCNAction.sequence([.move(to: SCNVector3(0, 0.035, 0.04), duration: 0.28), .move(to: SCNVector3(0, 0.012, 0.02), duration: 0.35)])
            lift.timingMode = .easeOut
            let one = SCNAction.sequence([.rotateTo(x: 0.015, y: 0.07, z: 0, duration: 2.4, usesShortestUnitArc: true),
                                          .rotateTo(x: -0.01, y: -0.05, z: 0, duration: 2.4, usesShortestUnitArc: true)])
            one.timingMode = .easeInEaseOut
            let settle = SCNAction.rotateTo(x: 0, y: 0, z: 0, duration: 1.6, usesShortestUnitArc: true); settle.timingMode = .easeInEaseOut
            b.runAction(.group([lift, .sequence([.repeat(one, count: 2), settle])]))
        }

        /// The selected game's cartridge: a thin card behind the case's top right that slides out.
        func showCartridge(_ item: CaseItem) {
            if cartridge?.id == item.id { return }
            cartridge?.node.removeFromParentNode()
            let card = CaseSceneView.cartridgeNode(item)
            guard let caseNode = nodes[item.id]?.childNode(withName: "body", recursively: true) ?? nodes[item.id] else { return }
            caseNode.addChildNode(card)
            if CaseArt.cached(item) == nil {
                CaseArt.request(item) { [weak card] art in if let card { CaseSceneView.dressCartridge(card, art) } }
            }
            card.position = SCNVector3(CaseSceneView.caseW * 0.12, CaseSceneView.caseH * 0.22, -CaseSceneView.caseD * 0.6)
            card.eulerAngles = SCNVector3(0, 0, -0.05)
            SCNTransaction.begin(); SCNTransaction.animationDuration = 0.55
            SCNTransaction.animationTimingFunction = CAMediaTimingFunction(controlPoints: 0.25, 1.2, 0.4, 1)
            card.position = SCNVector3(CaseSceneView.caseW * 0.66, CaseSceneView.caseH * 0.29, -CaseSceneView.caseD * 0.6)
            card.eulerAngles = SCNVector3(0, -0.06, -0.12)
            SCNTransaction.commit()
            cartridge = (item.id, card)
        }

        // MARK: browsing by hand

        private var dragSteps = 0
        private var scrollSum: CGFloat = 0

        /// Moves the selection `n` games on (back when negative), within the games the scene holds (the page re-centres them after each move).
        private func step(_ n: Int) {
            guard n != 0, lastSelected >= 0, !items.isEmpty else { return }
            let to = min(max(lastSelected + n, 0), items.count - 1)
            if to != lastSelected { onSelect(to) }
        }

        /// A drag: one game for every 110 points (70 in the stack) the pointer travels, so the cases follow the hand; a quick flick at the end
        /// carries on a few more. Dragging left (or up in the stack) brings the later games in, as on a phone.
        @objc func dragged(_ g: NSPanGestureRecognizer) {
            guard let v = view else { return }
            let t = g.translation(in: v)
            let along = style.vertical ? t.y : -t.x
            let unit: CGFloat = style.vertical ? 70 : 110
            switch g.state {
            case .began: dragSteps = 0
            case .changed:
                let want = Int((along / unit).rounded(.towardZero))
                if want != dragSteps { step(want - dragSteps); dragSteps = want }
            case .ended:
                let vel = g.velocity(in: v)
                step(Int(max(-4, min(4, ((style.vertical ? vel.y : -vel.x) / 900).rounded(.towardZero)))))
            default: break
            }
        }

        /// The wheel or a trackpad, either direction: a wheel notch is one game, a trackpad moves one game every 40 points (its glide after
        /// the fingers lift is ignored, so it stops where the player stops).
        func scrolled(_ e: NSEvent) {
            guard e.momentumPhase.isEmpty else { return }
            let d = abs(e.scrollingDeltaX) > abs(e.scrollingDeltaY) ? e.scrollingDeltaX : e.scrollingDeltaY
            guard d != 0 else { return }
            if !e.hasPreciseScrollingDeltas { step(d < 0 ? 1 : -1); return }
            if e.phase == .began { scrollSum = 0 }
            scrollSum += d
            let n = Int((scrollSum / 40).rounded(.towardZero))
            if n != 0 { scrollSum -= CGFloat(n) * 40; step(-n) }
        }

        // MARK: hover

        private var hovered: UUID?

        /// The case under the pointer comes forward a little (the selected one a little less) and goes back when the pointer leaves it.
        func hover(at p: CGPoint?) {
            var id: UUID?
            if let p, let v = view {
                var n = v.hitTest(p, options: [.searchMode: SCNHitTestSearchMode.closest.rawValue]).first?.node
                while let cur = n, UUID(uuidString: cur.name ?? "") == nil { n = cur.parent }
                id = n?.name.flatMap(UUID.init(uuidString:))
                if let i = id, let at = items.firstIndex(where: { $0.id == i }), abs(at - lastSelected) >= style.shown { id = nil }   // a hidden one at the edge
            }
            guard id != hovered else { return }
            if let old = hovered, let pop = nodes[old]?.childNode(withName: "pop", recursively: false) {
                pop.removeAllActions()
                pop.runAction(Self.eased(.group([.scale(to: 1, duration: 0.22), .move(to: SCNVector3Zero, duration: 0.22)])))
            }
            hovered = id
            if let id, let pop = nodes[id]?.childNode(withName: "pop", recursively: false) {
                let selected = items.indices.contains(lastSelected) && items[lastSelected].id == id
                pop.removeAllActions()
                pop.runAction(Self.eased(.group([.scale(to: selected ? 1.025 : 1.06, duration: 0.16),
                                                 .move(to: SCNVector3(0, selected ? 0.012 : 0.03, selected ? 0.02 : 0.06), duration: 0.16)])))
                InterfaceSound.play(.hover)
            }
            updatePlaying()
        }

        private static func eased(_ a: SCNAction) -> SCNAction { a.timingMode = .easeOut; return a }

        @objc func clicked(_ g: NSClickGestureRecognizer) {
            guard let v = view else { return }
            let hits = v.hitTest(g.location(in: v), options: [.searchMode: SCNHitTestSearchMode.closest.rawValue])
            var n = hits.first?.node
            while let cur = n, cur.name == nil || UUID(uuidString: cur.name ?? "") == nil { n = cur.parent }
            guard let id = n?.name.flatMap(UUID.init(uuidString:)), let i = items.firstIndex(where: { $0.id == id }) else { return }
            if i == lastSelected { onActivate() } else { onSelect(i) }
        }
    }

    // MARK: geometry

    static func plastic(_ c: NSColor, roughness: CGFloat = 0.38) -> SCNMaterial {
        let m = SCNMaterial(); m.diffuse.contents = c; m.lightingModel = .physicallyBased; m.roughness.contents = roughness; m.metalness.contents = 0.0
        return m
    }

    static func shellColor(_ s2: Bool) -> NSColor { s2 ? NSColor(red: 0.74, green: 0.10, blue: 0.17, alpha: 1) : NSColor(red: 0.84, green: 0.05, blue: 0.10, alpha: 1) }

    /// A case: the box (SceneKit's face order: front, right, back, left = the spine, top, bottom), dressed with its pictures when they are made.
    static func caseNode(_ item: CaseItem) -> SCNNode {
        let box = SCNBox(width: caseW, height: caseH, length: caseD, chamferRadius: 0.008)
        let shell = shellColor(item.switch2)
        let front = SCNMaterial(); front.lightingModel = .physicallyBased; front.roughness.contents = 0.22; front.metalness.contents = 0.0
        front.diffuse.mipFilter = .linear; front.diffuse.contents = shell.blended(withFraction: 0.5, of: .black)
        let spine = plastic(shell, roughness: 0.4)
        let side = plastic(shell); side.diffuse.contents = seam(shell, vertical: true)   // the open side: red, with the dark line where the halves meet
        let ends = plastic(shell); ends.diffuse.contents = seam(shell, vertical: false)  // the top and bottom, the same line along them
        let back = plastic(shell.blended(withFraction: 0.35, of: .black) ?? shell)
        box.materials = [front, side, back, spine, ends, ends]
        let n = SCNNode(); let pop = SCNNode(); pop.name = "pop"; let body = SCNNode(geometry: box); body.name = "body"
        n.addChildNode(pop); pop.addChildNode(body)   // the container is placed, the pop node comes forward under the pointer, the body sways
        if let art = CaseArt.cached(item) { dress(n, item, art) }
        return n
    }

    /// The case's plastic with a thin dark line through the middle (vertical: down the open side; else along the top and bottom), where a real
    /// case opens. Tiny pictures, one of each per colour, shared by every case.
    private static var seams: [String: NSImage] = [:]
    static func seam(_ shell: NSColor, vertical: Bool) -> NSImage {
        let key = "\(shell.description)-\(vertical)"
        if let hit = seams[key] { return hit }
        let size = vertical ? NSSize(width: 64, height: 8) : NSSize(width: 8, height: 64)
        let img = NSImage(size: size, flipped: false) { r in
            shell.setFill(); r.fill()
            NSColor(white: 0.04, alpha: 0.92).setFill()
            (vertical ? NSRect(x: r.midX - 1.5, y: 0, width: 3, height: r.height) : NSRect(x: 0, y: r.midY - 1.5, width: r.width, height: 3)).fill()
            return true
        }
        seams[key] = img
        return img
    }

    /// The case's front and spine pictures, once made.
    static func dress(_ n: SCNNode, _ item: CaseItem, _ art: CaseArt.Pictures) {
        guard let mats = n.childNode(withName: "body", recursively: true)?.geometry?.materials, mats.count == 6 else { return }
        mats[0].diffuse.contents = art.front
        mats[3].diffuse.contents = art.spine
    }

    /// The cartridge: a thin plastic card with the game's art as its label.
    static func cartridgeNode(_ item: CaseItem) -> SCNNode {
        let w = caseW * 0.36, h = w * 1.28
        let card = SCNBox(width: w, height: h, length: 0.014, chamferRadius: 0.012)
        let shell = plastic(shellColor(item.switch2))
        let face = SCNMaterial(); face.diffuse.contents = shellColor(item.switch2); face.lightingModel = .physicallyBased; face.roughness.contents = 0.3
        card.materials = [face, shell, shell, shell, shell, shell]
        let n = SCNNode(geometry: card)
        if let art = CaseArt.cached(item) { dressCartridge(n, art) }
        return n
    }

    static func dressCartridge(_ n: SCNNode, _ art: CaseArt.Pictures) { n.geometry?.materials.first?.diffuse.contents = art.cartridge }
}

/// A case's pictures (its front scaled for the GPU, its spine with the game's name, its cartridge label), made on a background queue and kept,
/// so moving along the carousel never waits on picture work. The background glow of the page is made at the same time.
enum CaseArt {
    final class Pictures { let front: CGImage; let spine: CGImage; let cartridge: CGImage
        init(front: CGImage, spine: CGImage, cartridge: CGImage) { self.front = front; self.spine = spine; self.cartridge = cartridge } }

    private static let queue = DispatchQueue(label: "switch2mac.case-art", qos: .userInitiated)
    private static let made: NSCache<NSString, Pictures> = { let c = NSCache<NSString, Pictures>(); c.countLimit = 28; return c }()   // ~2.5 MB a game: the 25 around the selection (in view and about to come)
    private static var waiting: [String: [(Pictures) -> Void]] = [:]   // main thread only

    static func key(_ item: CaseItem) -> String { "\(item.id)-\(item.front.map { ObjectIdentifier($0).hashValue } ?? 0)-\(item.switch2)-\(item.name)" }
    static func cached(_ item: CaseItem) -> Pictures? { made.object(forKey: key(item) as NSString) }
    static func purge() { made.removeAllObjects() }   // MemoryTrim

    /// The pictures of `item`; `done` runs on the main thread when they are ready (at once if they are).
    static func request(_ item: CaseItem, done: @escaping (Pictures) -> Void) {
        let k = key(item)
        if let hit = made.object(forKey: k as NSString) { done(hit); return }
        if MainActor.assumeIsolated({ MemoryTrim.trimmed }) { return }   // (called on the main thread) a game is running: no picture work until Hermit is back in front
        if waiting[k] != nil { waiting[k]?.append(done); return }
        waiting[k] = [done]
        let front = item.front
        queue.async {
            let pics = make(item, front: front)
            if let front { _ = AmbientGlow.of(front, key: item.id) }
            DispatchQueue.main.async {
                made.setObject(pics, forKey: k as NSString)
                for d in waiting.removeValue(forKey: k) ?? [] { d(pics) }
            }
        }
    }

    private static func make(_ item: CaseItem, front: NSImage?) -> Pictures {
        let shell = CaseSceneView.shellColor(item.switch2)
        let cg = front.flatMap { img -> CGImage? in var r = CGRect(origin: .zero, size: img.size); return img.cgImage(forProposedRect: &r, context: nil, hints: nil) }
        let f = cg.map { scaled($0, height: 768) } ?? placeholder(item)
        return Pictures(front: f, spine: spine(item, shell), cartridge: cartridge(cg, shell))
    }

    /// Draws into a new picture of w × h pixels (top-left origin, AppKit text works in it), on any thread.
    private static func draw(_ w: Int, _ h: Int, _ body: (CGContext, NSRect) -> Void) -> CGImage {
        let ctx = CGContext(data: nil, width: w, height: h, bitsPerComponent: 8, bytesPerRow: 0, space: CGColorSpaceCreateDeviceRGB(),
                            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        ctx.translateBy(x: 0, y: CGFloat(h)); ctx.scaleBy(x: 1, y: -1)
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = NSGraphicsContext(cgContext: ctx, flipped: true)
        body(ctx, NSRect(x: 0, y: 0, width: w, height: h))
        NSGraphicsContext.restoreGraphicsState()
        return ctx.makeImage()!
    }

    static func scaled(_ cg: CGImage, height: CGFloat) -> CGImage {
        guard CGFloat(cg.height) > height else { return cg }
        let w = Int(CGFloat(cg.width) * height / CGFloat(cg.height)), h = Int(height)
        guard let ctx = CGContext(data: nil, width: w, height: h, bitsPerComponent: 8, bytesPerRow: 0, space: CGColorSpaceCreateDeviceRGB(),
                                  bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue) else { return cg }
        ctx.interpolationQuality = .high; ctx.draw(cg, in: CGRect(x: 0, y: 0, width: w, height: h))
        return ctx.makeImage() ?? cg
    }

    /// The spine: the case's plastic with the game's name running down it, as on a shelf.
    private static func spine(_ item: CaseItem, _ shell: NSColor) -> CGImage {
        draw(120, 1000) { ctx, r in
            shell.setFill(); r.fill()
            NSColor.white.withAlphaComponent(0.10).setFill(); NSRect(x: 0, y: 0, width: 6, height: r.height).fill()   // a highlight along the hinge
            let a: [NSAttributedString.Key: Any] = [.font: NSFont.systemFont(ofSize: 40, weight: .semibold), .foregroundColor: NSColor.white.withAlphaComponent(0.94)]
            let text = NSAttributedString(string: item.name, attributes: a)
            ctx.saveGState()
            ctx.translateBy(x: r.width / 2 + 25, y: 60); ctx.rotate(by: .pi / 2)   // reads top to bottom, the letters centred across the spine
            text.draw(with: NSRect(x: 0, y: 0, width: r.height - 120, height: 50), options: [.usesLineFragmentOrigin, .truncatesLastVisibleLine])
            ctx.restoreGState()
        }
    }

    /// The cartridge label: the game's art in a light frame on the plastic, with a notch at the top.
    private static func cartridge(_ art: CGImage?, _ shell: NSColor) -> CGImage {
        draw(360, 460) { ctx, r in
            NSColor(white: 0.1, alpha: 1).setFill(); r.fill()
            shell.setFill(); NSBezierPath(roundedRect: r, xRadius: 28, yRadius: 28).fill()
            NSColor.black.withAlphaComponent(0.25).setFill(); NSBezierPath(roundedRect: NSRect(x: 120, y: 14, width: 120, height: 26), xRadius: 10, yRadius: 10).fill()
            let label = NSRect(x: 30, y: 60, width: 300, height: 370)
            NSColor.white.setFill(); NSBezierPath(roundedRect: label, xRadius: 12, yRadius: 12).fill()
            if let art {
                let inner = label.insetBy(dx: 8, dy: 8)
                ctx.saveGState()
                NSBezierPath(roundedRect: inner, xRadius: 8, yRadius: 8).addClip()
                ctx.translateBy(x: 0, y: inner.maxY + inner.minY); ctx.scaleBy(x: 1, y: -1)   // CGImage draws bottom-up
                ctx.interpolationQuality = .high; ctx.draw(art, in: inner)
                ctx.restoreGState()
            }
        }
    }

    /// A front for a game with no picture at all: Hermit's colours and the name.
    private static func placeholder(_ item: CaseItem) -> CGImage {
        draw(618, 1000) { _, r in
            let g = NSGradient(colors: [NSColor(calibratedHue: CGFloat(abs(item.name.hashValue % 360)) / 360, saturation: 0.5, brightness: 0.35, alpha: 1), .black])
            g?.draw(in: r, angle: 90)
            let p = NSMutableParagraphStyle(); p.alignment = .center
            NSString(string: item.name).draw(in: r.insetBy(dx: 40, dy: 380), withAttributes: [.font: NSFont.systemFont(ofSize: 54, weight: .bold), .foregroundColor: NSColor.white, .paragraphStyle: p])
        }
    }
}
