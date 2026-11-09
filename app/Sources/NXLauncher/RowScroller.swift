import SwiftUI

/// The collection row's scroll state, read from its NSScrollView: SwiftUI's horizontal ScrollView does not
/// report its offset on macOS 13, so the pager chevrons follow the clip view's bounds instead.
package final class RowScroller: ObservableObject {
    package init() {}
    @Published package private(set) var canBack = false
    @Published package private(set) var canForward = false
    private weak var scrollView: NSScrollView?
    private var observers: [NSObjectProtocol] = []
    private var wheelMonitor: Any?
    private var gliding: CGFloat?   // where a wheel glide is heading, so quick notches add up
    /// The width of a card and its gap (the Library sets it): each time the row moves past one, `onPass` runs (the Library's click).
    package var cardStep: CGFloat = 0
    package var onPass: (Int) -> Void = { _ in }   // how many cards it passed since the last move
    private var passed: Int?

    package func attach(_ view: NSScrollView) {
        guard view !== scrollView else { return update() }
        observers.forEach(NotificationCenter.default.removeObserver)
        scrollView = view
        let clip = view.contentView
        clip.postsBoundsChangedNotifications = true
        clip.postsFrameChangedNotifications = true
        view.documentView?.postsFrameChangedNotifications = true
        observers = [(NSView.boundsDidChangeNotification, clip), (NSView.frameDidChangeNotification, clip),
                     (NSView.frameDidChangeNotification, view.documentView as Any)].map { name, object in
            NotificationCenter.default.addObserver(forName: name, object: object, queue: .main) { [weak self] _ in self?.update() }
        }
        update()
        if wheelMonitor == nil {   // the wheel over the row moves the row (an NSScrollView turns up-and-down scrolling into nothing when it only scrolls sideways)
            wheelMonitor = NSEvent.addLocalMonitorForEvents(matching: .scrollWheel) { [weak self] e in self?.wheel(e) ?? e }
        }
    }

    deinit {
        observers.forEach(NotificationCenter.default.removeObserver)
        if let wheelMonitor { NSEvent.removeMonitor(wheelMonitor) }
    }

    /// Up-and-down scrolling (a mouse wheel, or a trackpad swiped up or down) over the row scrolls it sideways: down brings the later games in.
    /// Sideways trackpad swipes are the row's own. At either end the scroll goes on to the page, as anywhere else.
    private func wheel(_ e: NSEvent) -> NSEvent? {
        guard let view = scrollView, let window = view.window, e.window === window, let document = view.documentView,
              view.bounds.contains(view.convert(e.locationInWindow, from: nil)) else { return e }
        let dx = e.scrollingDeltaX, dy = e.scrollingDeltaY
        guard abs(dy) > abs(dx) else { return e }
        let clip = view.contentView
        let end = max(0, document.frame.width - clip.bounds.width)
        let from = e.hasPreciseScrollingDeltas ? clip.bounds.minX : (gliding ?? clip.bounds.minX)
        let target = min(max(0, from - (e.hasPreciseScrollingDeltas ? dy : dy * 40)), end)
        guard abs(target - from) > 0.5 else { return e }
        if e.hasPreciseScrollingDeltas {
            gliding = nil
            clip.setBoundsOrigin(NSPoint(x: target, y: clip.bounds.minY))
        } else {   // a wheel notch glides rather than jumps
            gliding = target
            NSAnimationContext.runAnimationGroup({ context in
                context.duration = 0.18; context.timingFunction = CAMediaTimingFunction(name: .easeOut)
                clip.animator().setBoundsOrigin(NSPoint(x: target, y: clip.bounds.minY))
            }, completionHandler: { [weak self] in if self?.gliding == target { self?.gliding = nil } })
        }
        view.reflectScrolledClipView(clip)
        return nil
    }

    private func update() {
        guard let view = scrollView, let document = view.documentView else { return }
        let x = view.contentView.bounds.minX, end = document.frame.width - view.contentView.bounds.width
        if cardStep > 0 {
            let card = Int((x / cardStep).rounded())
            if let p = passed, p != card { onPass(abs(card - p)) }
            passed = card
        }
        if canBack != (x > 1) { canBack = x > 1 }
        if canForward != (x < end - 1) { canForward = x < end - 1 }
    }

    /// Scroll by the whole cards that fit in the row.
    package func page(_ direction: CGFloat, step: CGFloat) {
        guard let view = scrollView, let document = view.documentView else { return }
        let clip = view.contentView
        let distance = max(step, (clip.bounds.width / step).rounded(.down) * step)
        let target = min(max(0, clip.bounds.minX + direction * distance), max(0, document.frame.width - clip.bounds.width))
        NSAnimationContext.runAnimationGroup { context in
            context.duration = 0.35
            context.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            clip.animator().setBoundsOrigin(NSPoint(x: target, y: clip.bounds.minY))
        }
        view.reflectScrolledClipView(clip)
    }
}

/// Hands the NSScrollView around this background view to the row's scroller once it is in a window.
package struct EnclosingScrollView: NSViewRepresentable {
    let row: RowScroller
    package init(row: RowScroller) { self.row = row }
    package final class Probe: NSView {
        package var row: RowScroller?
        package override func viewDidMoveToWindow() {
            super.viewDidMoveToWindow()
            DispatchQueue.main.async { [weak self] in
                if let view = self?.enclosingScrollView { self?.row?.attach(view) }
            }
        }
    }
    package func makeNSView(context: Context) -> Probe { let probe = Probe(); probe.row = row; return probe }
    package func updateNSView(_ probe: Probe, context: Context) {
        probe.row = row
        DispatchQueue.main.async { if let view = probe.enclosingScrollView { row.attach(view) } }
    }
}

/// The library's collection row reports its height, so the hero above it fills exactly what is left.
package struct CollectionHeightKey: PreferenceKey {
    package static var defaultValue: CGFloat = 0
    package static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) { value = max(value, nextValue()) }
}
