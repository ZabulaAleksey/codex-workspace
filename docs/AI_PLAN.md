# Текущий план AI Dev Team

Статус: В работе
Этап: Canonical fallback policy + Node package management
Дата: 2026-08-20

## Цель

Усилить самостоятельный канонический слой инженерных правил AI Dev Team:

1. создать единый `rules/fallback-policy.md`;
2. подключить его через context routing без глобального автозагружания;
3. закрепить inheritance/project-delta contract для fallback rules;
4. заполнить `rules/node-package-management.md`;
5. синхронизировать architecture, decisions и compatibility документацию ДЕВ;
6. обеспечить возможность независимого наследования этих правил любым project overlay.

## Область

Изменения относятся только к repository AI Dev Team.

Product repositories не являются частью этого этапа
и не определяют его завершённость.

## Definition of Done

- `rules/fallback-policy.md` является единственным глобальным
  источником retry/fallback/degraded/fail-closed contract;
- `rules/README.md` корректно маршрутизирует эту policy;
- корневой `AGENTS.md` содержит только компактный router;
- `docs/PROJECT_FRAMEWORK.md` определяет правило project-specific delta;
- `docs/CONTEXT_COMPATIBILITY.md` фиксирует inheritance;
- `docs/ARCHITECTURE.md` отражает policy layer;
- `docs/DECISIONS.md` фиксирует решение об одном каноническом источнике;
- `rules/node-package-management.md` содержит канонические
  Node/Corepack/npm/pnpm/Yarn правила для Windows и других сред;
- Node/package-manager fallback подчиняется общей Fallback Policy;
- validators и относящиеся тесты проходят;
- никакой product repository не требуется для признания этапа завершённым.

## Остановка / fail closed

Если новое общее правило требует знания,
специфичного только для одного продукта,
оно не добавляется в ДЕВ как глобальная policy.

Такое правило должно оставаться project-specific delta.