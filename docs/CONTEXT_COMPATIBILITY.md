# Аудит совместимости контекста

Используй этот шаблон перед добавлением или существенным изменением agent, hook, MCP, Skill, rules или конфигурации.

## Статусы

- `INHERITED` — возможность уже предоставляет глобальный или workspace-уровень; локальная копия не нужна.
- `EXTEND` — общая возможность подходит, но проект добавляет узкое правило или адаптер.
- `PROJECT_ONLY` — возможность относится только к одному проекту и хранится в нём.
- `CONFLICT` — определения дублируются или задают несовместимое поведение; выбери один канонический источник.
- `OBSOLETE` — возможность больше не используется и должна быть удалена отдельным согласованным изменением.

## Таблица решения

| Возможность | Что уже есть глобально / в workspace | Потребность проекта | Статус | Решение и канонический источник |
|---|---|---|---|---|
| Архитектура | | | | |
| QA / тестирование | | | | |
| Безопасность | | | | |
| Review | | | | |
| Документация | | | | |
| Git workflow | | | | |
| Hooks | | | | |
| MCP | | | | |
| Skills | | | | |
| Доменные agents | | | | |
| Конфигурация Codex | | | | |

## Правила решения конфликтов

- Сначала переиспользуй существующую возможность, затем расширяй её минимальным проектным слоем.
- Не создавай второй глобальный config, второй Git workflow, дубликаты универсальных агентов или одинаковые MCP.
- Локальные hooks и MCP должны закрывать конкретный проектный пробел и иметь минимальные разрешения.
- Укажи владельца общих manifests/docs и проверь конфликты перед параллельной записью.

## Решение 2026-08-13 — общий КАРКАС проектов

| Возможность | Что уже было | Новая потребность | Статус | Решение |
|---|---|---|---|---|
| Терминология КАРКАСА | Project overlay и context policy без общего определения команды | одинаковое значение для всех `projects/*` | `EXTEND` | канонический `docs/PROJECT_FRAMEWORK.md` |
| Context routing | корневой и глобальный `AGENTS.md` | распознавать команды «создай КАРКАС» / «автоматизация контекста» | `EXTEND` | короткие routers; полный текст не копируется |
| Bootstrap workflow | generic planning/implementation Skills | повторяемый inspect → gap → minimal delta процесс | `EXTEND` | общий `bootstrap-project-framework` Skill |
| SessionStart hook | компактный активный context hook | task-aware выбор документов | `INHERITED` | hook не расширять всей библиотекой docs/prompts |
| Presets/projects | локальные overlays | распространить определение | `INHERITED` | не копировать документ/Skill в каждый repository |
| OCR-примеры исходного brief | только Text Recognition Core | общая терминология | `CONFLICT` | оставить в TRC; глобальный документ domain-neutral |
| Язык проектного контекста | единого правила не было, часть agents и документов была на английском | единый читаемый язык новых КАРКАСОВ | `EXTEND` | русский по умолчанию в `AGENTS.md`, `PROJECT_FRAMEWORK.md` и bootstrap Skill; программные идентификаторы и внешние контракты не переводятся |

Новые hook, MCP, config и subagents не созданы. Skill валидируется штатным `quick_validate.py` и прошёл read-only forward-test на независимом document-converter сценарии.

## Решение 2026-08-13 — проверка project overlay

| Возможность | Что уже было | Новая потребность | Статус | Решение |
|---|---|---|---|---|
| Workspace validation | `tools/validate_context.py` проверяет manifest общей инфраструктуры | проверить один независимый project repository | `EXTEND` | отдельный read-only `tools/validate_project_overlay.py` |
| Rollout inventory | тематический список проектов | историческая очередь rollout этапа 1 | `OBSOLETE` | superseded 2026-08-20: ДЕВ не хранит live inventory product repositories |
| Agents / Skills / hooks / rules / workflow | канонические источники в workspace/global | не допустить точных локальных копий | `INHERITED` | SHA-256 comparison; найденные копии только диагностируются |
| Project-local automation | могла существовать без единого gate | требовать явное решение о локальной delta | `EXTEND` | при наличии automation обязателен `docs/CONTEXT_COMPATIBILITY.md` проекта |
| Fallback Policy | отдельных согласованных правил деградации не было | единый общий контракт retry/fallback/degraded/fail-closed | `EXTEND` | канонический источник — `rules/fallback-policy.md`; проекты наследуют его и хранят только предметную delta |

Новые hook, MCP, config, generic agents и workflow не добавлены. Validator использует только Python standard library и Git, не выполняет project-код и не изменяет проверяемый repository.

Live inventory product repositories больше не является capability ДЕВ.
Универсальный read-only `tools/validate_project_overlay.py` остаётся активным и
принимает один явно выбранный repository. Fallback Policy остаётся общим
каноническим источником, а `docs/FALLBACKS.md` в product repository — только
project-specific delta.

Пользовательский `~/.codex/AGENTS.md` и `~/.agents/skills/bootstrap-project-framework` синхронизированы с их каноническими workspace-источниками. Это статус `INHERITED` для всех проектов: Skill и router не копируются в каждый repository.

## Решение 2026-08-20 — нормализация глобального runtime-слоя

| Возможность | Найденное состояние | Статус | Решение и канонический источник |
|---|---|---|---|
| Global AGENTS / agents / hooks / rules | 18 installed-файлов разошлись с `global/codex` | `CONFLICT` → `INHERITED` | полезная model routing delta перенесена в канон; installed hashes синхронизированы |
| Session context hook | installed-версия падала на cp1251; canonical читал полный файл и следовал внешним symlink | `CONFLICT` → `EXTEND` | UTF-8 output, repository containment и bounded read в `global/codex/hooks/session_context.py` |
| Context7 | credential в process args, unpinned package | `CONFLICT` → `INHERITED` | no-key запуск, reviewed pin `4.0.2`; ротация старого credential остаётся внешним действием |
| GitHub | plugin и authenticated static MCP работали параллельно | `CONFLICT` | plugin — primary, static MCP — disabled fallback; permission mode требует выбора владельца |
| Atlassian | standalone MCP задан, но runtime route не подтверждён | `CONFLICT` | definition сохранён с `enabled = false` |
| Google Calendar / Slack | config помечал enabled, Plugin Management подтвердил отсутствие установки | `OBSOLETE` | inert blocks сохранены выключенными, cache вручную не удаляется |
| Browser trusted service | ссылка на отсутствующий `browser-service.mjs` и один неподтверждённый client hash | `CONFLICT` | broken browser mapping и unmatched hash удалены; `sky` не изменён; host repair проверяется после restart |
| Project trust | broad home, три неверных имени и три non-project roots | `CONFLICT` | broad/non-project trust удалён, имена заменены на существующие Git roots |
| Shell environment | spawned commands наследовали `*_TOKEN` | `CONFLICT` | `ignore_default_excludes = false`; проверка фактического нового shell после restart |
| Recommendation files | устаревший AGENTS staging и актуальный config proposal | `OBSOLETE` / `EXTEND` | obsolete AGENTS staging удалён после hash-check; config recommendation сохранён как неактивный proposal |
