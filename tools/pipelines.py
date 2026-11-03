#!/usr/bin/env python3
"""The shared pipeline list: the shaders and Metal pipelines players have met, so a new install builds them before its first frame instead of
stuttering while it plays. The list is the game profile's pso_manifest.tsv (nxnative/dm/games/<title ID>/): shader keys and render state only,
never game data. The app records every shader and pipeline it builds in pso_user.tsv next to its save folder.

  tools/pipelines.py new [<title ID>]      rows your app recorded that the shared list lacks → pipelines-<title ID>.tsv (to attach to an issue or PR)
  tools/pipelines.py merge <file> [...]     add rows from contributed files to the shared list (duplicates and malformed rows dropped)

<title ID> defaults to the only game in games/. The app's list: ~/Library/Application Support/nxnative/<title ID>/pso_user.tsv.
"""
import json, re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ROW = re.compile(r'^(S\t[0-9a-f]{16}_[a-z]+\t\d+|C\t[0-9a-f]{16}_[a-z]+|R\t[0-9a-f]+)$')   # keys, stages and render state as hex: nothing else is accepted


def title(a):
    ids = [json.loads(p.read_text())['title_id'] for p in (ROOT / 'games').glob('*/game.json')]
    if a: return a
    if len(ids) != 1: sys.exit(f'name the title ID: {", ".join(ids)}')
    return ids[0]


def rows(p):
    return [l for l in Path(p).read_text(errors='replace').splitlines() if ROW.match(l)]


def main():
    a = sys.argv[1:]
    if not a or a[0] not in ('new', 'merge'): sys.exit(__doc__)
    if a[0] == 'new':
        tid = title(a[1] if len(a) > 1 else None)
        user = Path.home() / f'Library/Application Support/nxnative/{tid}/pso_user.tsv'
        if not user.exists(): sys.exit(f'{user} does not exist yet: play the game first')
        have = set(rows(ROOT / f'nxnative/dm/games/{tid}/pso_manifest.tsv'))
        new = [r for r in dict.fromkeys(rows(user)) if r not in have]
        out = Path(f'pipelines-{tid}.tsv')
        out.write_text(''.join(r + '\n' for r in new))
        print(f'{len(new)} new rows → {out.resolve()}' + ('' if new else ' (nothing to send)'))
        return
    tid = title(None); man = ROOT / f'nxnative/dm/games/{tid}/pso_manifest.tsv'
    lines = man.read_text().splitlines(); have = set(lines); add = []
    for f in a[1:]:
        add += [r for r in rows(f) if r not in have and not have.add(r)]
    man.write_text('\n'.join(lines + add) + '\n')
    print(f'{len(add)} rows added to {man.relative_to(ROOT)}')


if __name__ == '__main__':
    main()
