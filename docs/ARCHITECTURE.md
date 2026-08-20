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

`tools/validate_context.py` отдельно проверяет manifest самого workspace.
`tools/validate_project_overlay.py` запускается для одного явно выбранного repository;
workspace не хранит live inventory product repositories. Текущие этапы, blockers
и другие сведения о состоянии продукта принадлежат самому product repository.

## Потоки и интерфейсы

- Вход validator: путь repository и опциональный `--json`.
- Источник глобальных fingerprints: `global/codex`, `global/skills`, `rules` и `docs/WORKFLOW.md`.
- Выход: код `0` при полном соответствии, `1` со стабильным отсортированным списком issues при нарушении.
- Внешняя зависимость: только executable `git`; остальная реализация использует Python standard library.

## Контур глобальной установки Codex

```text
global/codex (канон в Git)
        ↓ reviewed sync
~/.codex (активный runtime-слой)
        ↓ read-only validation
hashes managed-файлов + безопасные инварианты config.toml
```

`install-global.ps1 -SyncManaged` синхронизирует только reviewed managed-файлы и не перезаписывает активный `config.toml`. `tools/normalize_user_codex.py` выполняет ограниченную, идемпотентную и предварительно валидируемую нормализацию пользовательского TOML без вывода секретов. `tools/validate_global_codex.py` независимо проверяет hashes установленного слоя и статические границы безопасности.

Host-managed runtime bindings не подменяются угаданными путями: отсутствующая browser service удаляется, `sky` binding сохраняется, а browser client hash допускается только при совпадении с фактически установленным client-файлом.

## Policy layer

Сквозные инженерные policies находятся в `rules/`.

Fallback/retry/degradation contract:

`rules/fallback-policy.md`

Project-specific implementation:

`projects/<project>/docs/FALLBACKS.md`

Архитектура проекта определяет компоненты, границы состояния,
idempotency/recovery interfaces и места возможной деградации,
но не дублирует общий fallback contract.
