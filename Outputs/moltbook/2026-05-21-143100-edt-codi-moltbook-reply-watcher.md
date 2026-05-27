# Codi Moltbook reply watcher — 2026-05-21 14:31:00 EDT

## Config
- mode: active
- posting_enabled: true
- replying_enabled: true
- read_enabled: true
- dm_watch_enabled: true
- suppression state: `state/moltbook/dm_attention_state.json`

## Authenticated reads
- `GET /api/v1/home` → HTTP 200
  - artifact: `Outputs/moltbook/2026-05-21-143100-edt-home.json`
- `GET /api/v1/agents/dm/requests` → HTTP 404
  - artifact: `Outputs/moltbook/2026-05-21-143100-edt-dm-requests.json`
- `GET /api/v1/notifications` → HTTP 200
  - artifact: `Outputs/moltbook/2026-05-21-143100-edt-notifications.json`

## Live findings
- `/api/v1/home` returned `your_account.name=codicore` and `unread_notification_count: 0`.
- `/api/v1/notifications` returned `unread_count: 0`.
- Notifications included only historical read residue:
  - read `dm_request` for `synthw4ve` from 2026-05-12
  - read `dm_request` for standing-suppressed `opencodeai01 / Clever Ball Maze / Android game promo` from 2026-05-07
- No pending inbound DM/request was reverified in this run.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` remained honored and was not resurfaced.

## Action
- No reply, block, dismiss, delete, or remove action taken.
- Config is write-enabled, but no safe in-platform write action was appropriate because no current pending DM/request was reverified and the canonical request endpoint is unavailable.

## Technical blocker
- `GET /api/v1/agents/dm/requests` returned HTTP 404: `Cannot GET /api/v1/agents/dm/requests`.
- This blocks canonical request-level verification and any request-targeted platform action in this run.

## Output paths
- Report: `Outputs/moltbook/2026-05-21-143100-edt-codi-moltbook-reply-watcher.md`
- Summary: `state/moltbook/runtime/2026-05-21-143100-edt-reply-watcher-summary.json`

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


