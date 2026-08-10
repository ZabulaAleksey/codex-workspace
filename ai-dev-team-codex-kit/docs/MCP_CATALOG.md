# MCP-каталог

## Базовые

### OpenAI Developer Docs

Назначение: актуальная документация OpenAI/Codex/API.

```toml
[mcp_servers.openaiDeveloperDocs]
url = "https://developers.openai.com/mcp"
```

### Context7

Назначение: актуальная документация библиотек и фреймворков.

Windows:

```toml
[mcp_servers.context7]
command = "cmd"
args = ["/c", "npx", "-y", "@upstash/context7-mcp"]
```

### GitHub

Назначение: Issues, PR, Actions и repository metadata сверх обычного `git`/`gh`.

```toml
[mcp_servers.github]
url = "https://api.githubcopilot.com/mcp/"
bearer_token_env_var = "GITHUB_PERSONAL_ACCESS_TOKEN"
default_tools_approval_mode = "prompt"
enabled = false
```

Включать после задания `GITHUB_PERSONAL_ACCESS_TOKEN`. Не давать write-инструменты агентам, которым они не нужны.

## Browser MCP

### Playwright

Для повторяемых end-to-end сценариев, UI QA и браузерной автоматизации.

```toml
[mcp_servers.playwright]
command = "cmd"
args = ["/c", "npx", "-y", "@playwright/mcp@latest"]
```

### Chrome DevTools MCP

Для network/performance/debugging и инспекции браузера.

```toml
[mcp_servers.chrome-devtools]
command = "cmd"
args = ["/c", "npx", "-y", "chrome-devtools-mcp@latest"]
env = { SystemRoot="C:\\Windows", PROGRAMFILES="C:\\Program Files" }
startup_timeout_ms = 20000
```

## Deployment / production — подключать только по необходимости

### Cloudflare API MCP

```toml
[mcp_servers.cloudflare_api]
url = "https://mcp.cloudflare.com/mcp"
enabled = false
```

Включать для проектов, реально развёрнутых на Cloudflare. OAuth/permissions должны быть минимальными.

### Sentry

Подключать только когда проект использует Sentry и нужно разбирать реальные production issues. Не нужен на раннем MVP.

## Что НЕ нужно превращать в MCP без причины

- файловую систему — у Codex уже есть файловые инструменты;
- Docker — shell/CLI обычно проще и прозрачнее;
- PostgreSQL/TimescaleDB с write-доступом — безопаснее миграции/SQL через проектный код и CLI;
- Arrow — это библиотека/формат, документацию берём через Context7;
- Temporal/OpenTelemetry — SDK/CLI/docs, отдельный MCP не обязателен.
