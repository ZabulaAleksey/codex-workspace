# Web Audio

- Не блокируй audio render thread.
- Избегай выделения памяти и логирования в realtime-пути.
- Определи sample rate, buffer size и допустимую latency.
- Проверяй запуск после пользовательского жеста и suspended context.
- DSP сравнивай с эталоном и числовыми допусками.
