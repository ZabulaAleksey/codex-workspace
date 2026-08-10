# Каталог проектов

## Активный основной набор

1. **Trading Terminal** — терминал для исследования/тестирования стратегий, Monte Carlo, оптимизация, MT bridge.
2. **Music Sequencer** — музыкальный секвенсер, DSP, real-time audio.
3. **Field Lab** — вычисление и визуализация математических/электромагнитных полей; потенциально часть образовательной платформы.
4. **Tutor Platform** — сайт/приложение репетитора: материалы, доска, WebRTC, Yjs, календарь, вызовы/уведомления на смартфоне.
5. **WiFi Share** — передача файлов внутри локальной сети.
6. **Receipt Price DB** — OCR чеков, нормализация товаров, история цен.
7. **AI Dev Team** — этот meta-project: общие агенты, skills, hooks, rules, MCP и позже программный оркестратор.

## Ранее обсуждавшиеся кандидаты/спутники — стоит решить, активны ли они

- **Blockchain/Crypto tooling** — исследование блоков, транзакций, кошельков/контрактов, testnet-инструменты.
- **DEYE inverter digital twin** — цифровой двойник PV/аккумулятора/инвертора, Modbus/RS485/Wi‑Fi, MATLAB/Simulink или Python.
- **Dune 2 AI bot** — распознавание состояния игры и управление ботом.
- **Video compiler** — сборка множества клипов, нанесение даты/времени, музыка.
- **Fourier contour / rotating vectors** — можно слить с Field Lab как модуль гармонического анализа.
- **Небольшой finance/revenue React app** — скорее учебный/архивный проект, чем отдельная долгосрочная платформа.
- **Nonogram/image solver** — отдельный учебный CV/алгоритмический проект, если он всё ещё нужен.
- **Low-level/OS experiments** — отдельная учебная ветка для системного программирования.
- **Mathcad MCP** — логичнее считать инфраструктурным интеграционным проектом/плагином, а не самостоятельным продуктом.

## Идеи, которые хорошо дополняют текущую экосистему

### Shared scientific core

Общий Rust/Python пакет для численных вычислений, который смогут использовать Trading Terminal, Field Lab и часть Tutor Platform.

### Personal data platform

Единый локальный слой данных/аналитики для чеков, финансов и других личных датасетов: Arrow + Parquet + DuckDB.

### Shared real-time collaboration core

Пакет Yjs/WebRTC primitives, пригодный Tutor Platform и Music Sequencer.

### Shared observability lab

Один docker-compose набор OpenTelemetry Collector + Grafana/Tempo/Prometheus для практики observability во всех серверных проектах.
