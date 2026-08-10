# AI Dev Team for Codex — multi-project kit

Актуализировано: 2026-08-07.

Этот набор организует одну постоянную ИИ-команду разработчиков для нескольких репозиториев. Он рассчитан на Codex CLI / IDE / desktop workflows с `AGENTS.md`, custom subagents, Skills, Hooks, Rules и MCP.

## Идея

Не копировать 20 одинаковых агентов в каждый проект. Вместо этого:

1. **Глобальное ядро команды** хранится в `~/.codex/agents/`.
2. **Глобальные рабочие процессы** хранятся в `~/.agents/skills/`.
3. Каждый репозиторий имеет свой `AGENTS.md`, `.codex/agents/`, `.agents/skills/` и `docs/AI_*.md`.
4. Глобальные Hooks защищают от опасных команд и подмешивают краткий статус проекта в контекст.
5. Rules задают детерминированную политику для опасных shell-команд.
6. MCP подключаются по принципу минимально нужной поверхности инструментов.

## Активные пресеты

- `trading-terminal` — торговый терминал, бэктест, Monte Carlo, TimescaleDB, Temporal, OpenTelemetry, Rust/WASM.
- `music-sequencer` — секвенсер, Web Audio, AudioWorklet, DSP, Rust/WASM.
- `field-lab` — вычисление/визуализация полей и математические модели.
- `tutor-platform` — сайт/приложение репетитора, доска, WebRTC, Yjs, календарь, PWA/mobile.
- `wifi-share` — локальная передача файлов по Wi‑Fi.
- `receipt-price-db` — OCR чеков, Apache Arrow/Parquet, нормализация товаров, база цен.

## Установка на Windows

### 1. Глобальное ядро

Открой PowerShell в папке набора:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\install-global.ps1
```

Скрипт безопасно устанавливает агентов, skills, hook-скрипты и rules. Он **не перезаписывает существующий `~/.codex/config.toml` автоматически**. Рекомендуемые настройки лежат в:

```text
global/codex/config.windows.recommended.toml
```

Их нужно слить со своим `C:\Users\<YOU>\.codex\config.toml`.

Для hooks скрипт копирует `hooks.json`, только если такого файла ещё нет. Если файл существует, рекомендованный вариант кладётся рядом как `hooks.ai-dev-team.recommended.json`.

### 2. Установить пресет в репозиторий

```powershell
.\install-project.ps1 -Preset trading-terminal -Target 'C:\path\to\repo'
```

Другие значения `-Preset`:

```text
music-sequencer
field-lab
tutor-platform
wifi-share
receipt-price-db
```

По умолчанию существующие файлы не перезаписываются. Для явной замены используй `-Force` после проверки diff/backup.

## Проверка

Из корня репозитория:

```powershell
codex --ask-for-approval never "Summarize the active instructions and list available custom agents."
codex mcp list
```

В интерактивной сессии также проверь:

```text
/agent
/hooks
/skills
/mcp
```

## Как работать

Для обычной задачи:

```text
Исправь ошибку X. Сначала воспроизведи её и найди минимальную причину. Используй субагентов только если параллельная работа реально поможет. После исправления запусти релевантные тесты и reviewer.
```

Для большого этапа:

```text
Реализуй следующий этап из docs/ROADMAP.md. Сначала architect + explorer, затем профильные специалисты. Не давай двум write-agent редактировать одни файлы. После реализации test_engineer + reviewer. Обнови docs/AI_STATUS.md.
```

Или явно вызови skill:

```text
$implement-stage
$resume-project
$fix-bug
$review-change
$explain-change
```

## Важное про расход лимита

Субагенты расходуют отдельные токены. Базовое правило набора:

- маленькая задача: 0–1 субагент;
- средняя межмодульная: 2–3;
- большой этап: 3–5;
- больше 5 одновременно — только когда части действительно независимы.

Цель — не имитировать штат компании, а получать выигрыш от специализации и параллельности.
