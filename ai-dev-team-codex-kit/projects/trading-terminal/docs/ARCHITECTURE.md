# Architecture — Trading Terminal

```text
MT terminal/MQL -> ingestion API -> TimescaleDB
                         |
                         +-> RabbitMQ -> event consumers

Next.js <-> FastAPI -> Temporal -> backtest/Monte Carlo/optimization activities
   |                          |
   +-> Web Worker -> Rust/WASM preview

All services -> OTLP -> OpenTelemetry Collector -> observability backend
```

Principles:
- TimescaleDB is for time-series market data; regular PostgreSQL for metadata/entities.
- RabbitMQ transports events/fan-out; Temporal owns long-lived workflow state.
- Python is the correctness/reference compute path; WASM is interactive browser compute; GPU engines are later optional accelerators.
- Heavy arrays/artifacts belong in Arrow/Parquet rather than giant JSON payloads.
