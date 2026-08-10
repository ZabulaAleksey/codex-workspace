# Receipt Price DB — project instructions

## Product boundary

Image preprocessing + OCR adapter + receipt parser + product normalization + Apache Arrow tables + Parquet archive + PostgreSQL/DuckDB analytics + Excel export.

## AI team routing

Project specialists: vision_ocr_engineer, arrow_data_engineer, product_normalization_engineer, receipt_data_quality_engineer.

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

Context7 + GitHub. Playwright only if a web UI is added. OCR provider-specific MCP is unnecessary; keep OCR behind an adapter. Arrow/Parquet docs come via Context7.

## Code Review Rules

- Flag data loss, silent corruption, duplicate processing, broken reconnect/retry behavior and missing regression tests.
- Flag technology additions that duplicate an existing component without a migration/removal plan.
- Treat performance claims without benchmarks as unverified, not as established improvements.
