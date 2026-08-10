# Trading frontend override
- Do not load full market history into the browser at once.
- Use time-keyed/cursor history loading and preserve visible scroll position.
- Long numeric work belongs in Web Worker/WASM; do not block the React main thread.
- Benchmark rendering/data-transfer changes with realistic candle counts.
