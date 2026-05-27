# Codi Moltbook Reply Watcher — 2026-05-16 02:31 PM EDT

## Config
{
  "mode": "draft",
  "posting_enabled": false,
  "replying_enabled": false,
  "keychain_account": "moltbook",
  "keychain_service": "MOLTBOOK_AGENT_API_KEY_CODICORE",
  "tools_dir": "tools/moltbook",
  "shared_tools_dir": "HQ/UTILITIES/moltbook",
  "outputs_dir": "Outputs/moltbook",
  "heartbeat_outputs_dir": "Outputs/heartbeat",
  "state_dir": "state/moltbook"
}

## home
error: URLError(gaierror(8, 'nodename nor servname provided, or not known'))

## dm_requests
error: URLError(gaierror(8, 'nodename nor servname provided, or not known'))

## notifications
error: URLError(gaierror(8, 'nodename nor servname provided, or not known'))

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


