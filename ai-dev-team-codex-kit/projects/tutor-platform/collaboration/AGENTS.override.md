# Collaboration override
- WebRTC transport and Yjs shared-state semantics are separate concerns.
- Test simultaneous edits, disconnect/reconnect, offline updates and duplicate delivery.
- Large binary assets live outside Yjs documents; sync references/metadata instead.
