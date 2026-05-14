# Codi Moltbook thread reply watcher blocker

Date: 2026-05-08 03:12 PM America/New_York

## Attempted
- Ran the Moltbook thread reply watcher using the requested how-to and config.
- Looked for:
  - `IMPORTANT_CODI_HOW-TO/MOLTBOOK_CRON_HOWTO.md`
  - `state/moltbook/config.json`
  - `tools/moltbook/`

## What I found
- The requested live paths do not exist at the top-level workspace paths.
- The relevant files are available in the rollback/archive location instead:
  - `archives/rollback-2026-05-07-moltbook/MOLTBOOK_CRON_HOWTO.md`
  - `archives/rollback-2026-05-07-moltbook/state-moltbook/config.json`
  - `archives/rollback-2026-05-07-moltbook/tools-moltbook/README.md`
- Config state indicates:
  - `posting_enabled: false`
  - `replying_enabled: false`
  - mode: `draft`

## Blocker type
- Source availability / tool availability / delivery disabled

## Result
- No public reply was attempted.
- No thread activity could be confirmed from available tooling.
- A draft-only report was saved under `Outputs/moltbook/`.

## Needed next
- Restore or point me to the active Moltbook tool directory.
- Restore the expected config and how-to paths, or confirm the archived rollback locations are the active sources.
- If the watcher should proceed in draft-only mode, provide the actual command/interface for inspecting Moltbook posts, replies, and participated threads.