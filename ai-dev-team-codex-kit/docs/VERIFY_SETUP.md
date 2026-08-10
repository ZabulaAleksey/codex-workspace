# Verification checklist

## Global

```powershell
codex mcp list
codex --ask-for-approval never "Summarize the current global and project instructions."
```

In TUI:

```text
/agent
/hooks
/skills
/mcp
```

## Rules

Example check:

```powershell
codex execpolicy check --pretty --rules "$HOME\.codex\rules\ai-dev-team.rules" -- git push --force origin main
```

Expected: forbidden.

## Hook dry-run

```powershell
'{"cwd":"C:\\path\\to\\repo","hook_event_name":"SessionStart","source":"startup"}' | py -3 "$HOME\.codex\hooks\session_context.py"
```

For a repository with `docs/AI_STATUS.md`, expect JSON containing `additionalContext`.

## Project

```powershell
git status --short
codex --ask-for-approval never "List project custom agents and tell me which one would handle the next roadmap stage. Do not edit files."
```
