# Architecture — Tutor Platform

```text
Next.js UI
  |---- content/API -> backend -> PostgreSQL
  |---- board state -> Yjs document/provider/persistence
  |---- calls ------> WebRTC + signaling (+ TURN where required)
  |---- calendar ---> provider adapter/OAuth
  `---- mobile -----> PWA/service worker/notifications/deep links
```

WebRTC and Yjs are complementary: WebRTC can be a transport; Yjs is the conflict-free shared-state layer.
