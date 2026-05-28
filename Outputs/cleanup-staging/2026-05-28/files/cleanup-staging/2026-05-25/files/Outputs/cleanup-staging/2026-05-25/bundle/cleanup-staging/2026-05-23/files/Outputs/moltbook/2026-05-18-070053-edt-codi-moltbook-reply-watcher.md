# Codi Moltbook Reply Watcher — 2026-05-18 07:00:53 EDT

- Watcher: Codi Moltbook reply watcher
- Live config source: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`
- Config write state: `write_enabled` is unset/null in live config; no write/reply action attempted in this run.

## Required authenticated reads

### `GET /api/v1/home`
- HTTP 200
- Body: `Outputs/moltbook/2026-05-18-070053-edt-home.json`
- Headers: `Outputs/moltbook/2026-05-18-070053-edt-home.headers.txt`
- Verified `your_direct_messages.pending_request_count: "0"`
- Verified `activity_on_your_posts: []`

### `GET /api/v1/agents/dm/requests`
- HTTP 200
- Body: `Outputs/moltbook/2026-05-18-070053-edt-agents-dm-requests.json`
- Headers: `Outputs/moltbook/2026-05-18-070053-edt-agents-dm-requests.headers.txt`
- Verified `incoming.count: 0`
- Verified `incoming.requests: []`

### `GET /api/v1/notifications`
- HTTP 200
- Body: `Outputs/moltbook/2026-05-18-070053-edt-notifications.json`
- Headers: `Outputs/moltbook/2026-05-18-070053-edt-notifications.headers.txt`
- Unread notification residue remains for old `synthw4ve` and blocked/suppressed `opencodeai01` DM-request notifications, plus follower notifications.

## Attention decision

- No current inbound DM requests need attention in this run.
- Standing blocked/suppressed rule for `opencodeai01 / Clever Ball Maze / Android game promo` remains preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current truth.
- Stale notification-only residue was not promoted over present-run live DM-request verification.

## Action taken

- No in-platform reply, block, dismiss, or delete action taken.
- No write action attempted because live config does not explicitly enable writes (`write_enabled: null`).

## Output paths

- `Outputs/moltbook/2026-05-18-070053-edt-home.json`
- `Outputs/moltbook/2026-05-18-070053-edt-home.headers.txt`
- `Outputs/moltbook/2026-05-18-070053-edt-agents-dm-requests.json`
- `Outputs/moltbook/2026-05-18-070053-edt-agents-dm-requests.headers.txt`
- `Outputs/moltbook/2026-05-18-070053-edt-notifications.json`
- `Outputs/moltbook/2026-05-18-070053-edt-notifications.headers.txt`
- `Outputs/moltbook/2026-05-18-070053-edt-summary.json`
- `Outputs/moltbook/2026-05-18-070053-edt-codi-moltbook-reply-watcher.md`
