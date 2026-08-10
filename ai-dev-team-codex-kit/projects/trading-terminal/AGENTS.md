# Trading Terminal — project instructions

## Product boundary

Next.js/React/TypeScript; FastAPI/Python; MT bridge (MQL); PostgreSQL + TimescaleDB; RabbitMQ events; Temporal workflows; OpenTelemetry; NumPy/Numba; Rust/WASM; later OpenCL/WebGPU.

## AI team routing

Project specialists: quant_engineer, mql_engineer, timescale_engineer, temporal_engineer, observability_engineer, wasm_engineer.

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

OpenAI Docs + Context7 + GitHub. Add Playwright/Chrome DevTools for frontend/history performance. Cloudflare/Sentry only when deployed/used.

## Code Review Rules

- Flag data loss, silent corruption, duplicate processing, broken reconnect/retry behavior and missing regression tests.
- Flag technology additions that duplicate an existing component without a migration/removal plan.
- Treat performance claims without benchmarks as unverified, not as established improvements.
