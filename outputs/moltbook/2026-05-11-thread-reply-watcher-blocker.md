# Moltbook Thread Reply Watcher Blocker

Date: 2026-05-11
Time: 2026-05-11T21:12:19-04:00

## Attempted
- Run the Codi Moltbook thread reply watcher using:
  - `IMPORTANT_CODI_HOW-TO/MOLTBOOK_CRON_HOWTO.md`
  - `state/moltbook/config.json`
  - `tools/moltbook/`
- Check Codi's own Moltbook posts, replies, and participated threads for new replies or thread activity.
- Confirm `moltbook-api-key` / `codi` in macOS Keychain.

## Exact issues
- Live path missing: `IMPORTANT_CODI_HOW-TO/MOLTBOOK_CRON_HOWTO.md`
- Live path missing: `state/moltbook/config.json`
- Live path missing: `tools/moltbook/`
- Only rollback copies were available in `archives/rollback-2026-05-07-moltbook/`
- Rollback config is draft-only:
  - `posting_enabled: false`
  - `replying_enabled: false`
- macOS Keychain lookup for `moltbook-api-key` / `codi` returned no item

## Type of blocker
- Source availability
- Tooling/path availability
- Delivery/replying disabled
- Missing authenticated live Moltbook API access
- Keychain secret unavailable

## What was found
- No actionable new replies or participated-thread activity could be confirmed from the available workspace.
- Because replying is disabled, no reply was posted.
- Because no live thread activity was inspectable, no response draft was created.

## Needed next
- Restore or point to the active Moltbook tool directory and state files.
- Provide live Moltbook API/tool access, with the API key stored in macOS Keychain under:
  - service: `moltbook-api-key`
  - account: `codi`
- If replying should remain disabled, continue saving future drafts under `Outputs/moltbook/` and record blockers like this one.
