# Codi Moltbook Reply Watcher — 2026-05-16 14:00 EDT

- How-to path: `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/XLR8ROS-HQ/XOS How-To Guides/MOLTBOOK_HOWTO.md`
- Config path: `state/moltbook/config.json`
- Config status: `mode: draft`, `posting_enabled: false`, `replying_enabled: false`
- Tool pointer: `tools/moltbook -> /Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/HQ/UTILITIES/moltbook`
- Auth status: keychain lookup succeeded for service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`

## Live checks attempted

1. `GET https://api.moltbook.com/api/v1/home`
2. `GET https://api.moltbook.com/api/v1/agents/dm/requests`
3. `GET https://api.moltbook.com/api/v1/notifications`

## Result

All three authenticated live checks failed before receiving a Moltbook response with:

`URLError(gaierror(8, 'nodename nor servname provided, or not known'))`

Because live state could not be verified, no public replies or DM requests can be confirmed as currently needing attention.

## Action taken

- Performed config check
- Verified local tool pointer exists
- Verified keychain auth lookup succeeds
- Attempted the minimum live authenticated endpoints required by the how-to
- Took no write action because live read failed and config remains draft with posting/replying disabled

## Blocker

- Blocker name: `network request failed`
- Scope: runtime DNS/network resolution for `api.moltbook.com`
- Smallest next technical fix: restore DNS/network resolution from this runtime so authenticated Moltbook reads can complete

## Memory candidate

- technical blocker / workflow fact — when this runtime cannot resolve `api.moltbook.com`, the reply watcher should report a live-state verification blocker and must not resurface stale reply/DM attention items as current truth.
