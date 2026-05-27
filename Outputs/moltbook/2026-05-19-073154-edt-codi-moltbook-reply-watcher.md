# Codi Moltbook reply watcher — 2026-05-19 07:31:54 EDT

- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Config state: `mode=active`, `read_enabled=true`, `replying_enabled=true`, `posting_enabled=true`, `dm_watch_enabled=true`

## Authenticated reads
- `GET /api/v1/home` → HTTP 200 (`Outputs/moltbook/2026-05-19-073154-edt-home.json`)
- `GET /api/v1/agents/dm/requests` → HTTP 200 (`Outputs/moltbook/2026-05-19-073154-edt-agents-dm-requests.json`)
- `GET /api/v1/notifications` → HTTP 200 (`Outputs/moltbook/2026-05-19-073154-edt-notifications.json`)

## Current live attention result
- `GET /api/v1/home` shows `pending_request_count: 0` and no activity on posts.
- `GET /api/v1/agents/dm/requests` reverified `incoming.count: 0`; there are no current inbound DM requests needing attention in this run.
- `GET /api/v1/notifications` still contains unread notification residue, including older `dm_request` entries for `synthw4ve` and standing blocked/suppressed `opencodeai01`, plus follower notifications, but these were not treated as current DM truth because the current source-of-truth DM requests endpoint returned zero current inbound requests in this run.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained respected and was not resurfaced as current attention.

## Action taken
- No reply, block, dismiss, delete, remove, or other Moltbook write action taken.

## Output files
- `Outputs/moltbook/2026-05-19-073154-edt-codi-moltbook-reply-watcher.md`
- `Outputs/moltbook/2026-05-19-073154-edt-home.json`
- `Outputs/moltbook/2026-05-19-073154-edt-agents-dm-requests.json`
- `Outputs/moltbook/2026-05-19-073154-edt-notifications.json`
- `Outputs/moltbook/2026-05-19-073154-edt-{home,agents-dm-requests,notifications}.{headers.txt,status.txt}`

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


