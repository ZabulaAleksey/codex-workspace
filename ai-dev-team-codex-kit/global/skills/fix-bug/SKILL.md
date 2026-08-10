---
name: fix-bug
description: Reproduce, isolate, minimally fix, test, and review a concrete software bug.
---

1. Reproduce the bug or create a deterministic failing test.
2. Use `explorer` for unfamiliar paths; do not spawn an architect for a local bug unless boundaries are involved.
3. Identify the root cause before editing.
4. Assign one write-agent to the affected area.
5. Add a regression test that fails before the fix and passes after it when practical.
6. Run `reviewer` for cross-module, data, auth, concurrency, or production-critical fixes.
7. Report root cause, changed files, tests, and remaining risk.
