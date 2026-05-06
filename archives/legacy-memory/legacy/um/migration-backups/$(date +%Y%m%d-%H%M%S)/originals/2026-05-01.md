# Maintenance Summary, 2026-05-01

## Health
- OpenClaw version: 2026.4.29 (a448042); `openclaw status` reports up to date.
- Gateway: LaunchAgent loaded and running (pid 31317); `openclaw gateway status` connectivity probe OK on `ws://127.0.0.1:18789`.
- RPC/core control path: `openclaw status` reachable and healthy; gateway websocket calls were succeeding during this run.
- Qdrant LaunchAgent `ai.xos.qdrant`: loaded and running (pid 885).
- Qdrant readiness on `127.0.0.1:6333`: passed (`readyz` returned `all shards are ready`).
- Qdrant collections probe: `xos_semantic_memory` already exists.
- Degraded critical comms/core ops signals from current log tail:
  - Manifest embedded server is reusing dashboard `http://127.0.0.1:2099`, but no provider is connected yet, so Manifest routing is not active.
  - Telegram `getMe` probe hit a fetch timeout during startup.
  - Bundled MCP startups logged `github` 401 and `workspace-developer` 400 warnings.

## Memory
- `memory/2026-04-13.md` is not present.
- Reviewed latest operational state from:
  - `daily-notes/2026-05-01.md`
  - `daily-notes/2026-04-30.md`
  - `daily-notes/2026-04-30.md`
  - `MEMORY.md`
  - prior maintenance artifact `maintenance/2026-04-22.md`
- Validated decisions / durable items surfaced:
  - Durable preference: when Reg asks Codi to do something, Codi should explicitly confirm the request was heard.
  - Decision: Manifest 6 work is an architecture migration, not plugin cleanup; do not run `openclaw plugins update manifest` for it.
  - Decision: keep OpenClaw stable, preserve the snapshot, keep default model on `openai-codex/gpt-5.4`, and do not move to Docker/Postgres until the migration plan is reviewed.
  - Durable operating rule remains in force: nightly maintenance must leave an auditable memory decision note.
- Task outcomes from this run:
  - Health verification passed for OpenClaw gateway, local control path, and Qdrant.
  - Manual-cron artifact gap from 2026-04-30 is resolved for this run because a fresh maintenance file was written under `maintenance/`.
- Bulletin-worthy / degraded items:
  - Manifest routing remains unavailable until a provider is connected.
  - Startup log shows Telegram timeout and bundled MCP auth/startup warnings.
- Memory decision for audit:
  - No durable promotions tonight: FALSE.
  - Candidate promotions validated by source and suitable for later promotion: the explicit-confirmation communication rule, the Manifest-6 migration rule set, and the resolved note that maintenance artifact writing succeeded on this run.

## Semantic
- Embedding provider path was available via OpenAI; model used: `text-embedding-3-small`.
- Confirmed Qdrant collection `xos_semantic_memory` with vector size 1536 and cosine distance.
- Embedded a small validated 3-item test set, upserted all 3 points successfully, and ran a retrieval smoke test.
- Retrieval smoke test passed; top hit matched the auditable-memory-decision rule (score `0.7736943`).
- Promoted semantic test material was kept to validated operational facts/rules only; no raw event traces were embedded.

## Next Step
- Exact next step: connect a provider to Manifest if Manifest routing is expected to be usable, then re-check whether the Telegram timeout and bundled MCP 401/400 startup warnings persist on the next maintenance pass.