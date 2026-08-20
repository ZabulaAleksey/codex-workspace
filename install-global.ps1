param(
    [Alias("Force")]
    [switch]$SyncManaged
)

$ErrorActionPreference = "Stop"
$Kit = Split-Path -Parent $MyInvocation.MyCommand.Path
$CodexHome = Join-Path $HOME ".codex"
$SkillHome = Join-Path $HOME ".agents\skills"

New-Item -ItemType Directory -Force (Join-Path $CodexHome "agents") | Out-Null
New-Item -ItemType Directory -Force (Join-Path $CodexHome "hooks") | Out-Null
New-Item -ItemType Directory -Force (Join-Path $CodexHome "rules") | Out-Null
New-Item -ItemType Directory -Force $SkillHome | Out-Null

function Copy-IfMissing($Source, $Destination) {
    if (Test-Path $Destination) {
        Write-Host "SKIP existing: $Destination" -ForegroundColor Yellow
        return
    }
    Copy-Item -Recurse -Force $Source $Destination
    Write-Host "Installed: $Destination" -ForegroundColor Green
}

function Sync-ManagedFile($Source, $Destination) {
    if (-not (Test-Path $Destination)) {
        Copy-Item -Force $Source $Destination
        Write-Host "Installed managed file: $Destination" -ForegroundColor Green
        return
    }
    if ((Get-FileHash $Source).Hash -eq (Get-FileHash $Destination).Hash) {
        Write-Host "Current managed file: $Destination" -ForegroundColor Green
        return
    }
    if (-not $SyncManaged) {
        Write-Host "DRIFT managed file: $Destination (rerun with -SyncManaged after review)" -ForegroundColor Yellow
        return
    }
    Copy-Item -Force $Source $Destination
    Write-Host "Synchronized managed file: $Destination" -ForegroundColor Green
}

Get-ChildItem (Join-Path $Kit "global\codex\agents\*.toml") | ForEach-Object {
    Sync-ManagedFile $_.FullName (Join-Path $CodexHome "agents\$($_.Name)")
}
Get-ChildItem (Join-Path $Kit "global\codex\hooks\*.py") | ForEach-Object {
    Sync-ManagedFile $_.FullName (Join-Path $CodexHome "hooks\$($_.Name)")
}
Sync-ManagedFile (Join-Path $Kit "global\codex\rules\ai-dev-team.rules") (Join-Path $CodexHome "rules\ai-dev-team.rules")

Get-ChildItem (Join-Path $Kit "global\skills") -Directory | ForEach-Object {
    Copy-IfMissing $_.FullName (Join-Path $SkillHome $_.Name)
}

$AgentsDest = Join-Path $CodexHome "AGENTS.md"
$AgentsSource = Join-Path $Kit "global\codex\AGENTS.md"
if (-not (Test-Path $AgentsDest)) {
    Copy-Item -Force $AgentsSource $AgentsDest
    Write-Host "Installed: $AgentsDest" -ForegroundColor Green
} elseif ((Get-FileHash $AgentsSource).Hash -eq (Get-FileHash $AgentsDest).Hash) {
    Write-Host "Current: $AgentsDest" -ForegroundColor Green
} elseif ($SyncManaged) {
    Copy-Item -Force $AgentsSource $AgentsDest
    Write-Host "Synchronized reviewed AGENTS.md: $AgentsDest" -ForegroundColor Green
} else {
    Copy-Item -Force $AgentsSource (Join-Path $CodexHome "AGENTS.ai-dev-team.recommended.md")
    Write-Host "Existing AGENTS.md preserved. Merge AGENTS.ai-dev-team.recommended.md manually." -ForegroundColor Cyan
}

$HooksDest = Join-Path $CodexHome "hooks.json"
if (-not (Test-Path $HooksDest)) {
    Copy-Item -Force (Join-Path $Kit "global\codex\hooks.json") $HooksDest
    Write-Host "Installed: $HooksDest" -ForegroundColor Green
} elseif ((Get-FileHash (Join-Path $Kit "global\codex\hooks.json")).Hash -eq (Get-FileHash $HooksDest).Hash) {
    Write-Host "Current: $HooksDest" -ForegroundColor Green
} elseif ($SyncManaged) {
    Copy-Item -Force (Join-Path $Kit "global\codex\hooks.json") $HooksDest
    Write-Host "Synchronized reviewed hooks.json: $HooksDest" -ForegroundColor Green
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
Write-Host "2) Run: py -3 tools\validate_global_codex.py"
Write-Host "3) Start Codex and run /hooks; trust reviewed hook definitions."
Write-Host "4) Enable optional MCP only after selecting one canonical integration route."
