---
name: bootstrap-project-framework
description: Создать или актуализировать проектный КАРКАС и АВТОМАТИЗАЦИЮ КОНТЕКСТА поверх существующей AI Dev Team. Использовать, когда пользователь просит «создай КАРКАС», «сделай автоматизацию контекста», подготовить новый repository к поэтапной Codex-разработке или выполнить gap analysis существующего project overlay без реализации продукта.
---

# Создание проектного КАРКАСА

1. Прочитай ближайшие `AGENTS.md`, `~/codex-workspace/docs/PROJECT_FRAMEWORK.md`, `~/codex-workspace/docs/CONTEXT_POLICY.md` и `~/codex-workspace/docs/CONTEXT_COMPATIBILITY.md`.
2. Определи Git-корень, состояние рабочей копии, сложность, режим, этап SDLC, домен, стек и каноническую SPEC.
3. Если repository уже содержит КАРКАС, выполни inspect → gap analysis; не регенерируй работающие документы.
4. Отдели стабильные требования от архитектуры, текущего плана и статуса. Используй канонические `specs/system.spec.md`, `docs/AI_PLAN.md`, `docs/AI_STATUS.md` и `docs/ROADMAP.md`.
5. Спроектируй минимальную project delta: локальные инварианты, архитектурные границы, решения, контракты, security/testing по риску и самостоятельные stage prompts при реальной пользе.
6. Перед добавлением agent, hook, MCP, Skill, config или workflow классифицируй его как `INHERITED`, `EXTEND`, `PROJECT_ONLY`, `CONFLICT` или `OBSOLETE`. Запиши нетривиальный результат в проектный `docs/CONTEXT_COMPATIBILITY.md`.
7. Настрой в тонком `AGENTS.md` маршрутизацию от типа задачи к минимальному набору SPEC, architecture, decisions, security и tests. Не копируй глобальные правила.
8. Для каждого этапа укажи цель, контекст, зависимости, scope, разрешённые/запрещённые файлы, tests, quality gates, DoD, acceptance artifacts и rollback/failure conditions.
9. Проверь согласованность SPEC → contracts → stages → acceptance/tests, отсутствие дублирующих status/source-of-truth файлов и приемлемый context budget.
10. Обнови текущий status и остановись до реализации продукта, если пользователь явно не запросил код.

## Ограничения

- Не создавай приложение, runtime infrastructure или product MCP в рамках bootstrap без прямого запроса.
- Не создавай локальные generic agents, hooks, Skills, Git workflow или Codex config «на всякий случай».
- Не выдумывай неизвестное: фиксируй открытые вопросы, owner и момент решения.
- Не создавай `PROGRESS.md` рядом с `docs/AI_STATUS.md` и не превращай prompt library в источник требований.
