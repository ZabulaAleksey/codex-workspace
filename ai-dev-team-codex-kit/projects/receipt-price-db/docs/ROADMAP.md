# Roadmap — Receipt Price DB

1. Define domain schema and fixtures from representative receipts.
2. Image preprocessing + replaceable OCR adapter.
3. Parse receipt metadata/items while preserving raw OCR.
4. Apache Arrow typed tables; Decimal money fields.
5. Parquet archive + analytics layer.
6. Product normalization with confidence/manual correction.
7. Price-history database and query API.
8. Excel export: product rows, date columns, raw-data sheet.
9. Batch folder processing, dedupe and error queue.
10. Optional web UI/search/charts and model-assisted normalization.
