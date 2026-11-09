import AppKit
import SwiftUI

// The Library's small sounds ("Glass", picked by the player from six tried in a sound board): a pure, bright ping for every game the selection (or the Row) passes, a lighter, higher one when the pointer comes onto a
// case, and a deeper double tap when a case opens. switch2mac's own sounds, synthesised here once at first use (no recording is shipped or copied):
// a few harmonic tones (no metallic, inharmonic ring) that fall a little in pitch as they fade within a few hundredths of a second, over a soft
// low body, with a gentle attack and only a breath of click: the feel of a well-damped key or dial. Three barely different ticks take turns, so a fast
// scroll sounds natural rather than one sample repeated; each is a small pool of players, so quick ticks overlap instead of cutting each other off.
// Silent while switch2mac is not in front. Settings > App > Interface sounds turns them off.
/// The Library bar's speaker: mutes or unmutes the interface sounds (the same switch as Settings > App > Interface sounds).
struct SoundToggle: View {
    @AppStorage(InterfaceSound.defaultsKey) private var on = true
    var body: some View {
        Button { on.toggle(); if on { InterfaceSound.play(.tick) } } label: {
            Image(systemName: on ? "speaker.wave.2.fill" : "speaker.slash.fill").font(.system(size: 13)).foregroundStyle(.secondary)
                .frame(width: 30, height: 26).contentShape(Rectangle())
        }
        .buttonStyle(.plain).help(on ? "Mute sound effects" : "Turn sound effects on").accessibilityLabel(on ? "Mute sound effects" : "Turn sound effects on")
    }
}

enum InterfaceSound {
    static let defaultsKey = "interfaceSounds"
    static var enabled: Bool { UserDefaults.standard.object(forKey: defaultsKey) as? Bool ?? true }

    enum Kind { case tick, hover, open }

    /// One sound's recipe: its tones (frequency in Hz, level, decay in seconds, how far the pitch falls as it fades), the breath of click at its start
    /// (level, decay), its attack, a second tap after `echo` seconds (0: none) and the whole sound's length.
    struct Recipe {
        var tones: [(f: Double, a: Double, decay: Double, glide: Double)]
        var click: Double, clickDecay: Double, attack: Double, echo: Double, length: Double
    }

    static func recipe(_ kind: Kind, variant: Int) -> Recipe {
        let shift = [1.0, 1.02, 0.985][variant % 3]
        switch kind {   // "Glass" (the player's pick from six): a pure, bright, very short ping, its octave above it, no rattle
        case .tick:
            return Recipe(tones: [(2600 * shift, 0.8, 0.010, 0.02), (5200 * shift, 0.12, 0.004, 0.02)], click: 0, clickDecay: 0.0004, attack: 0.0015, echo: 0, length: 0.07)
        case .hover:
            return Recipe(tones: [(3094 * shift, 0.8, 0.008, 0.02), (6188 * shift, 0.12, 0.0032, 0.02)], click: 0, clickDecay: 0.0004, attack: 0.0015, echo: 0, length: 0.05)
        case .open:
            return Recipe(tones: [(1950, 0.8, 0.016, 0.02), (3900, 0.12, 0.0064, 0.02)], click: 0, clickDecay: 0.0004, attack: 0.0015, echo: 0.065, length: 0.2)
        }
    }

    /// The recipe as a 16-bit mono WAV at 44.1 kHz, peaking at `peak` of full scale.
    static func wav(_ r: Recipe, peak: Double = 0.8, seed: UInt64 = 7) -> Data {
        let rate = 44_100.0, n = Int(r.length * rate)
        var rng = seed, samples = [Double](repeating: 0, count: n)
        func noise() -> Double { rng = rng &* 6364136223846793005 &+ 1442695040888963407; return Double(Int64(bitPattern: rng >> 11) % 2000) / 1000 - 1 }
        for (hit, level, lift) in r.echo > 0 ? [(0.0, 1.0, 1.0), (r.echo, 0.6, 1.06)] : [(0.0, 1.0, 1.0)] {
            let start = Int(hit * rate)
            var phase = [Double](repeating: 0, count: r.tones.count)
            for i in start..<n {
                let t = Double(i - start) / rate
                let env = min(1, t / r.attack)
                var v = r.click * noise() * exp(-t / r.clickDecay)
                for (j, tone) in r.tones.enumerated() {
                    let f = tone.f * lift * (1 - tone.glide * (1 - exp(-t / 0.012)))   // the pitch settles a little lower as the tone fades
                    phase[j] += 2 * .pi * f / rate
                    v += tone.a * sin(phase[j]) * exp(-t / tone.decay)
                }
                samples[i] += v * env * level
            }
        }
        let top = samples.map(abs).max() ?? 1
        let fade = Int(0.004 * rate)   // the last few milliseconds faded out: no click at the end
        let pcm = samples.enumerated().map { i, x -> Int16 in
            let tail = i >= n - fade ? Double(n - i) / Double(fade) : 1
            return Int16(max(-1, min(1, x / max(top, 1e-9) * peak * tail)) * 32767)
        }
        var d = Data()
        func u32(_ x: UInt32) { withUnsafeBytes(of: x.littleEndian) { d.append(contentsOf: $0) } }
        func u16(_ x: UInt16) { withUnsafeBytes(of: x.littleEndian) { d.append(contentsOf: $0) } }
        d.append(contentsOf: Array("RIFF".utf8)); u32(UInt32(36 + pcm.count * 2)); d.append(contentsOf: Array("WAVEfmt ".utf8))
        u32(16); u16(1); u16(1); u32(44_100); u32(88_200); u16(2); u16(16)
        d.append(contentsOf: Array("data".utf8)); u32(UInt32(pcm.count * 2))
        for s in pcm { u16(UInt16(bitPattern: s)) }
        return d
    }

    private static let volume: [Kind: Float] = [.tick: 0.3, .hover: 0.15, .open: 0.4]
    /// Players: three variants of each sound, two players of each, taken in turn.
    private static let pools: [Kind: [NSSound]] = {
        var d: [Kind: [NSSound]] = [:]
        for kind in [Kind.tick, .hover, .open] {
            d[kind] = (0..<3).flatMap { v in (0..<2).compactMap { _ -> NSSound? in
                let s = NSSound(data: wav(recipe(kind, variant: v), seed: UInt64(7 + v))); s?.volume = volume[kind] ?? 0.3; return s } }
        }
        return d
    }()
    private static var next: [Kind: Int] = [:]
    private static var last: [Kind: TimeInterval] = [:]

    private static var hoverQuietUntil: TimeInterval = 0

    /// One tick for each of `n` games passed at once (a fast scroll or flick moves several in one step), spaced so each is heard; a few at most.
    static func ticks(_ n: Int) {
        let count = min(max(n, 1), 6)
        for i in 0..<count {
            if i == 0 { play(.tick) } else { DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.035) { play(.tick) } }
        }
    }

    static func play(_ kind: Kind) {
        guard enabled, NSApp.isActive, let pool = pools[kind], !pool.isEmpty else { return }
        let now = ProcessInfo.processInfo.systemUptime
        if kind == .tick { hoverQuietUntil = now + 0.4 }   // while scrolling the ticks are the only sound: cases passing under a resting pointer stay quiet
        if kind == .hover, now < hoverQuietUntil { return }
        if let t = last[kind], now - t < (kind == .hover ? 0.08 : 0.02) { return }
        last[kind] = now
        let i = next[kind, default: 0]; next[kind] = i + 1
        let s = pool[(i % 3) * 2 + (i / 3) % 2]   // the variants in turn, alternating players
        if s.isPlaying { s.stop() }
        s.play()
    }
}
