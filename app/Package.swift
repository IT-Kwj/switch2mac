// swift-tools-version:6.0
import PackageDescription

// The import rules are in ARCHITECTURE.md. Each target may only import the ones above it:
// NXCore (Foundation), NXModel (NXCore), NXLauncher (NXModel, NXCore), Hermit (all).
// All targets build in Swift 5 mode for now: NXCore does not build in Swift 6 mode yet (LauncherWork.counts, PipeReader).
let package = Package(
    name: "hermit-app",
    platforms: [.macOS(.v13)],
    targets: [
        .target(name: "NXCore", path: "Sources/NXCore"),
        .target(name: "NXModel", dependencies: ["NXCore"], path: "Sources/NXModel"),
        .target(name: "NXLauncher", dependencies: ["NXModel", "NXCore"], path: "Sources/NXLauncher"),
        .executableTarget(name: "Hermit", dependencies: ["NXLauncher", "NXModel", "NXCore"], path: "Sources/Hermit"),
        // Points the tests at app/l10n (the test runner is Xcode's xctest, so the app's own search does not find it).
        .target(name: "TestL10n", path: "Tests/TestL10n"),
        // Tests of the pure logic: they link NXCore only, so they run without SwiftUI.
        .testTarget(name: "NXCoreTests", dependencies: ["NXCore", "TestL10n"]),
        // Tests of the stores: they link NXModel and NXCore, never SwiftUI.
        .testTarget(name: "NXModelTests", dependencies: ["NXModel", "NXCore", "TestL10n"]),
        .testTarget(name: "HermitTests", dependencies: ["Hermit", "NXLauncher", "NXModel", "NXCore", "TestL10n"])
    ],
    swiftLanguageModes: [.v5]
)
