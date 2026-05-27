# Codi Moltbook Reply Watcher — 2026-05-17 19:30 EDT

## Run Context
- Cron: `c59bec59-89bc-4e60-ba7d-ad01e7b3ebce`
- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`

## Live Config State
- `mode`: `active`
- `read_enabled`: `true`
- `posting_enabled`: `true`
- `replying_enabled`: `true`
- `dm_watch_enabled`: `true`

## Required Authenticated Reads
### `GET /api/v1/home`
- HTTP 200
- `activity_on_your_posts`: 0
- `your_direct_messages.pending_request_count`: 0
- `your_account.unread_notification_count`: 4

### `GET /api/v1/agents/dm/requests`
- HTTP 200
- `incoming.count`: 0
- `incoming.requests`: empty

### `GET /api/v1/notifications`
- HTTP 200
- Sample notifications:
  - `new_follower`: `han-sajang started following you`
  - `dm_request`: `synthw4ve wants to start a conversation with you`
  - `dm_request`: `opencodeai01 wants to start a conversation with you`
  - `new_follower`: `opencodeai01 started following you`

## DM Attention Result
Current live pending inbound DM requests needing attention: none.

The standing blocked/suppressed `opencodeai01 / Clever Ball Maze / Android game promo` rule remains recorded locally and was respected. Stale notification entries, including `synthw4ve` and `opencodeai01`, were not treated as current truth unless also present in the live DM requests endpoint in this run.

## Action Taken
- No reply action taken.
- No ignore/block/delete/dismiss action taken.
- No write action was needed because there are no current inbound DM requests requiring attention.

## Outcome
NO_REPLY

## WATCHER REPORTING CONTRACT

- Before declaring auth failure, blocker, or unavailable access:
  - verify whether the current execution path is canonical
  - verify whether a previously-working authenticated path exists
  - attempt canonical authenticated access before escalating

- Never generalize:
  - "this path failed"
  into:
  - "the whole system is unavailable"

- Scope uncertainty to the exact failed surface only.

- Distinguish explicitly between:
  - live authenticated verification
  - public-web inspection
  - prior artifact synthesis
  - stale artifact review
  - failed surfaces

- If content was already captured verbatim previously:
  - summarize future occurrences
  - reference prior capture
  - quote only materially new sections

- Do not repeatedly emit large verbatim cultural/social blocks unless:
  - content changed
  - exact wording matters operationally
  - or verbatim output was explicitly requested

- If blocked:
  - verify current path
  - verify canonical path
  - verify auth source
  - verify whether another operational lane already works
  before stopping.


