# Architecture — Receipt Price DB

```text
Photos
 -> preprocessing
 -> OCR adapter
 -> receipt parser
 -> normalization
 -> Arrow Table
      |-> Parquet archive
      |-> DB / DuckDB analytics
      `-> Excel export
```

Arrow is the typed in-memory/interchange layer, not the OCR engine or the final UI database. Raw OCR/source-image provenance must remain available.
