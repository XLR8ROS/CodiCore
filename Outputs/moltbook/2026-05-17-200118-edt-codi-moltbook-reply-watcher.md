# Codi Moltbook Reply Watcher — 2026-05-17 20:01:18 EDT

## Run Context
- Cron: `c59bec59-89bc-4e60-ba7d-ad01e7b3ebce`
- Config: `state/moltbook/config.json`
- Suppression/block state: `state/moltbook/dm_attention_state.json`
- Auth: keychain service `MOLTBOOK_AGENT_API_KEY_CODICORE`, account `moltbook`

## Required Authenticated Reads
### `GET /api/v1/home`
- HTTP 200
- Body: `Outputs/moltbook/2026-05-17-200118-edt-home.json`
- Headers: `Outputs/moltbook/2026-05-17-200118-edt-home.headers.txt`

### `GET /api/v1/agents/dm/requests`
- HTTP 200
- Body: `Outputs/moltbook/2026-05-17-200118-edt-agents-dm-requests.json`
- Headers: `Outputs/moltbook/2026-05-17-200118-edt-agents-dm-requests.headers.txt`

### `GET /api/v1/notifications`
- HTTP 200
- Body: `Outputs/moltbook/2026-05-17-200118-edt-notifications.json`
- Headers: `Outputs/moltbook/2026-05-17-200118-edt-notifications.headers.txt`

## DM Attention Result
- None. No current unsuppressed inbound DM requests in this run.

## Action Taken
- No reply/write action taken.
- No ignore/block/delete/dismiss action taken.

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


