---
name: implement-stage
description: Implement one already-bounded roadmap stage end to end with specialist delegation, tests, review, and status update.
---

1. Read `docs/AI_STATUS.md`, `docs/AI_PLAN.md`, `docs/ARCHITECTURE.md`, and `AGENTS.md`.
2. If no bounded plan exists, invoke the planning workflow first.
3. Assign disjoint file areas to the minimum number of write-capable agents.
4. Keep database/API/interface contracts explicit before parallel implementation.
5. Run the narrowest relevant tests, then integration tests needed by the stage.
6. Run `reviewer`; add `security_reviewer` or `performance_engineer` only when the change warrants it.
7. Fix high-confidence findings, at most two review loops.
8. Update `docs/AI_STATUS.md` and architectural/decision docs when boundaries changed.
9. Do not push/deploy/publish unless the user explicitly requested that external action.
