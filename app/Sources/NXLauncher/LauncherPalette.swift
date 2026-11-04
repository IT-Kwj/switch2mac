import SwiftUI

package enum LauncherPalette {
    package static let background = Color(red: 0.055, green: 0.055, blue: 0.06)
    package static let surface = Color(red: 0.10, green: 0.10, blue: 0.11)
    package static let cream = Color(red: 0.25, green: 0.84, blue: 0.47)   // switch2mac: green and black, so the accent (Play, Start, selections) is the green of `ready`
    package static let off = Color(red: 0.86, green: 0.24, blue: 0.24)   // a switch that is off
    package static let ready = Color(red: 0.25, green: 0.84, blue: 0.47)
    package static let building = Color(red: 0.92, green: 0.27, blue: 0.27)   // switch2mac: red for Stop, warnings and in-progress marks (green, red and black)
    package static let progress = Color(red: 1, green: 0.78, blue: 0.24)   // the loading bar keeps its yellow
    package static let unbuilt = Color(red: 0.57, green: 0.58, blue: 0.61)
}
