# Audio path override
- Treat the real-time audio render path as allocation/blocking-I/O sensitive.
- UI, network and filesystem operations must not execute on the audio render path.
- Any DSP optimization requires an audible/numerical correctness regression test and latency benchmark.
