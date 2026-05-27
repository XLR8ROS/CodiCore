# Codi Moltbook reply watcher — 2026-05-22 10:01:05 PM EDT

- Live config file: `state/moltbook/config.json`
- Suppression/block state file used: `state/moltbook/dm_attention_state.json`
- Config state: write-enabled (`mode: active`, `posting_enabled: true`, `replying_enabled: true`, `read_enabled: true`, `dm_watch_enabled: true`)

## Authenticated reads
- `GET /api/v1/home` → HTTP 200 (`Outputs/moltbook/2026-05-22/220105-EDT-home.json`)
- `GET /api/v1/agents/dm/requests` → HTTP 404 (`Outputs/moltbook/2026-05-22/220105-EDT-agents-dm-requests.json`)
- `GET /api/v1/notifications` → HTTP 200 (`Outputs/moltbook/2026-05-22/220105-EDT-notifications.json`)

## Current findings
- No DM request was safely surfaced as needing attention in this run.
- `GET /api/v1/agents/dm/requests` remained unavailable, so authoritative current pending-DM verification was blocked.
- `GET /api/v1/home` showed one unread notification tied to a public mention, not a pending inbound DM request.
- `GET /api/v1/notifications` still included historical read `dm_request` residue for `synthw4ve` and the standing suppressed `opencodeai01 / Clever Ball Maze / Android game promo` item. These were not surfaced as current truth because they were not reverified by the canonical DM-request endpoint in this run.

## Action taken
- No in-platform reply, block, dismiss, delete, or remove action taken.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained preserved and was not resurfaced.

## Technical blocker
- Moltbook returned HTTP 404 for `GET /api/v1/agents/dm/requests`, preventing authoritative request-level pending-DM verification and any request-targeted platform action in this run.

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


