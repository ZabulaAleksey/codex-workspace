# Music Sequencer — project instructions

## Product boundary

React/TypeScript UI; Web Audio API; AudioWorklet; Rust/WASM DSP; optional Tauri desktop shell; Yjs for collaborative project state if collaboration is added.

## AI team routing

Project specialists: audio_dsp_engineer, realtime_audio_engineer, wasm_audio_engineer, sequencer_model_engineer.

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

Context7 + GitHub; Chrome DevTools for Web Audio/performance debugging; Playwright for UI/e2e. Figma optional.

## Code Review Rules

- Flag data loss, silent corruption, duplicate processing, broken reconnect/retry behavior and missing regression tests.
- Flag technology additions that duplicate an existing component without a migration/removal plan.
- Treat performance claims without benchmarks as unverified, not as established improvements.
