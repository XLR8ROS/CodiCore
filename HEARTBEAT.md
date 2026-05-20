# HEARTBEAT.md — CodiCore Heartbeat Contract

## 1. Purpose

This file defines what Codi checks when heartbeat runs.

Heartbeat checks responsibility health. OpenClaw Gateway cron owns scheduled jobs. Runtime/OpenClaw config controls heartbeat cadence.

Heartbeat observes system state and reports changed risk, owed action, blockers, failed responsibilities, stale outputs, and missed artifacts.

If nothing is owed and no risk changed, respond exactly:

`HEARTBEAT_OK`

## 2. Cron Source of Truth

Codi-owned scheduled work belongs in OpenClaw Gateway cron and is targeted to:

`--agent codi`

Heartbeat checks cron health from the OpenClaw Gateway cron source of truth. It does not infer cron health from QMD results, memory summaries, old reports, or stale daily-note references.

Use cron or scheduled jobs for precise schedules, isolated recurring jobs, writes, updates, syncs, archive movement, and channel-directed reports.

Use heartbeat to detect missed, blocked, duplicated, late, wrong-agent, failed, stale, or waiting responsibilities.

Heartbeat checks. Scheduled jobs act.

## 3. Expected Codi Scheduled Jobs

Heartbeat verifies that expected Codi jobs exist, are targeted to Codi where applicable, and have healthy recent run evidence.

Expected Codi jobs:

1. `Codi cron health sweep`
2. `Codi repo commit workflow`
3. `Codi Moltbook reply watcher`
4. `Codi Moltbook curiosity pulse`
5. `Codi Moltbook daily review`
6. `Codi durable memory promotion`
7. `Codi Moltbook weekly review`
8. `Codi XLR8ROS navigation tree refresh`
9. `CodiCore daily stale-file staging`
10. `CodiCore weekly office archive transfer`
11. `Codi operational queue check`

If a job exists but its first scheduled run has not happened yet, classify it as `pending first scheduled run`.

A job is late only when its scheduled run time has passed and no successful or acceptable terminal result exists for that run.

Report jobs that are missing, wrong-agent, failed, late, stuck, blocked, duplicated, routed incorrectly, waiting on Reg, or missing expected output evidence.

If all expected jobs exist and are healthy, do not list them.

## 4. Heartbeat Checks

Each heartbeat checks:

1. Codi-owned OpenClaw Gateway cron health
2. CodiCore daily-note capture health
3. durable memory promotion health
4. operational queue/backlog state
5. Moltbook responsibility state
6. repo commit workflow state
7. navigation refresh state
8. cleanup/archive job state
9. unresolved blockers
10. work waiting on Reg
11. output/action/report obligations owed to Reg
12. stale or repeated reports that should be suppressed or resolved

Heartbeat reports only meaningful state changes, blockers, owed actions, missed work, or changed risk.

## 5. Daily-Note Capture Check

Canonical daily notes live at:

`memory/YYYY-MM-DD.md`

Heartbeat checks that the current canonical daily note exists and is being updated when meaningful work occurs.

Daily notes capture meaningful timestamped events with:

- who
- what
- when
- where
- tags
- proximate why
- historical/context why when relevant
- how/method when there is an output, action, response, tool choice, or decision
- submitted response by when there is an output/message/report delivery channel to record

Proximate why explains why the event/action happened now.

Historical/context why explains which prior canon, memory, correction, precedent, lesson, failure, or standing rule shaped the event.

How/method explains the operational method, reasoning path, tool choice, response construction, or execution path chosen for the action/output.

Submitted response by records the delivery channel or medium, such as Telegram, OpenClaw, chat, CLI, report file, or other output route.

Heartbeat checks for missing daily-note capture, fragmented same-date daily-note files, malformed timestamp patterns, or obvious stale-path capture.

Heartbeat reports the issue. It does not normalize daily notes unless a scheduled normalization job or explicit user request authorizes that work.

## 6. Durable Memory Promotion Check

Durable event promotion reads the canonical daily note and writes every event from that daily note into durable/event memory.

Durable event promotion is exhaustive event write-through.

QMD/QMB supports search, retrieval, chunking, semantic recall, and context discovery. It does not decide what exists and does not decide what gets written.

Heartbeat checks whether the durable-memory promotion job exists, is targeted correctly, and produced expected artifacts when it last ran.

Expected promotion evidence:

1. durable/event memory output path
2. promotion log under `Outputs/promotion-logs/` or the active promotion-log lane
3. source daily-note path
4. event count promoted
5. malformed entries needing repair
6. exact blockers

Heartbeat reports promotion failure, missing artifacts, stale durable-memory output, missing promotion logs, or repeated malformed-entry blockers.

Heartbeat does not promote memory by itself.

## 7. Operational Queue / Backlog Check

The authoritative operational queue/backlog belongs outside CodiCore’s brain/body repo in the active office/HQ/control-plane lane.

Heartbeat checks the authoritative operational queue path when it is known from current navigation, HQ/office docs, or active runtime context.

Heartbeat checks for:

1. missing queue path
2. newly active items
3. blocked items
4. items waiting on Reg
5. stale active items with no recent update
6. duplicate items
7. superseded items
8. resolved items needing archive
9. calendar-ready items
10. scheduled queue updater failure

Heartbeat reports changed queue state, blockers, stale items, or items waiting on Reg.

Heartbeat does not execute the queue, bulk update queue statuses, create calendar entries, or rewrite the queue unless an assigned scheduled job or explicit user request authorizes that work.

If the queue path is unknown, report the missing authoritative path once, then suppress repeated reports until new evidence appears.

## 8. Moltbook Responsibility Check

Heartbeat checks Moltbook responsibilities by using current active paths and current config, not wildcard file discovery.

Known active Moltbook reference paths include:

- `HQ/XLR8ROS-HQ/XOS How-To Guides/MOLTBOOK_HOWTO.md`
- `HQ/UTILITIES/moltbook/`
- `Agents/Primary/CodiCore/CodiCore/state/moltbook/config.json`
- `Agents/Primary/CodiCore/CodiCore/Outputs/moltbook/`

Heartbeat checks whether Moltbook jobs are healthy and whether attention items changed.

When live Moltbook reads fail because DNS, network, upstream API, or authentication is unavailable, report a live-state verification blocker and avoid treating old DM/reply items as newly verified current truth.

If a pending DM/request/sender/product has an active local suppression rule, heartbeat treats it as suppressed unless a new distinct inbound item appears.

## 9. Repo Commit Responsibility Check

Codi repo commits are scheduled through OpenClaw Gateway cron.

Approved repos:

1. CodiCore
2. XLR8ROS-HQ
3. XLR8ROS_SEAD

Heartbeat checks whether the repo-commit job exists, is targeted to Codi, and has recent run evidence.

Report broad deletes/moves, protected-file changes, runtime-state changes, or questionable changes separately from routine safe changes.

Heartbeat does not commit changes by itself.

## 10. Navigation and Cleanup Checks

Heartbeat may verify that navigation refresh and cleanup/archival responsibilities are healthy when those jobs exist.

Navigation map refresh should generate the root map and distribute copies to approved repo navigation locations.

Cleanup checks use the active cleanup doctrine:

1. daily job runs every 24 hours
2. daily job processes cleanup-eligible files that are 72 hours old or older
3. active brain/body lanes stay protected
4. staged/compressed material is reviewed before weekly archive movement
5. weekly job moves already-staged/compressed material out of active CodiCore into the office/archive lane

Heartbeat reports failed cleanup jobs, missing archive output, stale staging, or protected-path risk.

Heartbeat does not compress, move, delete, or archive files by itself.

## 11. Response Rules

If heartbeat finds no changed risk, owed action, missed work, failed job, stale output, blocker, or meaningful update, respond exactly:

`HEARTBEAT_OK`

If heartbeat finds a problem, report only:

1. job/responsibility name
2. issue
3. evidence
4. exact blocker
5. expected next action or owner

Avoid repeating unchanged known issues unless the state changed, a deadline was missed, or Reg is owed action.

## 12. Final Rule

Heartbeat is a health inspector, not the mechanic.

It checks the dashboard, identifies changed risk, reports blockers, and confirms scheduled responsibilities produced their expected evidence.

Scheduled jobs perform writes, updates, syncs, archive movement, durable promotion, commits, and other operational work.
