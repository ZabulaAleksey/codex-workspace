# Текущее состояние AI Dev Team

Дата: 2026-08-20

## Статус

Нормализация canonical/installed глобального слоя Codex реализована, локально проверена и одобрена финальными read-only reviewer/security проверками. Интерактивные действия после restart вынесены отдельно.

## Реализовано

- единый канон managed AGENTS, 13 agents, hooks и rules в `global/codex`;
- explicit model pins: architect/security — Sol, test engineer — Luna medium;
- безопасный `install-global.ps1 -SyncManaged` без перезаписи active config;
- `tools/normalize_user_codex.py` с atomic apply и secret-safe output;
- `tools/validate_global_codex.py` для installed hashes и config invariants;
- Windows UTF-8 hook output, containment fixed docs внутри Git-root и bounded reads;
- destructive probes для `git.exe -C`, PowerShell root deletion и `rm -fr /`;
- Context7 без inline key и с pin `4.0.2`; Chrome DevTools MCP pin `1.7.0`;
- GitHub static MCP и Atlassian отключены; Google Calendar/Slack inert blocks выключены;
- broad/non-project trust удалён, три project paths исправлены;
- missing browser service и unmatched client hash удалены без изменения `sky` binding;
- spawned shell policy переведена в fail-closed режим для `KEY`/`SECRET`/`TOKEN`.

## Verification evidence

- `py -3 -m unittest tools.test_validate_global_codex tools.test_validate_project_overlay -v` — PASS, один platform skip symlink creation и отдельный containment test PASS;
- `py -3 tools/validate_context.py` — PASS;
- `py -3 tools/validate_global_codex.py --codex-home C:\\Users\\aleks\\.codex` — PASS;
- повторный normalizer check — PASS;
- active SessionStart cp1251 probe и destructive guard probes — PASS;
- TOML/JSON/Python и PowerShell syntax — PASS.

## Оставшиеся внешние действия

- провайдер: revoke/rotate ранее использованный Context7 credential;
- GitHub: изменить app-specific `Allow all actions` на выбранный владельцем `inherit` или `ask_before_writes`;
- UI/restart: review и trust новых hook hashes через `/hooks`, затем smoke-test Browser/Context7/GitHub;
- project policy: решить, создавать ли реальный repository для пустого `dune-rts`, и отдельно bootstrap неполного `monte-carlo` overlay.

## Следующее действие

Перезапустить Codex, доверить новые hook hashes через `/hooks` и выполнить перечисленные smoke-tests. Merge рабочей ветки выполняется только по отдельному разрешению пользователя.
