# Контрольный список проверки установки

## Глобальная конфигурация

```powershell
codex mcp list
codex --ask-for-approval never "Кратко изложи текущие глобальные и проектные инструкции."
```

В TUI:

```text
/agent
/hooks
/skills
/mcp
```

## Правила

Пример проверки:

```powershell
codex execpolicy check --pretty --rules "$HOME\.codex\rules\ai-dev-team.rules" -- git push --force origin main
```

Ожидаемый результат: действие запрещено.

## Пробный запуск hook

```powershell
'{"cwd":"C:\\path\\to\\repo","hook_event_name":"SessionStart","source":"startup"}' | py -3 "$HOME\.codex\hooks\session_context.py"
```

Для репозитория с `docs/AI_STATUS.md` ожидается JSON, содержащий `additionalContext`.

## Проект

```powershell
git status --short
codex --ask-for-approval never "Перечисли пользовательских агентов проекта и укажи, кто из них должен обрабатывать следующий этап дорожной карты. Не изменяй файлы."
```
