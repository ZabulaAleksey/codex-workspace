# Дизайн

Пользовательского UI в AI Dev Team нет. Канонический интерфейс project-overlay validator — CLI.

## CLI-принципы

- обязательный позиционный путь одного repository;
- краткий human-readable вывод по умолчанию;
- `--json` для машинного чтения без отдельного registry;
- стабильная сортировка issues по коду, пути и сообщению;
- код завершения `0` для success и `1` для validation failure;
- пути в issues относительны target repository, кроме идентификатора самого target.
