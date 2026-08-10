# Когда переходить от Codex subagents к своему оркестратору

Текущий набор специально построен без отдельного Agents SDK manager-сервиса. Codex сам выступает manager-агентом.

Переход к программной оркестрации оправдан, когда появится хотя бы один повторяемый workflow такого вида:

```text
GitHub issue
  -> classify
  -> architecture plan
  -> parallel implementation in isolated worktrees
  -> test/eval
  -> targeted repair loop
  -> security/perf review
  -> PR
  -> wait for review
  -> address comments
```

Тогда отдельный `ai-dev-orchestrator/` можно строить на OpenAI Agents SDK / Responses multi-agent, GitHub MCP/API и OpenTelemetry. До этого TOML-subagents + Skills дают меньшую сложность и лучше контролируются человеком.
