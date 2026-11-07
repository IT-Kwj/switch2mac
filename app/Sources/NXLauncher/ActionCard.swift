import SwiftUI
import NXCore
import NXModel

/// The page's conclusion, at the end of its column: what is still missing, and the build button.
/// Observes the build store, and the dependency and repository stores for the status text.
package struct ActionCard: View {
    @ObservedObject var build: BuildStore
    @ObservedObject var dependencies: DependencyStore
    @ObservedObject var repo: RepoStore
    @EnvironmentObject var loc: Localizer

    package init(build: BuildStore, dependencies: DependencyStore, repo: RepoStore) {
        self.build = build
        self.dependencies = dependencies
        self.repo = repo
    }

    package var body: some View {
        HStack(spacing: 18) {
            statusText
            Spacer(minLength: 12)
            Button {
                build.running ? build.stop() : build.startBuild()
            } label: {
                Label(build.running ? loc.t(build.stopping ? "library.stopping" : "btn.stop") : (build.done ? loc.t("btn.rebuild") : loc.t("build.startGame")),
                      systemImage: build.running ? "stop.fill" : "hammer.fill")
                    .font(.manrope(15, .semibold)).padding(.horizontal, 24).padding(.vertical, 13)
                    .foregroundStyle(.black).background(build.running ? LauncherPalette.building : LauncherPalette.cream, in: Capsule())
            }
            .buttonStyle(.plain)
            .disabled(build.stopping || (!build.running && !build.canBuild))
            .opacity(build.stopping || (!build.running && !build.canBuild) ? 0.4 : 1)
            .keyboardShortcut(.return, modifiers: .command)
        }
        .padding(.top, 2)
        .staleFrameworksPrompt(build)
    }

    @ViewBuilder private var statusText: some View {
        if !build.doneNote.isEmpty {
            Text(build.doneNote).font(.manrope(13))
                .foregroundStyle(build.done ? LauncherPalette.ready : LauncherPalette.building).lineLimit(3)
        } else if !dependencies.checked {
            Text(loc.t("status.checkingDeps")).font(.manrope(13)).foregroundStyle(.secondary)
        } else if !dependencies.allPresent {
            Text(loc.t("status.installFirst")).font(.manrope(13)).foregroundStyle(LauncherPalette.building)
        } else if !repo.isRepo {
            Text(loc.t("status.chooseRepo")).font(.manrope(13)).foregroundStyle(LauncherPalette.building)
        } else if build.identifying {   // switch2mac: one dump folder, named by switch2mac.py identify
            Text("Reading your dump…").font(.manrope(13)).foregroundStyle(.secondary)
        } else if build.dumpInfo == nil {
            Text("Choose your game’s dump folder").font(.manrope(13)).foregroundStyle(.secondary)
        } else if build.dumpInfo?.ok != true {
            Text("This folder can’t be built: see above").font(.manrope(13)).foregroundStyle(LauncherPalette.building)
        } else if !build.keysReady {   // a Switch 1 game without a usable prod.keys
            Text("Choose your prod.keys above").font(.manrope(13)).foregroundStyle(LauncherPalette.building)
        } else {
            Text("The game goes to " + build.shortPath(build.switch2macLibraryDir))
                .font(.manrope(13)).foregroundStyle(.secondary).lineLimit(1).truncationMode(.head)
        }
    }
}
