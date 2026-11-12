import SwiftUI
import NXLauncher

/// Hermit's own cover for a game with no banner (titledb lists no shop banner for it, or it has not been fetched yet): a two-colour
/// gradient chosen from the title ID, so a game keeps its colours, two soft light shapes and the game's name in Manrope. Original design:
/// no artwork from any game.
struct GameCover: View {
    let name: String
    let titleID: String
    var large = false   // the hero: the name is drawn by the hero itself, so the cover carries only the colour and a faint monogram

    var body: some View {
        let (a, b) = Self.colours(titleID)
        GeometryReader { geo in
            ZStack {
                LinearGradient(colors: [a, b], startPoint: .topLeading, endPoint: .bottomTrailing)
                Circle().fill(Color.white.opacity(0.10)).frame(width: geo.size.width * 0.9).blur(radius: geo.size.width * 0.08)
                    .offset(x: geo.size.width * 0.38, y: -geo.size.height * 0.45)
                Circle().fill(Color.black.opacity(0.22)).frame(width: geo.size.width * 0.7).blur(radius: geo.size.width * 0.06)
                    .offset(x: -geo.size.width * 0.42, y: geo.size.height * 0.55)
                if large {
                    Text(Self.monogram(name)).font(.manrope(geo.size.height * 0.62, .bold)).tracking(-geo.size.height * 0.02)
                        .foregroundStyle(Color.white.opacity(0.07))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing).padding(geo.size.height * 0.06)
                } else {
                    Text(name).font(.manrope(max(14, geo.size.width * 0.085), .bold)).tracking(-0.4)
                        .foregroundStyle(Color.white.opacity(0.92)).multilineTextAlignment(.leading).lineLimit(3)
                        .shadow(color: .black.opacity(0.25), radius: 6, y: 2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading).padding(geo.size.width * 0.07)
                }
            }
        }
    }

    /// The two colours of a title ID: a hue from its bits, the second one a step around the wheel, both deep enough for white text.
    static func colours(_ titleID: String) -> (Color, Color) {
        var h: UInt64 = 1469598103934665603
        for u in titleID.uppercased().utf8 { h = (h ^ UInt64(u)) &* 1099511628211 }
        let hue = Double(h % 360) / 360
        return (Color(hue: hue, saturation: 0.62, brightness: 0.62), Color(hue: (hue + 0.11).truncatingRemainder(dividingBy: 1), saturation: 0.72, brightness: 0.30))
    }

    /// The initials of a name's first two words ("Pokemon Pokopia" → "PP").
    static func monogram(_ name: String) -> String {
        name.split(whereSeparator: { !$0.isLetter && !$0.isNumber }).prefix(2).compactMap(\.first).map { String($0).uppercased() }.joined()
    }
}

extension LauncherView {
    /// A collection card's cover when the game has no banner (its own view keeps the card's expression small for the type checker).
    func cardCover(_ game: LibraryGame) -> some View { GameCover(name: game.name, titleID: game.titleID) }
}

/// Hermit's flat mark for the header: a screen outline between a green and a red grip, on a slim laptop base (the app icon's idea, flat).
struct S2MMark: View {
    var body: some View {
        GeometryReader { g in
            let w = g.size.width, h = g.size.height, baseH = max(2.2, h * 0.11), lidH = h - baseH - max(1.5, h * 0.07)
            let grip = w * 0.17, gap = w * 0.03, inset = w * 0.06
            ZStack(alignment: .topLeading) {
                UnevenRoundedRectangle(topLeadingRadius: lidH / 2, bottomLeadingRadius: lidH / 2, bottomTrailingRadius: 1.5, topTrailingRadius: 1.5)
                    .fill(LauncherPalette.ready).frame(width: grip, height: lidH).offset(x: inset)
                RoundedRectangle(cornerRadius: lidH * 0.14).strokeBorder(Color.white, lineWidth: max(1.5, lidH * 0.1))
                    .frame(width: w - 2 * (inset + grip + gap), height: lidH).offset(x: inset + grip + gap)
                UnevenRoundedRectangle(topLeadingRadius: 1.5, bottomLeadingRadius: 1.5, bottomTrailingRadius: lidH / 2, topTrailingRadius: lidH / 2)
                    .fill(LauncherPalette.building).frame(width: grip, height: lidH).offset(x: w - inset - grip)
                Capsule().fill(Color.white.opacity(0.85)).frame(width: w, height: baseH).offset(y: h - baseH)   // the laptop's base
            }
        }
    }
}
