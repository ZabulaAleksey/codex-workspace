# Quick start (Windows)

```powershell
# 1) Распаковать kit и открыть PowerShell в его папке
Set-ExecutionPolicy -Scope Process Bypass

# 2) Установить глобальное ядро
.\install-global.ps1

# 3) Слить предложенный config с уже существующим, если он был
notepad "$HOME\.codex\config.ai-dev-team.recommended.toml"
notepad "$HOME\.codex\config.toml"

# 4) Установить один project preset
.\install-project.ps1 -Preset trading-terminal -Target 'C:\path\to\trading-repo'

# 5) Проверить из репозитория
cd 'C:\path\to\trading-repo'
codex mcp list
codex --ask-for-approval never "Summarize active instructions and available custom agents. Do not edit files."
```

В интерактивном Codex открой `/hooks`, проверь определения и доверь их только после просмотра файлов.
