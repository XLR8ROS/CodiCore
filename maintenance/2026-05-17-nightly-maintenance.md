# Nightly XOS Maintenance — 2026-05-17 02:17 EDT

## Health
- OpenClaw version: `2026.5.12` (`f066dd2`) — verified via `openclaw --version`.
- Gateway: running. `openclaw status` reports local gateway reachable at `ws://127.0.0.1:18789`, LaunchAgent installed/loaded/running with active pid `95395`.
- RPC probe: healthy. Gateway HTTP probes returned `200 OK` for both `http://127.0.0.1:18789/healthz` and `http://127.0.0.1:18789/readyz`; readiness payload reported `ready:true` and `eventLoop.degraded:false`.
- Qdrant LaunchAgent/service `ai.xos.qdrant`: failed check. `launchctl print gui/$(id -u)/ai.xos.qdrant` and fallback `launchctl print system/ai.xos.qdrant` both reported service not found.
- Qdrant readiness on `127.0.0.1:6333`: failed. `curl http://127.0.0.1:6333/readyz` and `/` both failed with connection refused.
- Critical comms/core ops path: healthy with one degradation outside comms. `openclaw status` showed Telegram channel `ON` and `OK`, gateway reachable, and current cron/session state present. Semantic vector path remains degraded because local Qdrant is down.
- Additional operational note: `openclaw status` currently reports `Heartbeat 30m (main), disabled (codi)`. This is notable state, not a failure for this maintenance run by itself.

## Memory
- `memory/2026-04-13.md`: not present. No date-specific review was possible for that file.
- Latest operational state reviewed from `memory/2026-05-17.md`, `memory/2026-05-16.md`, and prior nightly maintenance output `maintenance/2026-05-16-nightly-maintenance.md`.
- Decisions:
  - Stale Moltbook findings must not be resurfaced as current truth unless reverified in the current live run.
  - Watcher/review/report outputs should prefer the latest successful same-day live revalidation over immediately prior failed runs.
  - Even with write-enabled Moltbook config, DM action must remain tied to fresh live reads plus explicit Reg instruction state.
- Durable preferences:
  - Reg prefers exact evidence, explicit scope obedience, no silent redesign, no capability downgrades from actionable work to read-only behavior, preserved original state before structural edits, and direct answers first.
  - Durable logs and evidence lanes should be favored over clever summaries.
- Canon candidates:
  - Operator rule set around exact scope obedience, evidence-first reporting, and avoiding silent redesign remains bulletin-worthy because it materially shapes Codi execution discipline.
  - Moltbook workflow discipline around stale-finding suppression and live-state revalidation remains strong candidate operational doctrine.
- Task outcomes:
  - 2026-05-17 Moltbook runs showed a changing live attention state: `synthw4ve` was surfaced in earlier successful runs, a `/api/v1/home` HTTP 500 occurred at 01:31 EDT without blocking DM request verification, and the 02:01:42 EDT watcher reverified that no unsuppressed pending inbound DM requests remained current.
  - 2026-05-17 curiosity pulse successfully posted a public comment on a thread about agent honesty becoming a performance metric; the chosen XOS framing emphasized evidence, uncertainty, and verification over performative trust signals.
- Bulletin-worthy items:
  - Local semantic infrastructure is currently degraded: `ai.xos.qdrant` not found and `127.0.0.1:6333` unavailable.
  - Cron/runtime state shows Codi heartbeat disabled in `openclaw status`, which should be treated as current configuration state to review separately if heartbeat coverage is expected.

## Semantic
- Embedding provider path: available enough to validate embeddings.
- Evidence:
  - `OPENAI_API_KEY` was not exposed directly in `env`, but the managed environment declared `OPENCLAW_SERVICE_MANAGED_ENV_KEYS=DISABLED_OPENAI_API_KEY`, and a direct embedding probe succeeded.
  - Direct OpenAI embedding test with default model `text-embedding-3-small` succeeded and returned vector size `1536`.
- Validated semantic test set prepared:
  - validated fact: gateway health succeeded during this maintenance run.
  - validated fact: local Qdrant service was absent/unreachable during this maintenance run.
- Qdrant collection/upsert/retrieval result: blocked cleanly.
  - Attempted to create/use collection `xos_semantic_memory` with vector size `1536` and cosine distance after successful embedding generation.
  - Collection creation failed with `Connection refused` against `http://127.0.0.1:6333`, so no upsert or retrieval smoke test could complete.
- Result: semantic section stopped cleanly after validating embeddings and confirming Qdrant unavailability. Promoted semantic memory remains separate from raw event traces because no raw event trace upsert was attempted.

## Next Step
Exact next step: restore or install the local Qdrant service `ai.xos.qdrant` so `127.0.0.1:6333` becomes reachable, then rerun the semantic section to create collection `xos_semantic_memory`, upsert the validated test set, and perform the retrieval smoke test.