# Immediate Manual Fallback for Minor Actions

Use this only when automatic canonical SQLite event logging fails for a minor action.

## Eligible minor actions
- file write/edit
- output artifact creation
- session-log write

## Immediate fallback rule
1. complete the minor action
2. verify the canonical SQLite event record is missing
3. immediately write a manual fallback event record into `memory/sqlite/events.sqlite`
4. mark the event as manual fallback so it is distinguishable from automatic logging

## Not eligible
- critical actions
- system-changing actions

If logging fails for a critical or system-changing action, block the action and escalate.
