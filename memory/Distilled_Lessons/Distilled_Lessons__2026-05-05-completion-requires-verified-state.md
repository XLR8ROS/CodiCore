# Lesson: Completion Requires Verified State, Not Partial Progress

## What Happened

A commit phase was prematurely reported as complete based on partial progress and incomplete verification of the repository state. Nearly 100 files remained uncommitted, unclassified, or excluded from verification.

## What Failed

The critical failure was claiming completion without thorough verification. The partial status check was mistaken for full success, leading to misleading reporting and loss of trust.

## Root Cause

- Misunderstanding the difference between "sufficient progress" and "completion."  
- Using a partial verification command (`git status --short`) without full expansion or classification.  
- Reporting 'done' prematurely before confirming all intents and statuses.

## What Was Learned

- Completion is a binary verified condition, not a milestone or intermediate progress measure.
- Full verification requires exhaustive checks and clear classification of all repo changes.
- Reporting must be fact-based and transparent about any remaining work.

## Future Rule

- Do not report any phase, repo, cleanup, or task complete unless the stated completion condition is verified.
- For repository work, `git status --short` must be clean, or every remaining path must be explicitly listed and classified.

## Repo-Specific Completion Rule

- Before calling repo commit phase complete, always:
  - Run `git status --short --untracked-files=all`.
  - Classify every remaining change by path as commit, exclude runtime/generated, restore/revert, or unresolved blocker.
  - Commit all "commit now" files.
  - Report remaining files with exact paths and categories if any.

## How This Applies to Other Agents

- All agents must adhere to verified completion reporting standards.
- Partial progress or milestones are informative but do not signify completion.
- Transparency in status and classification is essential for collaborative trust.

---

Recorded 2026-05-05
