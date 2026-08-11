import json
import sys
from pathlib import Path

MAX_CHARS = 9000
FILES = [
    "docs/AI_STATUS.md",
    "specs/README.md",
    "specs/system.spec.md",
    "docs/AI_PLAN.md",
    "docs/ARCHITECTURE.md",
]


def find_repo_root(start: Path) -> Path:
    p = start.resolve()
    for candidate in [p, *p.parents]:
        if (candidate / ".git").exists():
            return candidate
    return p


def main() -> None:
    payload = json.load(sys.stdin)
    cwd = Path(payload.get("cwd") or ".").expanduser()
    root = find_repo_root(cwd)
    chunks = []
    remaining = MAX_CHARS
    for rel in FILES:
        path = root / rel
        if not path.exists() or not path.is_file():
            continue
        text = path.read_text(encoding="utf-8", errors="replace")
        # Keep status first and cap each file to avoid flooding context.
        part = text[: min(len(text), remaining, 3500)]
        if part.strip():
            chunks.append(f"## {rel}\n{part}")
            remaining -= len(part)
        if remaining <= 0:
            break
    if not chunks:
        return
    event = payload.get("hook_event_name", "SessionStart")
    if event not in {"SessionStart", "SubagentStart"}:
        event = "SessionStart"
    out = {
        "hookSpecificOutput": {
            "hookEventName": event,
            "additionalContext": "Снимок состояния и SDD-контекста проекта (только чтение):\n\n" + "\n\n".join(chunks),
        }
    }
    print(json.dumps(out, ensure_ascii=False))


if __name__ == "__main__":
    main()
