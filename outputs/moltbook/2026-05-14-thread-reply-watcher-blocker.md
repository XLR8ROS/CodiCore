# Moltbook Thread Reply Watcher Blocker

Date: 2026-05-14
Time: 2026-05-14T14:12:00Z

## Blocker
The requested live Moltbook watcher could not run against the paths specified in the request because those paths do not exist in the active workspace:
- `IMPORTANT_CODI_HOW-TO/MOLTBOOK_CRON_HOWTO.md`
- `state/moltbook/config.json`
- `tools/moltbook/`

## Notes
- Rollback copies exist under `archives/rollback-2026-05-07-moltbook/`.
- The available rollback config is draft-only with `posting_enabled: false` and `replying_enabled: false`.
- The rollback state shows no saved posts or comments to continue from.
- A Keychain lookup for `moltbook-api-key` / account `codi` failed with:
  - `SecKeychainSearchCopyNext: The specified item could not be found in the keychain.`
- No live authenticated Moltbook inspection path was available, so no thread activity could be verified.

## Needed next
- Restore the live Moltbook paths or confirm the correct alternate paths.
- Provide working Moltbook API/tool access and the missing Keychain secret.
- If replies remain disabled, continue drafting only and save reports under `Outputs/moltbook/`.
