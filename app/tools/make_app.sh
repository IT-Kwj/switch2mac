#!/bin/bash
# Makes switch2mac.app from this folder: the release build of the launcher, its texts (l10n), its icon (icon/make_icon.swift), an
# Info.plist, and an ad-hoc signature. The release app also carries Python and the build tools: tools/bundle_tools.sh <app>/Contents/Resources
# (pass --bundle-tools; without it the app uses the Python and Homebrew tools it finds, which is enough on a developer's Mac).
#
# Usage: tools/make_app.sh [out folder (default: build)] [--bundle-tools]
set -euo pipefail
cd "$(dirname "$0")/.."
OUT=build; TOOLS=0
for a in "$@"; do case "$a" in --bundle-tools) TOOLS=1 ;; *) OUT="$a" ;; esac; done
VERSION=$(sed -n 's/.*nonisolated package static let appVersion = "\(.*\)".*/\1/p' Sources/NXModel/AppUpdateStore.swift)
APP="$OUT/switch2mac.app"

# the source folder's path is mapped to /switch2mac, so no path of the Mac that builds it (#filePath, debug info) ends up in the app
MAP=(-Xswiftc -file-prefix-map -Xswiftc "$PWD=/switch2mac")
swift build -c release "${MAP[@]}"
rm -rf "$APP"; mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources"
cp "$(swift build -c release "${MAP[@]}" --show-bin-path)/Switch2Mac" "$APP/Contents/MacOS/switch2mac"
strip -S "$APP/Contents/MacOS/switch2mac"   # the debug map names each object file by its full path on the Mac that built it
cp -R l10n "$APP/Contents/Resources/l10n"

ICONSET=$(mktemp -d)/AppIcon.iconset; mkdir -p "$ICONSET"
swift icon/make_icon.swift "$ICONSET/icon_512x512@2x.png" 1024 >/dev/null
for s in 16 32 128 256 512; do
  sips -z $s $s "$ICONSET/icon_512x512@2x.png" --out "$ICONSET/icon_${s}x${s}.png" >/dev/null
  sips -z $((s * 2)) $((s * 2)) "$ICONSET/icon_512x512@2x.png" --out "$ICONSET/icon_${s}x${s}@2x.png" >/dev/null
done
iconutil -c icns "$ICONSET" -o "$APP/Contents/Resources/AppIcon.icns"
# the header's mark: the icon without its squircle, fading out at its edges into the black bar
ICON_HEADER=1 swift icon/make_icon.swift "$APP/Contents/Resources/HeaderMark.png" 1024 >/dev/null

cat > "$APP/Contents/Info.plist" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
  <key>CFBundleName</key><string>switch2mac</string>
  <key>CFBundleDisplayName</key><string>switch2mac</string>
  <key>CFBundleIdentifier</key><string>io.github.azmasm.switch2mac</string>
  <key>CFBundleExecutable</key><string>switch2mac</string>
  <key>CFBundleIconFile</key><string>AppIcon</string>
  <key>CFBundlePackageType</key><string>APPL</string>
  <key>CFBundleShortVersionString</key><string>$VERSION</string>
  <key>CFBundleVersion</key><string>$VERSION</string>
  <key>LSMinimumSystemVersion</key><string>13.0</string>
  <key>LSApplicationCategoryType</key><string>public.app-category.games</string>
  <key>NSHighResolutionCapable</key><true/>
</dict></plist>
PLIST

if [ "$TOOLS" = 1 ]; then tools/bundle_tools.sh "$APP/Contents/Resources"; fi
find "$APP" -name __pycache__ -type d -prune -exec rm -rf {} +   # compiled Python caches name the folder they were made in
if grep -rlaq "$HOME" "$APP"; then echo "stopped: the app holds this Mac's home folder path:"; grep -rla "$HOME" "$APP"; exit 1; fi
codesign --force --deep --sign - "$APP"
echo "app: $APP ($VERSION)"
