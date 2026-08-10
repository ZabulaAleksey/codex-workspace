---
name: review-change
description: Review a diff or branch for correctness and risk without changing code.
---

1. Inspect the actual diff and affected execution paths.
2. Run `reviewer`.
3. Add `security_reviewer` if auth/secrets/network/input trust changed.
4. Add `performance_engineer` if the change claims or risks meaningful performance impact.
5. Consolidate duplicate findings and order by severity.
6. Do not edit files.
