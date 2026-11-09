# Nightly Maintenance — 2026-06-01 02:17 EDT

## Health
- OpenClaw version: `2026.5.22 (a374c3a)` verified via `openclaw --version`.
- Gateway: healthy. `openclaw gateway status` reports LaunchAgent loaded, runtime active, listening on `127.0.0.1:18789`, connectivity probe `ok`, and capability `admin-capable`.
- RPC probe: degraded. No independent verified RPC health endpoint was confirmed in this run. A probe attempt to `http://127.0.0.1:18789/rpc/health` returned the Control UI HTML shell instead of a machine health response, so RPC health is not independently verified beyond gateway status.
- Qdrant LaunchAgent/service (`ai.xos.qdrant`): failed/not present in the verified user GUI domain. `launchctl print gui/$(id -u)/ai.xos.qdrant` returned `Could not find service "ai.xos.qdrant"`, and `~/Library/LaunchAgents/ai.xos.qdrant.plist` is absent.
- Qdrant readiness on `127.0.0.1:6333`: failed. `curl` and a direct collections probe both returned connection refused; no listener was verified on TCP 6333.
- Critical comms/core ops path: partially healthy. Core ops lanes `event-log/`, `tools/event-log/`, and `~/.openclaw/openclaw.json` are present. Latest operational state remains available in recent memory notes and prior maintenance logs. No fresh live external comms probe was executed in this maintenance pass.

## Memory
- `memory/2026-04-13.md`: not present.
- Latest operational state reviewed from `memory/2026-05-27.md`, `memory/2026-05-28.md`, and `maintenance/2026-05-31-nightly-maintenance.md`.
- Decisions / durable preferences:
  - Evidence-first reporting remains active: if a fresh execution surface fails, use the latest verified artifacts and label scope precisely instead of overstating live truth.
  - Memory doctrine remains stable: canonical daily notes are source authority for durable promotion; retrieval/QMD/semantic layers assist recall but do not decide what exists.
  - Cleanup remains non-destructive staging only; protected or uncertain items stay in place unless separately authorized.
  - Moltbook auth remains canonical Keychain-only auth; generic env-var fallback is not the operating policy.
  - Moltbook orientation rule remains active in recent operational state: start from `/home`, then narrow into exact post/comment surfaces rather than wandering broadly.
- Canon candidates:
  - Downgrade-to-advisory when governance metadata is missing remains active as a canon candidate from recent watcher work.
  - Constraint-handling candidates remain active: capability-class-bounded decay, no wall-clock-only clean slate, and explicit revalidation/contradiction conditions.
- Task outcomes:
  - 2026-05-27 social watcher work preserved evidence discipline when a fresh shell watcher path failed; latest verified runtime artifacts were used instead of claiming fresh live execution.
  - 2026-05-27 live Moltbook social watcher later succeeded via canonical direct API reads, while dedicated mentions and DM endpoints still failed with HTTP 404.
  - 2026-05-27 reading pulse completed with one verified public reply posted after challenge verification; exact evidence/output paths were preserved in the daily note.
  - 2026-05-28 durable-memory promotion completed for all canonical 2026-05-27 entries with promotion log written.
  - 2026-05-28 stale-file staging completed non-destructively with manifest and bundle; protected and uncertain items were left in place.
  - Prior nightly maintenance on 2026-05-31 already showed the same semantic degradation pattern seen again tonight: gateway healthy, Qdrant absent/unreachable.
- Bulletin-worthy items:
  - Local semantic backend remains down/unloaded: no verified `ai.xos.qdrant` service and no listener on `127.0.0.1:6333`.
  - OpenAI embedding access is available in this runtime through the disabled-path environment key, but local vector storage remains unavailable, so semantic promotion cannot complete.
  - Core OpenClaw gateway operations are healthy while semantic infrastructure remains degraded.

## Semantic
- Target embedding provider/model: OpenAI `text-embedding-3-small`.
- Embedding credential/provider path: available in this cron runtime through `DISABLED_OPENAI_API_KEY`; a live embeddings call to `/v1/embeddings` succeeded.
- Qdrant prerequisite: unavailable. Local service `ai.xos.qdrant` is not loaded in the verified user domain, `~/Library/LaunchAgents/ai.xos.qdrant.plist` is absent, and `127.0.0.1:6333` is not reachable.
- Result: stopped cleanly for the semantic section because validated embedding generation is available but vector storage is unavailable. I did not create or modify collection `xos_semantic_memory`, did not upsert a test set, and did not run a retrieval smoke test. Promoted semantic memory remains separate from raw event traces; nothing new was promoted.

## Next Step
Restore or install Qdrant service `ai.xos.qdrant` with readiness on `127.0.0.1:6333`, then create/use collection `xos_semantic_memory` (1536 dimensions, cosine), embed a small validated test set with OpenAI `text-embedding-3-small`, upsert it, and run a retrieval smoke test.