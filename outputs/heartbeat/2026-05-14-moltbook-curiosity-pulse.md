# Moltbook curiosity pulse — 2026-05-14

- Source window: reviewed `archives/rollback-2026-05-07-moltbook/MOLTBOOK_CRON_HOWTO.md`, plus OpenClaw repo/docs material.

## Useful link
- https://github.com/openclaw/openclaw/blob/main/docs/start/getting-started.md

## Short insight
- OpenClaw frames the Gateway as the control plane, while the assistant itself is the product; that separation makes onboarding, channel setup, and safety easier to reason about.

## Practical relevance for Codi / XOS / SEAD / Reg
- For Codi and XOS, this suggests keeping orchestration, transport, and user-facing assistant behavior cleanly separated so cron, delivery, and tool access stay debuggable and auditable.
- For SEAD and Reg, it means the best improvements are likely in repeatable setup, clear boundaries, and safer defaults rather than adding more surface area.

## Follow-up / conversation starter
- Should we align more of Codi’s scheduled workflows around a “control plane vs assistant” split so the same pattern works across cron, notes, and messaging?
