# Nightly XOS Maintenance — 2026-06-04 03:20 EDT

## Health
- OpenClaw version: 2026.6.1 (2e08f0f).
- Gateway: running via LaunchAgent `ai.openclaw.gateway`, pid 44186, bound to 127.0.0.1:18789. `openclaw gateway status --json` reports loaded/running, config audit ok, CLI and gateway versions both 2026.6.1.
- RPC probe: ok through gateway status RPC over `ws://127.0.0.1:18789`; role `operator`, admin-capable scopes present. HTTP `/health` returned `{"ok":true,"status":"live"}`.
- HTTP `/rpc/health`: degraded route check. It returned HTTP 200 but served the Control UI HTML, not a JSON RPC health body.
- Qdrant LaunchAgent/service (`ai.xos.qdrant`): failed/not found in `launchctl` user GUI domain `gui/501`.
- Qdrant readiness on 127.0.0.1:6333: failed; `/readyz` connection refused.
- Critical comms/core ops path: OpenClaw control path is operational enough for gateway, RPC, and cron inspection. Cron source of truth is reachable, but current cron state is degraded by recent rate-limit failures on multiple jobs: `Codi operational queue check`, `CodiCore daily stale-file staging`, `Codi Moltbook Reading Pulse`, `CodiCore weekly office archive transfer`, and `Codi Moltbook Editorial Initiation`. The current nightly maintenance job is marked running.
- Overall health: degraded. Gateway/RPC are healthy; semantic vector path is down because expected Qdrant service/readiness is unavailable; several cron jobs retain rate-limit error state.

## Memory
- `memory/2026-04-13.md`: not present.
- Latest operational state reviewed: `memory/2026-06-04.md`, latest maintenance log, and live cron/gateway checks.
- Decisions:
  - Reg paused all cron jobs, required hourly spacing, then capped intended resumed cadence at no more than 21 starts in any 24-hour window.
  - Reg later authorized resuming the intended cron schedule starting at 04:00 America/New_York; 12 intended jobs were enabled and the superseded legacy Social Review job stayed disabled.
  - Reg corrected durable-memory promotion doctrine: events are promoted because they happened; canonical versus noncanonical source class is metadata, not an inclusion filter.
- Durable preferences / operating constraints:
  - Direct questions, interruptions, and frustration stop task momentum; answer the live question first.
  - Pre-compaction flushes should be narrow and append-only to the canonical daily note unless a direct question requires visible explanation.
  - Future promotion runs must preserve source metadata, label noncanonical material, deduplicate by event identity/content, and avoid excluding event-bearing sources solely because of filename/source class.
- Canon candidates:
  - Memory source classification rule above is a strong canon/procedure candidate but should remain as user-direction/proposed workflow until promoted through the appropriate governance/process lane.
  - Cron schedule budget of no more than 21 Codi starts per 24-hour window is current operating direction.
- Task outcomes:
  - Existing durable memories were verified embedded in QMD earlier on 2026-06-04: QMD reported 3,324 indexed files and 4,886 vectors at this run's check, using its local embedding model.
  - Scheduled and manual durable-memory promotion completed earlier, but the corrected noncanonical-source rule exposed outstanding historical backfill work.
  - Active noncanonical memory audit: 11 active suffix/noncanonical memory files found, 2 already backfilled, 9 older active suffix files still need backfill/review.
  - Repo commit workflow ran earlier and committed/cleaned approved repo changes per its scoped cron.
- Bulletin-worthy items:
  - Critical blocker: expected Qdrant service `ai.xos.qdrant` is absent and Qdrant is not reachable on 127.0.0.1:6333.
  - Operational blocker: several resumed cron jobs still show rate-limit error history and need observation on their next scheduled runs.
  - Memory integrity item: historical noncanonical/suffix memory files still need source-level backfill receipts or duplicate/empty proof.

## Semantic
- Required semantic target: OpenAI embeddings with default model `text-embedding-3-small`; Qdrant collection `xos_semantic_memory`, vector size 1536, cosine distance.
- Embedding/provider path status: unavailable for this run.
- Evidence:
  - `OPENAI_API_KEY` is unset in this shell.
  - `QDRANT_URL` is unset.
  - Gateway service environment exposes only a disabled OpenAI key name, not an active embedding credential path.
  - Python modules `openai`, `requests`, and `qdrant_client` are not installed in the checked Python environment.
  - Qdrant readiness on 127.0.0.1:6333 failed with connection refused.
- Action taken: stopped cleanly for semantic section as required. No `xos_semantic_memory` collection creation, OpenAI embedding call, upsert, or retrieval smoke test was attempted because the validated provider path and Qdrant readiness prerequisites are unavailable.
- Separation rule observed: no raw event traces were promoted into semantic memory during this run.

## Next Step
Exact next step: restore or install the Qdrant LaunchAgent/service `ai.xos.qdrant` so 127.0.0.1:6333 passes readiness, then provide an active OpenAI embedding credential path for `text-embedding-3-small` and rerun the semantic smoke test against Qdrant collection `xos_semantic_memory`.
