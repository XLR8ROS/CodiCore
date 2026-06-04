# Nightly XOS Maintenance — 2026-06-03 02:17 EDT

## Health
- OpenClaw version: 2026.5.22 (a374c3a).
- Gateway: running via LaunchAgent, active on 127.0.0.1:18789; CLI and gateway versions match; connectivity probe ok.
- RPC probe: degraded naming/path assumption at port 4000 failed; verified live gateway health at 127.0.0.1:18789 instead. `/rpc/health` returned HTTP 200 but served dashboard HTML, while `/health` returned `{"ok":true,"status":"live"}`.
- Qdrant LaunchAgent/service (`ai.xos.qdrant`): failed/not found in `launchctl` user GUI domain.
- Qdrant readiness on 127.0.0.1:6333: failed; connection refused on both `/readyz` and `/`.
- Critical comms/core ops path: OpenClaw module path present and gateway dashboard reachable. Core OpenClaw control path appears operational; semantic vector path is currently down because Qdrant is not running.
- Overall health: degraded. OpenClaw/gateway healthy enough for agent operations; Qdrant service unavailable.

## Memory
- `memory/2026-04-13.md`: not present.
- Latest memory file found: `memory/2026-05-28-1422.md`.
- Compact extracted operational state:
  - Durable preference: when drafting outbound chat text for Reg, prefix the drafted interaction with `Codi:`.
  - Durable constraint: native ChatGPT desktop app can be opened, but its internal chat UI could not be reliably controlled from the available runtime; browser automation is not equivalent to the desktop app.
  - Repo/task outcome snapshot recorded in latest memory: CodiCore at commit `46a4ab2`, XLR8ROS-HQ at `9dd8c15`, XLR8ROS_SEAD at `f0132af`, HOW-2-HUB clean; no blockers noted in that recorded state.
  - Audio/runtime state: no audio/TTS generation or delivery tool available in that runtime; text-first remained intact.
  - Bulletin-worthy item: authenticated social/watcher review captured a direct technical mention asking for a concrete design answer about decay-rate parameterization across capability classes in the XOS three-layer model. No response was posted because the run scope was watcher/reporting only.
  - Canon candidate: degrade-to-advisory behavior when governance metadata is missing or stale appeared repeatedly in the reviewed watcher output, but it remains discussion evidence, not promoted canon.
- Maintenance interpretation: latest recorded operational state is stable on preferences and constraints, with no validated new canon promoted from raw discussion traces.

## Semantic
- Embedding provider status: unavailable in this runtime.
- Evidence:
  - `OPENAI_API_KEY` unset.
  - `QDRANT_URL` unset.
  - `QDRANT_API_KEY` unset.
  - Python modules `openai` and `requests` not installed in the checked environment.
  - Qdrant at 127.0.0.1:6333 not reachable.
- Action taken: stopped cleanly for semantic section as required. No collection creation, embedding, upsert, or retrieval smoke test was attempted because validated provider/path prerequisites were missing.

## Next Step
Exact next step: restore or verify the Qdrant service `ai.xos.qdrant` on 127.0.0.1:6333 and make the embedding provider path available (at minimum a valid OpenAI credential path for `text-embedding-3-small`), then rerun the semantic section smoke test against collection `xos_semantic_memory`.
