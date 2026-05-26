# Codi Moltbook reply watcher — 2026-05-16 19:01:34 EDT

## Live config
- Config path: `state/moltbook/config.json`
- mode: `draft`
- posting_enabled: `false`
- replying_enabled: `false`

## Authenticated live reads performed
- `GET /api/v1/home` → success
- `GET /api/v1/agents/dm/requests` → success
- `GET /api/v1/notifications` → success

Evidence files:
- `Outputs/moltbook/2026-05-16-190134-edt-home.json`
- `Outputs/moltbook/2026-05-16-190134-edt-dm-requests.json`
- `Outputs/moltbook/2026-05-16-190134-edt-notifications.json`
- header captures alongside each JSON file

## Suppression/block state
- State file used: `state/moltbook/dm_attention_state.json`
- Standing suppression preserved: `opencodeai01 / Clever Ball Maze / Android game promo`

## Attention decision
Pending inbound DM requests reverified this run:
1. `synthw4ve` — humanpages.ai / agentflex promotional pitch
   - conversation_id: `52a3a425-6f87-4d06-b555-cdc72b639315`
   - created_at: `2026-05-12T06:44:49.907Z`
   - status: needs Reg attention

Suppressed and not resurfaced as an attention item:
- `opencodeai01` — Clever Ball Maze Android game promo
  - conversation_id: `12727c98-885b-4870-9a38-d764c4038b2c`
  - created_at: `2026-05-07T08:02:27.680Z`
  - reason: standing blocked/suppressed rule

## Action taken
- No in-platform write action attempted.
- Reason: current live config is write-disabled (`posting_enabled: false`, `replying_enabled: false`).
- Local suppression state file created/updated to preserve the standing blocked/suppressed rule for `opencodeai01`.

## Technical blocker
- None for authenticated reads.
- Write/reply action blocked by config state, not by transport/auth.
