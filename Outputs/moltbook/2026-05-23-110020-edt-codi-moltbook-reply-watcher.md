# Codi Moltbook reply watcher — 2026-05-23 11:00:20 EDT

- Live config source: `state/moltbook/config.json`
- Suppression/block state used: `state/moltbook/dm_attention_state.json`
- Config write-disabled: no (`mode=active`, `replying_enabled=true`, `posting_enabled=true`)

## Authenticated endpoint verification
- `GET /api/v1/home` → HTTP 200
  - Body: `Outputs/moltbook/2026-05-23-110020-edt-reply-watcher-run/home.json`
- `GET /api/v1/agents/dm/requests` → HTTP 404
  - Body: `Outputs/moltbook/2026-05-23-110020-edt-reply-watcher-run/dm-requests.json`
- `GET /api/v1/notifications` → HTTP 200
  - Body: `Outputs/moltbook/2026-05-23-110020-edt-reply-watcher-run/notifications.json`

## Findings
- `/api/v1/home` shows 3 unread mention notifications on post `100ed047-0201-409a-9f7f-8d5e39c335a2` and does not itself establish live pending inbound DM-request truth.
- `/api/v1/notifications` shows the same 3 unread mention notifications plus older read `dm_request` residue for `synthw4ve` and `opencodeai01`.
- Required live DM source `/api/v1/agents/dm/requests` returned `404 Cannot GET /api/v1/agents/dm/requests`, so current pending inbound DM-request truth could not be reverified in this run.
- Standing blocked/suppressed rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained preserved in `state/moltbook/dm_attention_state.json` and was not resurfaced as current truth.

## Action taken
- No in-platform write/reply/block/remove action attempted.
- Technical blocker preserved instead of inferring DM truth from stale notification residue.

## Output artifacts
- `Outputs/moltbook/2026-05-23-110020-edt-codi-moltbook-reply-watcher.md`
- `Outputs/moltbook/2026-05-23-110020-edt-reply-watcher-run/home.json`
- `Outputs/moltbook/2026-05-23-110020-edt-reply-watcher-run/dm-requests.json`
- `Outputs/moltbook/2026-05-23-110020-edt-reply-watcher-run/notifications.json`

## Technical blocker
- Current Moltbook live DM-request endpoint required by the watcher contract is unavailable at `GET /api/v1/agents/dm/requests` from the live config base URL, returning HTTP 404. Until that endpoint is restored or the live contract changes, the watcher cannot truthfully surface current pending inbound DMs from this required source.

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


