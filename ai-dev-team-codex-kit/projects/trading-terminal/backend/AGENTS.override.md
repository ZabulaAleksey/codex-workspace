# Trading backend override
- Python/FastAPI code must keep compute kernels independent from HTTP handlers.
- Temporal Workflows orchestrate; Activities perform I/O, randomness and long compute.
- RabbitMQ is for events/fan-out, not a second durable workflow state machine.
- Database writes triggered by retries must be idempotent.
- Trace context must propagate across service boundaries where supported.
