# Текущий план AI Dev Team

Статус: Завершён
Этап: Canonical fallback policy + Node package management + workspace decoupling
Дата: 2026-08-20

## Результат

- `rules/fallback-policy.md` стал единым глобальным контрактом retry/fallback/degraded/fail-closed;
- `rules/node-package-management.md` стал каноническим Node/Corepack/npm/pnpm/Yarn policy;
- новые rules включены в manifest и workspace validation;
- ДЕВ больше не хранит live inventory или очередь product repositories;
- project-overlay validator остаётся reusable read-only capability;
- project-specific fallback хранится только как delta в product repositories.

## Definition of Done

- workspace validator PASS;
- manifest синхронизирован;
- нет зависимости AI_STATUS/ROADMAP от product lifecycle;
- Fallback Policy и Node Policy маршрутизируются корректно;
- product repositories не требуются для признания этапа завершённым.
