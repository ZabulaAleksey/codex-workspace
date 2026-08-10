# Receipt data override
- Money uses Decimal/fixed precision, never binary float as the authoritative stored amount.
- Preserve raw OCR + source image identity for auditability.
- Product normalization cannot silently collapse uncertain matches.
- Arrow/Parquet schema changes need compatibility/version notes.
