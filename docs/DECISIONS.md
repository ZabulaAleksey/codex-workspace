# Существенные решения

## 2026-08-13 — Project overlay вместо копии AI Dev Team

- Решение: project хранит только локальные требования, документы и подтверждённые расширения.
- Причина: исключить drift и конфликт глобальных agents, Skills, hooks, rules и workflow.
- Альтернатива: копировать общий набор в каждый repository; отклонена из-за дублирования.
- Последствие: точная копия глобальной capability является ошибкой validator.

## 2026-08-13 — Один Markdown-каталог rollout

- Решение: использовать только `docs/PROJECT_CATALOG.md`.
- Причина: человеку нужен один источник lifecycle, blockers и следующего действия.
- Альтернатива: дополнительный JSON/YAML registry; отклонена как второй источник истины.

## 2026-08-13 — Read-only validator

- Решение: validator принимает путь одного repository, ничего не исправляет и поддерживает human/JSON output.
- Причина: проверка должна быть повторяемой и безопасной для независимых рабочих копий.
- Последствие: неполный или спорный repository получает issue; изменение выполняется отдельным этапом.

## 2026-08-20 — Один канонический контракт Fallback Policy

- Решение: общий контракт retry/fallback/degraded/fail-closed хранится только в `rules/fallback-policy.md`.
- Причина: fallback-правила не должны расходиться между agents, Skills, security docs и проектами.
- Проекты наследуют общий контракт и при необходимости создают только `docs/FALLBACKS.md` с предметной delta.
- `SECURITY.md` остаётся владельцем security invariants, `DECISIONS.md` — причин решений, `ARCHITECTURE.md` — границ и recovery interfaces.
- Silent fallback и fallback, ослабляющий security или evidence, запрещены.