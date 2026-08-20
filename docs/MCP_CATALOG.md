# Каталог MCP

## Базовые MCP

### Документация разработчика OpenAI

Назначение: актуальная документация OpenAI, Codex и API.

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
args = ["/c", "npx", "-y", "@upstash/context7-mcp@4.0.2"]
```

Версия фиксируется после локальной проверки и обновляется отдельным reviewed изменением. Inline API key в `args` запрещён; базовый сервер работает без него.

### GitHub plugin — основной маршрут

Назначение: задачи, PR, Actions и метаданные репозитория сверх возможностей обычных `git` и `gh`.

Подключённый GitHub plugin является каноническим маршрутом. Его write permissions настраиваются штатным менеджером плагинов. Одновременная активация plugin и static MCP запрещена.

### GitHub static MCP — выключенный fallback

```toml
[mcp_servers.github]
url = "https://api.githubcopilot.com/mcp/"
bearer_token_env_var = "GITHUB_PERSONAL_ACCESS_TOKEN"
default_tools_approval_mode = "prompt"
enabled = false
```

Включать только после явного выбора static MCP вместо plugin и задания `GITHUB_PERSONAL_ACCESS_TOKEN`. Не предоставлять инструменты с правом записи агентам, которым они не нужны.

### Atlassian

Standalone remote MCP хранится выключенным до подтверждённого назначения, authentication и smoke-test. При появлении Atlassian plugin выбирается один маршрут, а не две параллельные write-поверхности.

## Браузерные MCP

### Playwright

Для повторяемых сквозных сценариев, проверки качества интерфейса и браузерной автоматизации.

```toml
[mcp_servers.playwright]
command = "cmd"
args = ["/c", "npx", "-y", "@playwright/mcp@latest"]
```

### MCP Chrome DevTools

Для диагностики сети и производительности, отладки и исследования браузера.

```toml
[mcp_servers.chrome-devtools]
command = "cmd"
args = ["/c", "npx", "-y", "chrome-devtools-mcp@1.7.0"]
startup_timeout_ms = 20000
```

В активной Windows-конфигурации используется локально проверенная точная версия `chrome-devtools-mcp@1.7.0`; `@latest` в production-like пользовательском слое не используется.

## Развёртывание и production — подключать только по необходимости

### MCP API Cloudflare

```toml
[mcp_servers.cloudflare_api]
url = "https://mcp.cloudflare.com/mcp"
enabled = false
```

Включать для проектов, действительно развёрнутых в Cloudflare. Области OAuth и разрешения должны быть минимальными.

### Sentry

Подключать только тогда, когда проект использует Sentry и нужно разбирать реальные проблемы production. На раннем этапе MVP не требуется.

## Что не нужно превращать в MCP без причины

- файловую систему — у Codex уже есть файловые инструменты;
- Docker — shell и CLI обычно проще и прозрачнее;
- PostgreSQL/TimescaleDB с правом записи — безопаснее выполнять миграции и SQL через проектный код и CLI;
- Arrow — это библиотека и формат, документацию следует получать через Context7;
- Temporal/OpenTelemetry — доступны SDK, CLI и документация, отдельный MCP необязателен.
