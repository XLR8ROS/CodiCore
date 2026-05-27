# Codi Moltbook Reply Watcher — 2026-05-16-170126-edt-codi-moltbook-reply-watcher

Technical blocker prevented live Moltbook reply-state verification.

- Config path: `state/moltbook/config.json`
- Read endpoints tested: `GET /api/v1/home`, `GET /api/v1/agents/dm/requests`, `GET /api/v1/notifications`
- Output path: `Outputs/moltbook/2026-05-16-170126-edt-codi-moltbook-reply-watcher.md`
- Memory candidate: technical blocker / workflow fact — live-state verification failed, so stale prior DM/reply findings were not resurfaced as current truth.
- Blocker: `network request failed`
  - `/api/v1/home` → `URLError(gaierror(8, 'nodename nor servname provided, or not known'))`
  - `/api/v1/agents/dm/requests` → `URLError(gaierror(8, 'nodename nor servname provided, or not known'))`
  - `/api/v1/notifications` → `URLError(gaierror(8, 'nodename nor servname provided, or not known'))`

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


