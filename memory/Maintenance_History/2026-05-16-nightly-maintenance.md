# Nightly XOS Maintenance — 2026-05-16 02:17 EDT

## Health
- OpenClaw version: `2026.5.12` (`f066dd2`) — verified via `openclaw --version`.
- Gateway: running. `openclaw status` reports local gateway reachable at `ws://127.0.0.1:18789`, LaunchAgent installed/loaded/running with active pid `18339`.
- RPC probe: degraded. No separate RPC endpoint was exposed in available CLI status output; local gateway reachability in `openclaw status` succeeded at `146ms`, so control path is up but a dedicated RPC probe result was not available from the checked interface.
- Qdrant LaunchAgent/service `ai.xos.qdrant`: failed check. `launchctl print gui/$(id -u)/ai.xos.qdrant` and fallback `launchctl print system/ai.xos.qdrant` both reported service not found.
- Qdrant readiness on `127.0.0.1:6333`: failed. `curl -sfS http://127.0.0.1:6333/readyz` could not connect.
- Critical comms/core ops path: partially healthy. `openclaw status` showed Telegram channel `ON` and `OK`, one configured account healthy. Core gateway path is healthy; local semantic/Qdrant path is down.

## Memory
- `memory/2026-04-13.md`: not present. No review possible for that date-specific file.
- Latest operational state reviewed from `memory/2026-05-16.md` and `memory/2026-05-16-0046.md`.
- Decisions and durable preferences extracted:
  - Do not casually rewrite protected `USER.md`; stable operator truths belong in evidence/memory first, then promotion if warranted.
  - Reg’s operational preference model is stricter than “minimal/direct”: exact scope obedience, no silent redesign, no capability downgrades from action to read-only, preserve original state before structural edits, avoid false uncertainty when files/docs can answer, answer direct questions first, and log meaningful events with causal whys.
  - Old cleared DM/reply requests should stay suppressed; genuinely new DMs should still be surfaced.
- Task outcomes extracted:
  - Preservation sweep before repo compression captured root-lane fragmentation, split-note sprawl, output residue, tooling overlap, and legacy cleanup exposure as current structural risks.
  - Moltbook reply watcher at `2026-05-16 02:00 EDT` found no public post replies but two pending inbound DM requests (`synthw4ve`, `opencodeai01`); no write action occurred because live config remains draft/posting-disabled/replying-disabled.
- Canon/bulletin-worthy items:
  - Reg’s stricter “missing spine” operator rule set above is bulletin-worthy because it materially changes how Codi should execute and report.
  - Repo/cron hygiene reminder remains active: Codi-owned scheduled work belongs in OpenClaw Gateway cron, not host cron.

## Semantic
- Embedding provider path: unavailable in current job environment.
- Evidence:
  - `OPENAI_API_KEY=unset`
  - `OPENAI_BASE_URL=unset`
  - `OPENAI_API_BASE=unset`
  - `QDRANT_URL=unset`
  - `QDRANT_API_KEY=unset`
  - direct embedding attempt exited cleanly with `NO_OPENAI_API_KEY`
- Result: semantic promotion/upsert/retrieval was not attempted beyond provider-path validation.
- Additional blocker: local Qdrant service is not installed/visible as `ai.xos.qdrant` and `127.0.0.1:6333` is not accepting connections, so even with embeddings credentials the local vector path is currently down.

## Next Step
Exact next step: provide or restore embedding credentials in the cron environment and bring up the local Qdrant service (`ai.xos.qdrant` on `127.0.0.1:6333`), then rerun the semantic section to create/use collection `xos_semantic_memory`, upsert a small validated test set, and perform a retrieval smoke test.
