# Architecture — Music Sequencer

```text
React UI / timeline
      |
project state + scheduler
      |
Web Audio graph -> AudioWorklet -> Rust/WASM DSP
      |
optional Yjs collaboration (state only; large audio assets stored separately)
```

Real-time audio thread must not depend on network, database or blocking filesystem calls.
