# Nightly Maintenance — 2026-05-30 02:17 EDT

## Health
- OpenClaw version: `2026.5.22 (a374c3a)` verified via `openclaw --version`.
- Gateway: healthy. `openclaw gateway status` reports LaunchAgent loaded, runtime active, listening on `127.0.0.1:18789`, connectivity probe `ok`, and capability `admin-capable`.
- RPC probe: failed/degraded. Direct probes to `http://127.0.0.1:9090/rpc/health` and `http://127.0.0.1:3000/rpc/health` could not connect. No verified alternate RPC health surface was established in this run.
- Qdrant LaunchAgent/service (`ai.xos.qdrant`): failed/not present. `launchctl print gui/$(id -u)/ai.xos.qdrant` returned `Could not find service "ai.xos.qdrant"`. System-domain verification was not completed because `sudo` required an interactive password.
- Qdrant readiness on `127.0.0.1:6333`: failed. `curl` to local readiness endpoints could not connect; nothing verified listening on TCP 6333.
- Critical comms/core ops path: partially healthy. Core OpenClaw gateway path is up. Workspace and core ops lanes are present, including `tools/event-log/`, `state/moltbook/config.json`, and `state/moltbook/dm_attention_state.json`. Last verified Moltbook runtime state remains available from local state files, but no fresh live comms probe was executed in this maintenance pass.

## Memory
- `memory/2026-04-13.md`: not present.
- Latest operational state reviewed from `memory/2026-05-28.md`, `maintenance/2026-05-29-nightly-maintenance.md`, and local Moltbook state under `state/moltbook/`.
- Decisions / durable preferences:
  - Evidence-first reporting remains the active rule: when a live execution surface is unavailable, report the latest verified artifacts and label them as such.
  - Promotion doctrine remains stable: canonical daily-note events are promoted as durable memory with provenance; semantic/QMD layers support retrieval and do not become the authority writer.
  - Cleanup remains non-destructive staging only; protected or uncertain items stay in place unless separately authorized.
  - Moltbook auth remains keychain-based only (`account: moltbook`, `service: MOLTBOOK_AGENT_API_KEY_CODICORE`); generic env-var fallback is forbidden by config.
- Canon candidates:
  - Downgrade-to-advisory when governance metadata is missing remains an active canon candidate from prior watcher work.
  - Constraint-handling candidates remain active: capability-class-bounded decay, no wall-clock-only clean slate, and explicit revalidation/contradiction conditions.
- Task outcomes:
  - 2026-05-28 durable-memory promotion completed for all canonical 2026-05-27 entries with promotion log written.
  - 2026-05-28 stale-file staging completed non-destructively with manifest and bundle; protected and uncertain items were left in place.
  - Prior nightly maintenance on 2026-05-29 confirmed the same major degraded semantic state: no active OpenAI embedding credential in cron runtime and no reachable local Qdrant service.
- Bulletin-worthy items:
  - Local Qdrant semantic backend is still down/unloaded: no verified `ai.xos.qdrant` service and no listener on `127.0.0.1:6333`.
  - This cron runtime still exposes no active `OPENAI_API_KEY`; semantic embedding remains unavailable here.
  - Core OpenClaw gateway operations are healthy even while semantic infrastructure remains degraded.
  - Moltbook suppression state for the blocked `opencodeai01` / `Clever Ball Maze` promo remains recorded in local state and was last updated 2026-05-24.

## Semantic
- Target embedding provider/model: OpenAI `text-embedding-3-small`.
- Credential/provider path: unavailable in this cron runtime. Environment inspection showed `DISABLED_OPENAI_API_KEY=[set]` and no active `OPENAI_API_KEY`.
- Qdrant prerequisite: unavailable. Local service `ai.xos.qdrant` is not loaded in the verified user domain, and `127.0.0.1:6333` is not reachable.
- Result: stopped cleanly for the semantic section because the embedding credential/provider path is unavailable and Qdrant is not reachable. I did not create or modify collection `xos_semantic_memory`, did not embed or upsert a test set, and did not run retrieval smoke. Promoted semantic memory remains separate from raw event traces; nothing new was promoted.

## Next Step
Enable `OPENAI_API_KEY` for this cron/runtime path, restore or load Qdrant service `ai.xos.qdrant`, verify readiness on `127.0.0.1:6333`, then create/use collection `xos_semantic_memory` (1536 dimensions, cosine), upsert a small validated test set with `text-embedding-3-small`, and run a retrieval smoke test.