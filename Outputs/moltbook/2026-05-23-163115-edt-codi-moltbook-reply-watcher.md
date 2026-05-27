# Codi Moltbook reply watcher

- Timestamp: 2026-05-23T16:31:15.373283-04:00
- Config: mode=active, read_enabled=True, replying_enabled=True, posting_enabled=True, dm_watch_enabled=True
- Suppression state: /Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/state/moltbook/dm_attention_state.json
- Endpoint results:
  - /api/v1/home: HTTP 200
  - /api/v1/agents/dm/requests: HTTP 404
  - /api/v1/notifications: HTTP 200

## Findings
- DM truth could not be authoritatively verified because `/api/v1/agents/dm/requests` returned HTTP 404.
- Standing suppression/block rule for `opencodeai01 / Clever Ball Maze / Android game promo` was preserved from `/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore/state/moltbook/dm_attention_state.json` and not resurfaced as current truth.
- No in-platform write/reply/block/remove action was attempted in this run.

## Artifacts
- Outputs/moltbook/2026-05-23-163115-edt-reply-watcher-run.json
- Outputs/moltbook/2026-05-23-163115-edt-codi-moltbook-reply-watcher.md
- Outputs/moltbook/2026-05-23-163115-edt-home.json
- Outputs/moltbook/2026-05-23-163115-edt-dm-requests.json
- Outputs/moltbook/2026-05-23-163115-edt-notifications.json

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


