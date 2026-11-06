import XCTest
@testable import Switch2Mac

final class GameRunsTests: XCTestCase {
    private let log = """
    launcher: Mario Kart World (0400C3F00006E000), host /Applications/Mario Kart World.app/Contents/MacOS/dmhost
    launcher: env S2M_ENGINE=nxnative-84dea6983541 (/Applications/Mario Kart World.app/Contents/Resources/dm/env.txt)
    [dm] build: commit 84dea6983541+dirty, shader chain 3790e6eafb02, profile 0400C3F00006E000
    [dm] [nvn] power up to frame 600: CPU energy 3.14 W, 66.6 mJ per frame (40.0 fps); CPU 180% (100 = one core), 98% of it on performance cores
    [dm] [nvn] frame interval up to frame 600: >16.7ms 300 / 300 frames, p99 40.00 ms
    [dm] [nvn] timing up to frame 600: frame time p50 16.65 / p95 19.15 / max 29.66 ms (300 frames); GPU p50 9.00 / p95 9.27 / max 10.31 ms (300 frames);
    [dm] [nvn-mtl] memory up to frame 600: resident 7062 MB, GPU allocated 6701 MB
    [dm] [nvn] power up to frame 900: CPU energy 3.14 W, 66.6 mJ per frame (60.0 fps); CPU 120% (100 = one core)
    [dm] [nvn] frame interval up to frame 900: >16.7ms 3 / 300 frames, p99 20.00 ms
    [dm] [nvn] frame interval up to frame 1200: >16.7ms 3 / 300 frames, p99 20.00 ms
    [dm] [nvn] timing up to frame 900: frame time p50 16.65 / p95 19.15 / max 29.66 ms (300 frames); GPU p50 8.00 / p95 9.27 / max 10.31 ms (300 frames);
    [dm] [nvn-mtl] memory up to frame 900: resident 9606 MB, GPU allocated 8342 MB
    launcher: the host exited with 0
    """

    func testSummary() throws {
        let start = Date(timeIntervalSince1970: 1_000_000)
        let run = try XCTUnwrap(GameRuns.summarize(log, titleID: "0400C3F00006E000", name: "", start: start, end: start + 600))
        XCTAssertEqual(run.name, "Mario Kart World")
        XCTAssertEqual(run.build, "nxnative 84dea698")
        XCTAssertEqual(run.avgFPS!, 48, accuracy: 0.01)   // the harmonic mean of 40 and 60
        XCTAssertEqual(run.minFPS, 40); XCTAssertEqual(run.maxFPS, 60)
        XCTAssertEqual(run.lowFPS!, 50, accuracy: 0.01)   // 1000 / the median p99 (20 ms)
        XCTAssertEqual(run.peakMemoryMB, 9606)
        XCTAssertEqual(run.gpuMs!, 8.5, accuracy: 0.01)
        XCTAssertEqual(run.cpuPercent!, 150, accuracy: 0.01)
        XCTAssertEqual(run.seconds, 600)
    }

    func testEngineNames() throws {
        let start = Date()
        func build(_ env: String) -> String? {
            GameRuns.summarize("launcher: env S2M_ENGINE=\(env) (x)\n[dm] build: commit 0123456789ab\n[dm] [nvn] power up to frame 600: (30.0 fps); CPU 100% (x)",
                               titleID: "0", name: "G", start: start, end: start)?.build
        }
        XCTAssertEqual(build("switch2mac"), "switch2mac 01234567")   // an older app: the commit from the build line
        XCTAssertEqual(build("pokopia-native-abcdef123456"), "pokopia-native abcdef12")
        XCTAssertEqual(build("nxnative-untested"), "nxnative untested")
        XCTAssertEqual(build("pokopia-native"), "pokopia-native 01234567")
    }

    func testNoFrameRateNoRun() {
        XCTAssertNil(GameRuns.summarize("launcher: the host exited with 1", titleID: "0", name: "G", start: Date(), end: Date()))
    }

    func testFormLink() throws {
        let start = Date(timeIntervalSince1970: 1_000_000)
        let run = try XCTUnwrap(GameRuns.summarize(log, titleID: "0400C3F00006E000", name: "Mario Kart World", start: start, end: start + 600))
        var specs = MacSpecs(); specs.modelName = "MacBook Pro"; specs.chip = "Apple M1 Max"; specs.memoryGB = 64; specs.macOS = "26.6"
        let url = try XCTUnwrap(ShareReport.url(run, specs, comment: "Smooth & no crashes + great"))
        let items = Dictionary(uniqueKeysWithValues: (URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems ?? []).map { ($0.name, $0.value ?? "") })
        XCTAssertEqual(items["template"], "how-it-ran.yml")
        XCTAssertEqual(items["title"], "[How it ran] Mario Kart World on M1 Max")
        XCTAssertEqual(items["build"], "nxnative")
        XCTAssertEqual(items["version"], "nxnative 84dea698")
        XCTAssertEqual(items["mac"], "MacBook Pro, M1 Max, 64 GB")
        XCTAssertEqual(items["fps"], "48 fps on average (40-60, 1% low 50)")
        XCTAssertEqual(items["memory"], "9.4 GB")
        XCTAssertTrue(items["notes"]!.hasPrefix("Smooth & no crashes + great\n"))   // & and + survive the link
    }
}
