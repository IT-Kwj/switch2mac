#!/usr/bin/env python3
# Keeps this repository's issues free of what it must never hold (LEGAL.md): console keys, game files and links to sites that hand out games.
# Run by .github/workflows/issue-guard.yml on every new or edited issue and comment. On a hit an issue is labelled "needs-review", closed and
# locked with a short comment; a comment is hidden (minimized) and answered. The maintainer then deletes what is needed. The matched text is
# never printed: Actions logs are public. `issue_guard.py --test` checks the rules.
import json, os, re, subprocess, sys

# prod.keys / title.keys lines: a key name, "=", 32 or more hex digits; or one of the well-known key names with a value
KEY_LINE = re.compile(r'(?im)^\s*[a-z][a-z0-9_]{2,}\s*=\s*[0-9a-f]{32,}\s*$')
KEY_NAMED = re.compile(r'(?i)\b(header_key|master_key_[0-9a-f]{2}|key_area_key_\w+|titlekek_[0-9a-f]{2}|package2_key_[0-9a-f]{2})\b\s*[=:]\s*[0-9a-f]{16,}')
# an attached or linked keys file
KEY_FILE = re.compile(r'(?i)\b(prod|title|dev)\.keys\b[^\s)]*\)|https?://\S*(prod|title)\.keys\b')
# sites known for handing out game files, firmware or keys (not general file hosts)
PIRACY_HOSTS = ['nsw2u', 'nswdl', 'nxbrew', 'ziperto', 'romslab', 'switchrom', 'romsfun', 'hshop.erista', 'sigmapatches', 'nswrom']
PIRACY = re.compile(r'(?i)https?://(?:[\w-]+\.)*(?:' + '|'.join(map(re.escape, PIRACY_HOSTS)) + r')[\w.-]*')


def problems(text):
    """The reasons this text cannot stay (no part of the text itself)."""
    out = []
    if KEY_LINE.search(text) or KEY_NAMED.search(text): out.append('what looks like console key contents')
    if KEY_FILE.search(text): out.append('a keys file')
    if PIRACY.search(text): out.append('a link to a site that hands out games')
    return out


def gh(*args, data=None):
    return subprocess.run(['gh', *args], input=data, text=True, capture_output=True, check=False)


def act(event):
    repo = os.environ['GITHUB_REPOSITORY']
    issue, comment = event.get('issue') or {}, event.get('comment')
    text = (comment or issue).get('body') or ''
    if not comment: text = (issue.get('title') or '') + '\n' + text
    why = problems(text)
    if not why: print('nothing to do'); return
    print('found:', ', '.join(why))   # the reasons only, never the text
    n = issue['number']
    gh('label', 'create', 'needs-review', '--repo', repo, '--color', 'B60205', '--description', 'Hidden by the issue guard: the maintainer reviews it')   # once; fails harmlessly after
    note = ('This was hidden automatically because it seems to contain ' + ' and '.join(why) + '. switch2mac never accepts console keys, game '
            'files or links to them: see [LEGAL.md](../blob/main/LEGAL.md). The maintainer will review it. If this was a mistake, please post again without it.')
    if comment:
        gh('api', 'graphql', '-f', 'query=mutation($id: ID!) { minimizeComment(input: {subjectId: $id, classifier: OFF_TOPIC}) { clientMutationId } }',
           '-f', f'id={comment["node_id"]}')
        gh('issue', 'comment', str(n), '--repo', repo, '--body', note)
        gh('issue', 'edit', str(n), '--repo', repo, '--add-label', 'needs-review')
    else:
        gh('issue', 'edit', str(n), '--repo', repo, '--add-label', 'needs-review')
        gh('issue', 'comment', str(n), '--repo', repo, '--body', note)
        gh('issue', 'close', str(n), '--repo', repo, '--reason', 'not planned')
        gh('issue', 'lock', str(n), '--repo', repo, '--reason', 'off-topic')


def test():
    hexkey = 'ab' * 16
    assert problems(f'header_key = {hexkey * 2}')
    assert problems(f'master_key_0a = {hexkey}')
    assert problems('here is my file [prod.keys](https://github.com/user-attachments/files/1/prod.keys)')
    assert problems('got it from https://nsw2u.example/game')
    assert problems('see https://www.nxbrew.net/x')
    # what must pass: reports, shader lists, hashes, ordinary links, a mention of prod.keys in words
    assert not problems('Mario Kart World on an M1 Max, 55-60 fps, switch2mac 0656fd1b')
    assert not problems('0400C3F00006E000\t3a4ccb9b87f71672\tps\n8692b34b521225be\tcs')
    assert not problems('I chose my own prod.keys in Settings and the build worked')
    assert not problems('https://github.com/seedds/nxnative/pull/1663 and https://mega.nz is fine to mention')
    print('issue_guard: rules OK')


if __name__ == '__main__':
    if sys.argv[1:] == ['--test']: test()
    else: act(json.load(open(os.environ['GITHUB_EVENT_PATH'])))
