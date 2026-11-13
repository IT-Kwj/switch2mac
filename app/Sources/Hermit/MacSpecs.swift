import SwiftUI
import AppKit
import IOKit
import UniformTypeIdentifiers
import NXLauncher
import NXModel

/// What Hermit reads about this Mac: the model, the chip and its CPU and GPU cores, memory, macOS and free space. The per-Mac build
/// choice reads the same values (a game's best build depends on the chip's generation and on memory). Nothing here leaves the Mac.
struct MacSpecs: Equatable {
    var modelID = "", modelName = "", chip = "", performanceCores = 0, efficiencyCores = 0, gpuCores = 0, memoryGB = 0, macOS = "", freeGB = 0

    /// The chip's generation (1 for M1, 2 for M2, ...), 0 when it cannot be read.
    var generation: Int { Int(chip.split(separator: " ").first { $0.hasPrefix("M") && $0.dropFirst().allSatisfy(\.isNumber) }?.dropFirst() ?? "") ?? 0 }

    static func read() -> MacSpecs {
        var s = MacSpecs()
        func string(_ name: String) -> String {
            var n = 0; sysctlbyname(name, nil, &n, nil, 0); guard n > 0 else { return "" }
            var b = [CChar](repeating: 0, count: n); sysctlbyname(name, &b, &n, nil, 0); return String(cString: b)
        }
        func int(_ name: String) -> Int64 { var v: Int64 = 0, n = MemoryLayout<Int64>.size; return sysctlbyname(name, &v, &n, nil, 0) == 0 ? v : 0 }
        s.modelID = string("hw.model"); s.chip = string("machdep.cpu.brand_string")
        s.performanceCores = Int(int("hw.perflevel0.physicalcpu")); s.efficiencyCores = Int(int("hw.perflevel1.physicalcpu"))
        s.memoryGB = Int(int("hw.memsize") >> 30)
        let v = ProcessInfo.processInfo.operatingSystemVersion
        s.macOS = "\(v.majorVersion).\(v.minorVersion)" + (v.patchVersion > 0 ? ".\(v.patchVersion)" : "")
        let free = (try? URL(fileURLWithPath: "/").resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey]).volumeAvailableCapacityForImportantUsage) ?? 0
        s.freeGB = Int((free ?? 0) / 1_000_000_000)
        // the GPU's core count, from the graphics driver's registry entry
        let service = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceMatching("AGXAccelerator"))
        if service != 0 {
            if let n = IORegistryEntryCreateCFProperty(service, "gpu-core-count" as CFString, kCFAllocatorDefault, 0)?.takeRetainedValue() as? Int { s.gpuCores = n }
            IOObjectRelease(service)
        }
        s.modelName = Self.marketingName(s.modelID)
        return s
    }

    /// "MacBook Pro" from "MacBookPro18,4" (the family; macOS's own picture shows which one it is).
    static func marketingName(_ id: String) -> String {
        let family = id.prefix { $0.isLetter }
        switch family {
        case "MacBookPro": return "MacBook Pro"
        case "MacBookAir": return "MacBook Air"
        case "Macmini": return "Mac mini"
        case "iMac": return "iMac"
        case "MacPro": return "Mac Pro"
        default: return id.hasPrefix("Mac") ? "Mac" : id
        }
    }

    /// macOS's own picture of this Mac model (the one About This Mac shows), large. nil when macOS has none.
    static func picture(_ modelID: String) -> NSImage? {
        guard let type = UTType(tag: modelID, tagClass: UTTagClass(rawValue: "com.apple.device-model-code"), conformingTo: nil) else { return nil }
        let image = NSWorkspace.shared.icon(for: type)
        image.size = NSSize(width: 512, height: 512)
        return image
    }
}

/// The Builds page's "Your Mac" card: this Mac's picture and what Hermit reads about it.
struct YourMacCard: View {
    @State private var specs = MacSpecs()
    @State private var picture: NSImage?

    var body: some View {
        CardGroup("Your Mac", footnote: "Hermit reads these to choose the best build of each game for this Mac. Nothing is sent anywhere.") {
            HStack(alignment: .center, spacing: 28) {
                Group {
                    if let picture { Image(nsImage: picture).resizable().interpolation(.high).aspectRatio(contentMode: .fit) }
                    else { Image(systemName: "laptopcomputer").resizable().aspectRatio(contentMode: .fit).foregroundStyle(.secondary).padding(20) }
                }
                .frame(width: 170, height: 130)
                .shadow(color: .black.opacity(0.5), radius: 16, y: 8)
                VStack(alignment: .leading, spacing: 10) {
                    Text(specs.modelName.isEmpty ? "This Mac" : specs.modelName).font(.manrope(24, .bold)).tracking(-0.4)
                    VStack(alignment: .leading, spacing: 6) {
                        spec("Chip", specs.chip.isEmpty ? "—" : specs.chip + cores)
                        spec("Memory", specs.memoryGB > 0 ? "\(specs.memoryGB) GB" : "—")
                        spec("macOS", specs.macOS)
                        spec("Free space", "\(specs.freeGB) GB")
                    }
                }
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 20).padding(.vertical, 18)
        }
        .task {
            let s = await Task.detached { MacSpecs.read() }.value
            specs = s; picture = MacSpecs.picture(s.modelID)
        }
    }

    private var cores: String {
        var parts: [String] = []
        if specs.performanceCores + specs.efficiencyCores > 0 { parts.append("\(specs.performanceCores + specs.efficiencyCores)-core CPU") }
        if specs.gpuCores > 0 { parts.append("\(specs.gpuCores)-core GPU") }
        return parts.isEmpty ? "" : " · " + parts.joined(separator: " · ")
    }

    private func spec(_ label: String, _ value: String) -> some View {
        HStack(spacing: 0) {
            Text(label).font(.manrope(13, .medium)).foregroundStyle(LauncherPalette.unbuilt).frame(width: 96, alignment: .leading)
            Text(value).font(.manrope(14, .semibold))
        }
    }
}
