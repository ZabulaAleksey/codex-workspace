# WiFi Share server override
- LAN peers are untrusted.
- No arbitrary filesystem path supplied by a peer may be used directly.
- Bind/listen behavior must be explicit and documented.
- Transfers must be resumable or fail cleanly without corrupt partial files.
