import json
import re
import sys

# Intentionally small deny-list. Broad safety policy belongs in Codex permissions/rules,
# not in brittle regexes.
DENY = [
    (r"\bgit\s+reset\s+--hard\b", "git reset --hard can destroy uncommitted work."),
    (r"\bgit\s+clean\s+-[^\s]*f", "git clean -f can irreversibly remove untracked files."),
    (r"\bgit\s+push\b[^\n]*\s(--force|-f)(\s|$)", "Force-push is blocked by the global AI team hook."),
    (r"\bdocker\s+system\s+prune\b", "docker system prune can remove unrelated local resources."),
    (r"\bDROP\s+DATABASE\b", "DROP DATABASE requires explicit human execution."),
    (r"\bRemove-Item\b[^\n]*-Recurse[^\n]*-Force[^\n]*(?:[A-Za-z]:\\|/)(?:\s|$)", "Recursive force deletion at a drive/root-like path is blocked."),
    (r"\brm\s+-rf\s+/(?:\s|$|\*)", "Recursive deletion of filesystem root is blocked."),
]


def main() -> None:
    payload = json.load(sys.stdin)
    tool_input = payload.get("tool_input") or {}
    command = tool_input.get("command") if isinstance(tool_input, dict) else ""
    if not isinstance(command, str):
        return
    for pattern, reason in DENY:
        if re.search(pattern, command, flags=re.IGNORECASE):
            print(json.dumps({
                "hookSpecificOutput": {
                    "hookEventName": "PreToolUse",
                    "permissionDecision": "deny",
                    "permissionDecisionReason": reason + " Use a non-destructive alternative or ask the user for explicit manual action."
                }
            }))
            return


if __name__ == "__main__":
    main()
