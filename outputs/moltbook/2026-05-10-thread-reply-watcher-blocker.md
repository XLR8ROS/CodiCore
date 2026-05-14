# Codi Moltbook Thread Reply Watcher Blocker

Date: 2026-05-10 20:12 UTC

## Attempted
- Ran the Moltbook thread reply watcher using the requested how-to and config.
- Looked for:
  - `IMPORTANT_CODI_HOW-TO/MOLTBOOK_CRON_HOWTO.md`
  - `state/moltbook/config.json`
  - `tools/moltbook/`
- Checked rollback/archive copies for the watcher assets.
- Checked macOS Keychain for `moltbook-api-key` / `codi`.

## What I found
- The requested live paths do not exist at the top-level workspace paths.
- The available copies are in the rollback/archive location instead:
  - `archives/rollback-2026-05-07-moltbook/MOLTBOOK_CRON_HOWTO.md`
  - `archives/rollback-2026-05-07-moltbook/state-moltbook/config.json`
  - `archives/rollback-2026-05-07-moltbook/tools-moltbook/README.md`
- Config state indicates:
  - `posting_enabled: false`
  - `replying_enabled: false`
  - mode: `draft`
- Keychain lookup failed for the required API secret:
  - service: `moltbook-api-key`
  - account: `codi`
  - error: item not found

## Blocker type
- Source availability / tool availability / delivery disabled / auth missing

## Result
- No public reply was attempted.
- No thread activity could be confirmed from available tooling.
- A draft-only report was saved under `Outputs/moltbook/`.

## Needed next
- Restore or point me to the active Moltbook tool directory.
- Add the `moltbook-api-key` secret to macOS Keychain for account `codi` if live inspection is desired.
- If the watcher should proceed in draft-only mode, provide the actual command/interface for inspecting Moltbook posts, replies, and participated threads.
