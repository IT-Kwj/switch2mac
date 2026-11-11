#!/bin/bash
# Wraps a finished, signed switch2mac.app in an installer package for the release page: switch2mac-<version>.pkg.
# Why a package: switch2mac has no paid Apple Developer ID. macOS calls a downloaded app with only an ad-hoc signature "damaged" and offers
# no way to open it, while an unsigned installer package gets "Apple could not verify ..." and then Open Anyway in System Settings > Privacy &
# Security. The app the installer puts in /Applications carries no download mark, so it opens normally from then on. The zip stays on the
# release too: the app's own updater installs from it.
# Usage: make_pkg.sh <switch2mac.app> <version> [output folder]
set -euo pipefail
APP=${1:?usage: make_pkg.sh <switch2mac.app> <version> [output folder]}
VERSION=${2:?version, for example 0.4.1}
OUT=${3:-$(dirname "$APP")}
[ -d "$APP/Contents" ] || { echo "not an app: $APP" >&2; exit 1; }
codesign -v --deep --strict "$APP" || { echo "the app's signature does not hold: sign it again before packing" >&2; exit 1; }

WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT
mkdir "$WORK/root"
ditto "$APP" "$WORK/root/switch2mac.app"
# a copy found elsewhere (Downloads) must not be updated in place: always install into /Applications
pkgbuild --analyze --root "$WORK/root" "$WORK/comp.plist" > /dev/null
# plutil -replace sets a key whether pkgbuild wrote it or not (macOS 27's pkgbuild leaves BundleIsRelocatable out; PlistBuddy's Set then failed)
plutil -replace 0.BundleIsRelocatable -bool NO "$WORK/comp.plist"
plutil -replace 0.BundleOverwriteAction -string upgrade "$WORK/comp.plist"
PKG="$OUT/switch2mac-$VERSION.pkg"
pkgbuild --root "$WORK/root" --component-plist "$WORK/comp.plist" --identifier io.github.azmasm.switch2mac.pkg \
    --version "$VERSION" --install-location /Applications "$PKG"
files=$(pkgutil --payload-files "$PKG")
grep -qx './switch2mac.app/Contents/MacOS/switch2mac' <<< "$files" || { echo "the package does not hold the app" >&2; exit 1; }
echo "$PKG"
