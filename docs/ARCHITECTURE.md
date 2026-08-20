# Архитектура AI Dev Team

## Назначение и границы

`~/codex-workspace` — канонический repository общей AI-инфраструктуры. `global/` содержит устанавливаемые пользовательские возможности, `rules/` и `templates/` — выборочную инженерную библиотеку, `presets/` — шаблоны, а `projects/*` — независимые Git-репозитории и не входят в историю workspace.

## Project-framework контур

```text
SPEC и workspace policy
        ↓
тонкий project AGENTS.md + project docs/specs
        ↓
read-only validator
        ↓
детерминированный human/JSON результат
```

`tools/validate_project_overlay.py` принимает ровно один target repository. Он проверяет независимый Git-root, канонические документы, альтернативные status-файлы, точные копии глобальной automation и compatibility audit. Инструмент не пишет в target и не меняет Git-конфигурацию: `safe.directory` передаётся только конкретному процессу Git через `-c`.

`tools/validate_context.py` отдельно проверяет manifest самого workspace. Канонический rollout-реестр — `docs/PROJECT_CATALOG.md`.

## Потоки и интерфейсы

- Вход validator: путь repository и опциональный `--json`.
- Источник глобальных fingerprints: `global/codex`, `global/skills`, `rules` и `docs/WORKFLOW.md`.
- Выход: код `0` при полном соответствии, `1` со стабильным отсортированным списком issues при нарушении.
- Внешняя зависимость: только executable `git`; остальная реализация использует Python standard library.

## Policy layer

Сквозные инженерные policies находятся в `rules/`.

Fallback/retry/degradation contract:

`rules/fallback-policy.md`

Project-specific implementation:

`projects/<project>/docs/FALLBACKS.md`

Архитектура проекта определяет компоненты, границы состояния,
idempotency/recovery interfaces и места возможной деградации,
но не дублирует общий fallback contract.