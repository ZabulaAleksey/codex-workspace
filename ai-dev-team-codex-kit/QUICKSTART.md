# Быстрый старт в Windows

```powershell
# 1) Распаковать набор и открыть PowerShell в его папке
Set-ExecutionPolicy -Scope Process Bypass

# 2) Установить глобальное ядро
.\install-global.ps1

# 3) Объединить предложенную конфигурацию с существующей, если она была
notepad "$HOME\.codex\config.ai-dev-team.recommended.toml"
notepad "$HOME\.codex\config.toml"

# 4) Установить один проектный preset
.\install-project.ps1 -Preset trading-terminal -Target 'C:\path\to\trading-repo'

# 5) Проверить из репозитория
cd 'C:\path\to\trading-repo'
codex mcp list
codex --ask-for-approval never "Кратко изложи активные инструкции и перечисли доступных пользовательских агентов. Не изменяй файлы."
```

В интерактивном Codex открой `/hooks`, проверь определения и доверь их только после просмотра файлов.
