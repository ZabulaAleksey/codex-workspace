# Architecture — WiFi Share

```text
Sender/receiver UI
      |
local transfer API/WebSocket
      |
chunk store / filesystem adapter
      |
checksum + resume metadata
```

Trust boundary: every peer, filename and payload is untrusted even on home Wi‑Fi.
