#!/bin/zsh
# switch2mac: double-click this file to build a Mac app of your game.
# It checks your Mac, asks for your game's dump folder (drag it into the window), builds the app and puts it in Applications.
# Each step is the same as typing ./switch2mac.py setup, build and install in Terminal (README.md). S2M_NO_INSTALL=1 stops after the build (testing).
cd "${0:A:h}" || exit 1
setopt extendedglob
clear
print "switch2mac: build a Mac app of your game"
print "========================================\n"
finish() { print "\n$1"; print "\nPress any key to close this window."; read -sk1; exit ${2:-0} }

print "Step 1 of 3: checking this Mac (the first time also installs a few Python packages)\n"
if ! /usr/bin/python3 ./switch2mac.py setup; then
  finish "Something is missing: install what the MISSING lines above say, then double-click this file again." 1
fi

print "\nStep 2 of 3: your game"
print "Drag your game's dump folder from Finder into this window, then press Return."
print "(The folder that holds exefs and romfs, or base and updates. Games here: Mario Kart World, Donkey Kong Bananza, Pokemon Pokopia.)\n"
read -r "dump?Dump folder: "
dump=${dump%%[[:space:]]#}; dump=${(Q)dump}
dump=${dump%/}
[[ -d $dump ]] || finish "That is not a folder: $dump\nDouble-click this file again and drag the folder itself into the window." 1

print "\nBuilding. The first build of a game takes a while (Mario Kart World: 20-30 minutes; Donkey Kong Bananza: over an hour) and uses every core: the fans may spin up. Keep this window open.\n"
if ! /usr/bin/python3 ./switch2mac.py build "$dump"; then
  finish "The build stopped. The lines just above say why. If you report it, attach a screenshot of this window (never game files)." 1
fi

if [[ $S2M_NO_INSTALL == 1 ]]; then   # testing: build only, leave Applications as it is
  finish "Built (not installed: S2M_NO_INSTALL=1). The app is in the work folder." 0
fi
print "\nStep 3 of 3: putting the app in Applications\n"
if ! /usr/bin/python3 ./switch2mac.py install; then
  finish "Installing stopped: the lines above say why (is the game still open? quit it first)." 1
fi
finish "Done! Open the game from your Applications folder.\nThe first start after installing waits 1-3 minutes while macOS checks the app (no window yet): wait, and don't open it twice.\nIn the game: key 1 shows the performance overlay, key 2 the settings."
