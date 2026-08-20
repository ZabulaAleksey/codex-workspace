# Текущий план AI Dev Team

Статус: Завершён с внешними follow-up
Этап: Нормализация глобального слоя Codex
Дата: 2026-08-20

## Выполнено

1. Сформирована и утверждена `global-codex-normalization.spec.md`.
2. Семантически объединены canonical и installed AGENTS/agents без потери model routing.
3. Hooks исправлены для UTF-8 Windows output, repository containment, bounded read и расширенного destructive deny-list.
4. Добавлены идемпотентный config normalizer и read-only global validator.
5. Активный `~/.codex` синхронизирован; Context7 credential удалён из args, package versions закреплены, конфликтные MCP/plugins выключены, trust paths нормализованы.
6. Выполнены unit, integration, component и security проверки.

## Definition of Done

- active managed hashes совпадают с `global/codex` — PASS;
- normalizer повторно не меняет config — PASS;
- global validator — PASS;
- hook UTF-8/containment/bounds/deny probes — PASS;
- workspace manifest validator — PASS;
- независимые architecture/security/reviewer checks — обязательны до commit;
- внешние и интерактивные действия перечислены и не выдаются за автоматизированные — PASS.

## Внешние follow-up

- отозвать/ротировать старый Context7 credential;
- выбрать безопасный GitHub plugin write-permission mode;
- перезапустить Codex, подтвердить `/hooks`, Browser и отсутствие secret-like variables в новом shell;
- отдельно решить lifecycle `dune-rts` и bootstrap `monte-carlo`.
