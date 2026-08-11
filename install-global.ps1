param(
    [switch]$Force
)

$ErrorActionPreference = "Stop"
$Kit = Split-Path -Parent $MyInvocation.MyCommand.Path
$CodexHome = Join-Path $HOME ".codex"
$SkillHome = Join-Path $HOME ".agents\skills"

New-Item -ItemType Directory -Force (Join-Path $CodexHome "agents") | Out-Null
New-Item -ItemType Directory -Force (Join-Path $CodexHome "hooks") | Out-Null
New-Item -ItemType Directory -Force (Join-Path $CodexHome "rules") | Out-Null
New-Item -ItemType Directory -Force $SkillHome | Out-Null

function Copy-Safe($Source, $Destination) {
    if ((Test-Path $Destination) -and -not $Force) {
        Write-Host "SKIP existing: $Destination" -ForegroundColor Yellow
        return
    }
    Copy-Item -Recurse -Force $Source $Destination
    Write-Host "Installed: $Destination" -ForegroundColor Green
}

Get-ChildItem (Join-Path $Kit "global\codex\agents\*.toml") | ForEach-Object {
    Copy-Safe $_.FullName (Join-Path $CodexHome "agents\$($_.Name)")
}
Get-ChildItem (Join-Path $Kit "global\codex\hooks\*.py") | ForEach-Object {
    Copy-Safe $_.FullName (Join-Path $CodexHome "hooks\$($_.Name)")
}
Copy-Safe (Join-Path $Kit "global\codex\rules\ai-dev-team.rules") (Join-Path $CodexHome "rules\ai-dev-team.rules")

Get-ChildItem (Join-Path $Kit "global\skills") -Directory | ForEach-Object {
    Copy-Safe $_.FullName (Join-Path $SkillHome $_.Name)
}

$AgentsDest = Join-Path $CodexHome "AGENTS.md"
$AgentsSource = Join-Path $Kit "global\codex\AGENTS.md"
if (-not (Test-Path $AgentsDest) -or $Force) {
    Copy-Safe $AgentsSource $AgentsDest
} elseif ((Get-FileHash $AgentsSource).Hash -eq (Get-FileHash $AgentsDest).Hash) {
    Write-Host "Current: $AgentsDest" -ForegroundColor Green
} else {
    Copy-Item -Force $AgentsSource (Join-Path $CodexHome "AGENTS.ai-dev-team.recommended.md")
    Write-Host "Existing AGENTS.md preserved. Merge AGENTS.ai-dev-team.recommended.md manually." -ForegroundColor Cyan
}

$HooksDest = Join-Path $CodexHome "hooks.json"
if (-not (Test-Path $HooksDest) -or $Force) {
    Copy-Safe (Join-Path $Kit "global\codex\hooks.json") $HooksDest
} else {
    Copy-Item -Force (Join-Path $Kit "global\codex\hooks.json") (Join-Path $CodexHome "hooks.ai-dev-team.recommended.json")
    Write-Host "Existing hooks.json preserved. Merge hooks.ai-dev-team.recommended.json manually." -ForegroundColor Cyan
}

$ConfigDest = Join-Path $CodexHome "config.toml"
$ConfigRec = Join-Path $CodexHome "config.ai-dev-team.recommended.toml"
Copy-Item -Force (Join-Path $Kit "global\codex\config.windows.recommended.toml") $ConfigRec
if (-not (Test-Path $ConfigDest)) {
    Copy-Item -Force $ConfigRec $ConfigDest
    Write-Host "Created new config.toml from recommended config." -ForegroundColor Green
} else {
    Write-Host "Existing config.toml preserved. Merge: $ConfigRec" -ForegroundColor Cyan
}

Write-Host "\nNext:" -ForegroundColor White
Write-Host "1) Merge config.ai-dev-team.recommended.toml if config.toml already existed."
Write-Host "2) Start Codex and run /hooks; trust reviewed hook definitions."
Write-Host "3) Run codex mcp list and enable GitHub only after setting GITHUB_PERSONAL_ACCESS_TOKEN."
