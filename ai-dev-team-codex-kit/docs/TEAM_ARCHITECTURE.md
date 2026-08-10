# Архитектура AI-команды

## 1. Manager

Главный Codex-поток играет роль engineering manager / tech lead. Он принимает пользовательскую задачу, определяет масштаб, выбирает специалистов, собирает их выводы и остаётся владельцем финального решения.

Manager не обязан создавать субагента для каждого шага. Простые изменения делаются напрямую.

## 2. Глобальное ядро

| Агент | Назначение | По умолчанию |
|---|---|---|
| architect | архитектурные границы и план | read-only |
| planner | превращает цель в конечный план/acceptance criteria | read-only |
| backend_engineer | API, сервисы, Python/Node backend | workspace-write |
| frontend_engineer | React/Next.js/UI | workspace-write |
| database_engineer | схемы, миграции, запросы | workspace-write |
| devops_engineer | Docker, CI/CD, environments | workspace-write |
| test_engineer | тесты, воспроизведение багов, regression | workspace-write |
| reviewer | correctness/regressions | read-only |
| security_reviewer | auth, secrets, trust boundaries | read-only |
| performance_engineer | profiling, bottlenecks, benchmarks | read-only |
| docs_researcher | актуальная документация через MCP | read-only |
| beginner_mentor | объяснение готовых изменений | read-only |
| release_manager | readiness/PR/release checklist | read-only |

Встроенные Codex `explorer` и `worker` сохраняются и используются для общего исследования/реализации.

## 3. Проектные специалисты

У каждого проекта есть 2–6 узких специалистов. Они живут в `<repo>/.codex/agents/` и не засоряют остальные проекты.

## 4. Правило владения файлами

Во время параллельной реализации Manager обязан назначить непересекающиеся области файлов. Если два изменения пересекаются, они выполняются последовательно.

Пример:

```text
architect + explorer  -> параллельно, read-only
        ↓
backend_engineer      -> backend/**
frontend_engineer     -> frontend/**
        ↓
test_engineer         -> tests/** + запуск тестов
        ↓
reviewer              -> read-only diff review
```

## 5. Лимиты

Не использовать многоагентность ради самой многоагентности. Если задача помещается в один модуль и проверяется одним набором тестов, главный агент делает её сам или вызывает одного профильного worker.
