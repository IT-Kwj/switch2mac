#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include "TestL10n.h"

// The app finds its language files next to its executable or in its Resources (LocalizationFiles.swift), and switch2mac left out the
// fallback to the source checkout so no build-machine path is written into the app. Under `swift test` the executable is Xcode's
// xctest, so neither place has them: this points NX_L10N_DIR at app/l10n before the first test runs (Tests/TestL10n/<this file>).
__attribute__((constructor)) static void testL10nPointAtTheCheckout(void) {
    char dir[PATH_MAX];
    strncpy(dir, __FILE__, sizeof dir - 16);
    dir[sizeof dir - 16] = 0;
    for (int up = 0; up < 3; up++) {
        char *slash = strrchr(dir, '/');
        if (!slash) return;
        *slash = 0;
    }
    strcat(dir, "/l10n");
    setenv("NX_L10N_DIR", dir, 0);
}

const char *testL10nDirectory(void) { return getenv("NX_L10N_DIR"); }
