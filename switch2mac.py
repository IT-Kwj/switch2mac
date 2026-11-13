#!/usr/bin/env python3
"""The old name of hermit.py, kept so that everything that still runs ./switch2mac.py keeps working: Hermit apps up to 0.5.0 (which were
called switch2mac) start their builds through this file, and older guides name it. It runs hermit.py with the same arguments, in the
same Python. Use ./hermit.py."""
import runpy, sys
from pathlib import Path

_HERMIT = Path(__file__).resolve().with_name("hermit.py")
if __name__ == "__main__":
    runpy.run_path(str(_HERMIT), run_name="__main__")
else:   # imported as a module (an older tool): hermit.py's names, without running a command
    globals().update({k: v for k, v in runpy.run_path(str(_HERMIT), run_name="hermit").items() if not k.startswith("__")})
