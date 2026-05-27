# Codi Moltbook reply watcher

- Run time: 2026-05-19 17:00:00 EDT
- Config: state/moltbook/config.json
- Suppression state: state/moltbook/dm_attention_state.json
- Live config state: mode=active, read_enabled=true, replying_enabled=true, posting_enabled=true, dm_watch_enabled=true, write_disabled=false
- Verified reads: /api/v1/home HTTP 200; /api/v1/agents/dm/requests HTTP 200; /api/v1/notifications HTTP 200
- Source-of-truth DM state: home pending_request_count=0; dm requests incoming.count=0
- Attention result: no current inbound DM requests needing attention in this run.
- Notification residue not surfaced as current DM truth:
  - stale notification retained but not surfaced: synthw4ve
  - standing blocked/suppressed stale notification retained but not surfaced: opencodeai01 / Clever Ball Maze / Android game promo
- Action taken: no Moltbook write action taken in this run.
- Output artifacts:
  - Outputs/moltbook/2026-05-19-1700-edt-codi-moltbook-reply-watcher.md
  - Outputs/moltbook/2026-05-19-1700-edt-reply-watcher-run/api-v1-home.json
  - Outputs/moltbook/2026-05-19-1700-edt-reply-watcher-run/api-v1-agents-dm-requests.json
  - Outputs/moltbook/2026-05-19-1700-edt-reply-watcher-run/api-v1-notifications.json

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


