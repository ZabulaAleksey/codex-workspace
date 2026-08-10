# Field Lab — project instructions

## Product boundary

Python scientific core (NumPy/SciPy/Numba) and/or Rust compute modules; web UI for interactive visualization; optional WASM/WebGPU; modules for scalar/vector/EM fields, harmonics and numerical methods.

## AI team routing

Project specialists: numerical_methods_engineer, electromagnetics_engineer, scientific_visualization_engineer, math_verifier.

- Use global `architect`, `planner`, `reviewer`, `test_engineer`, `security_reviewer`, `performance_engineer` as needed.
- Use built-in `explorer` for repository mapping.
- Do not spawn every specialist for every task.
- For roadmap work use `$implement-stage` or the local project skill.
- Keep `docs/AI_STATUS.md`, `docs/AI_PLAN.md`, `docs/ARCHITECTURE.md`, and `docs/DECISIONS.md` current.

## Change discipline

- Preserve existing working behavior unless the requested stage changes it.
- Define interfaces before parallel work across layers.
- One write-agent per overlapping file area.
- New technology requires a concrete problem statement and verification metric.
- Avoid external writes/deploys unless explicitly requested.

## Project MCP

Context7 + GitHub. Browser MCP only if web UI. Optional future custom Mathcad MCP for exchange/automation, not required for core compute.

## Code Review Rules

- Flag data loss, silent corruption, duplicate processing, broken reconnect/retry behavior and missing regression tests.
- Flag technology additions that duplicate an existing component without a migration/removal plan.
- Treat performance claims without benchmarks as unverified, not as established improvements.
