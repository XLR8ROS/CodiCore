# Durable Failure Lesson: Completion Is a Verified State

## Lesson

Completion is a verified state, not a milestone, effort level, or partial progress summary.

Before reporting any phase, repo, task, or cleanup complete, the completion condition must be verified with the proper final check. If anything remains, the phase must be reported as not complete and the remaining items must be listed by exact path, status, and reason.

Never call work complete because the commits or actions chosen to perform are done. Completion means the objective condition is satisfied.

## Repo Rule

For repo work, do not report complete unless:
- `git status --short` is clean, or
- every remaining path is explicitly listed and classified.

## Why this matters

This prevents premature completion claims, protects trust, and ensures reports are based on facts rather than partial progress or subjective sufficiency.

---

Recorded 2026-05-05
