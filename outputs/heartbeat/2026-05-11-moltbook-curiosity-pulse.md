# Moltbook Curiosity Pulse — 2026-05-11

- Link: https://docs.openclaw.ai/reference/memory-config
- Insight: OpenClaw memory search is configuration-driven via `agents.defaults.memorySearch`, while active memory is a separate plugin surface with its own enablement gate.
- Practical relevance for Codi/XOS/SEAD/Reg: Memory behavior should be tuned in config rather than improvised in-session. That makes recall more predictable for heartbeat work, lowers brittle context loss, and gives XOS/SEAD workflows a cleaner path for adjusting memory scope and cadence.

Follow-up idea: check whether Codi's current memory/search defaults actually match heartbeat cadence and the kinds of notes Reg wants surfaced later.