# Tutor Platform — project instructions

## Product boundary

Next.js/React/TypeScript; backend/API + PostgreSQL; WebRTC communication; Yjs CRDT for collaborative board/doc state; calendar integration; PWA/mobile notification/calling flows; optional Cloudflare deployment.

## AI team routing

Project specialists: collaboration_engineer, realtime_comms_engineer, calendar_integration_engineer, pwa_mobile_engineer, education_content_engineer.

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

Context7 + GitHub + Playwright + Chrome DevTools. Cloudflare API MCP only if deployed there. Figma optional. Calendar integration should use the chosen provider API with narrow OAuth scopes; do not depend on an unverified third-party MCP.

## Code Review Rules

- Flag data loss, silent corruption, duplicate processing, broken reconnect/retry behavior and missing regression tests.
- Flag technology additions that duplicate an existing component without a migration/removal plan.
- Treat performance claims without benchmarks as unverified, not as established improvements.
