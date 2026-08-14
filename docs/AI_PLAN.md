# Текущий план AI Dev Team

Статус: Завершён
Этап: Project overlay rollout, этап 1
Дата: 2026-08-13

## Цель

Активировать глобальный КАРКАС Codex, добавить воспроизводимую read-only проверку project overlay и подключить `projects/off-screen-canvas` как первый пилот без изменения продукта.

## Требования

`FR-101`–`FR-106`, `NFR-101`–`NFR-104`, `AC-101`–`AC-107` из `specs/features/project-overlay-rollout.spec.md`.

## Область файлов

### Workspace AI Dev Team

- `specs/` и обязательные `docs/AI_*.md`, architecture/decisions/design/security;
- `docs/PROJECT_CATALOG.md`, `docs/CONTEXT_COMPATIBILITY.md`, `docs/LEARNING_LOG.md`;
- read-only validator и его тесты в `tools/`;
- `MANIFEST.txt`, README/verification docs только при изменении фактов.

### Пилот

- `projects/off-screen-canvas/AGENTS.md` только при подтверждённом пробеле;
- `projects/off-screen-canvas/specs/`;
- `projects/off-screen-canvas/docs/`.

Runtime-файлы продукта запрещены.

## Последовательность

1. Зафиксировать архитектуру, решения, состояние и rollout-реестр workspace.
2. Реализовать project-overlay validator и автоматические тесты.
3. Проверить эталон `text-recognition-core` и пилот до изменений.
4. Без force-перезаписи синхронизировать глобальный router и установить пользовательский Skill.
5. Создать отдельную feature-ветку пилота и добавить минимальную project delta.
6. Запустить unit tests, workspace validation, project validation и context forward-test.
7. Провести reviewer, исправить блокирующие замечания, обновить статусы и сделать отдельные commits.

## Quality gates

- все критерии `AC-101`–`AC-107` имеют доказательство;
- глобальная установка не удаляет и не перезаписывает несвязанный пользовательский контент;
- повторный validator не меняет проверяемый repository;
- workspace и pilot имеют чистый Git status после коммита;
- следующий rollout-кандидат указан однозначно.

## Откат и остановка

- Workspace и pilot откатываются независимо через revert своих commits.
- При dirty worktree, неизвестном происхождении локальной automation или необходимости менять runtime-код rollout останавливается до отдельного решения.

## Результат

- пользовательские router и `bootstrap-project-framework` синхронизированы с каноническими файлами по SHA-256;
- read-only validator и автоматические тесты реализованы;
- `off-screen-canvas` проходит validation и SessionStart forward-test без runtime-изменений;
- единственный следующий rollout-кандидат — `electro-tutor`.
