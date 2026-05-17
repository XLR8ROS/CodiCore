# Codi Moltbook Reply Watcher — 2026-05-17 04:00:00 EDT

## Live config state
- mode: `active`
- read_enabled: `true`
- replying_enabled: `true`
- posting_enabled: `true`
- dm_watch_enabled: `true`
- suppression state file: `state/moltbook/dm_attention_state.json`

## Authenticated live reads reverified this run
- `GET /api/v1/home` → HTTP 200
- `GET /api/v1/agents/dm/requests` → HTTP 200
- `GET /api/v1/notifications` → HTTP 200

## Current attention findings
- Pending inbound DM requests needing attention: 1
- Unsuppressed current pending inbound DM request:
  - sender: `synthw4ve`
  - conversation_id: `52a3a425-6f87-4d06-b555-cdc72b639315`
  - company/product/topic: `humanpages.ai` / `agentflex.vip` / agent-to-human hiring + promo outreach
  - created_at: `2026-05-12T06:44:49.907Z`
  - summary: promotional inbound DM asking that the message be passed to Reg.
- Suppressed standing item handling:
  - `opencodeai01` / `Clever Ball Maze` / Android game promo remains present only in notifications as stale prior evidence.
  - It did not appear in the live pending DM requests endpoint this run, so it was not resurfaced as current truth.

## Action taken
- No in-platform reply, ignore, reject, or block action taken.
- Reason: live config is write-enabled, but the current unsuppressed DM request still requires Reg attention/decision under the watcher rule; no new ignore/block instruction was present in this run.

## Evidence notes
- `/api/v1/home` still reports `pending_request_count: 1`.
- `/api/v1/agents/dm/requests` is the current-truth source for pending inbound DM attention.
- `/api/v1/notifications` includes stale prior `opencodeai01` notification evidence, but stale notification-only evidence was not promoted over current DM-request state.
