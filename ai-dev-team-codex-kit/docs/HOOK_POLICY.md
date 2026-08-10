# Политика Hooks

## Почему основной hook глобальный

Codex загружает все matching hooks из активных конфигурационных слоёв; project hook не заменяет global hook. Поэтому одинаковый `SessionStart` в шести репозиториях только продублировал бы контекст и расход токенов.

В этом kit локальные project hooks **намеренно не создаются по умолчанию**. Вместо этого:

- глобальный `SessionStart` читает `docs/AI_STATUS.md`, `docs/AI_PLAN.md`, `docs/ARCHITECTURE.md` текущего репозитория;
- глобальный `SubagentStart` даёт тот же компактный project context субагенту;
- глобальный `PreToolUse` блокирует небольшой набор необратимых команд;
- project-specific policy хранится в `AGENTS.md`, `AGENTS.override.md` и `.codex/rules/project.rules`.

## Когда добавлять локальный hook

Добавляй `<repo>/.codex/hooks.json` только если нужна детерминированная автоматизация, специфичная для одного проекта, например:

- проверять схему миграции перед запуском database command;
- подмешивать автоматически сгенерированный hardware/device state;
- запрещать конкретный production CLI в одном репозитории;
- запускать локальный policy script для особого формата generated files.

Не используй hook для того, что достаточно описать инструкцией в `AGENTS.md`.
