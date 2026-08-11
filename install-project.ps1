param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("trading-terminal","music-sequencer","field-lab","tutor-platform","wifi-share","receipt-price-db")]
    [string]$Preset,

    [Parameter(Mandatory=$true)]
    [string]$Target,

    [switch]$Force
)

$ErrorActionPreference = "Stop"
$Kit = Split-Path -Parent $MyInvocation.MyCommand.Path
$Source = Join-Path $Kit "projects\$Preset"
$Target = (Resolve-Path $Target).Path

if (-not (Test-Path (Join-Path $Target ".git"))) {
    Write-Warning "Target does not appear to be a Git repository root: $Target"
}

$Files = Get-ChildItem $Source -Recurse -File
foreach ($File in $Files) {
    $Rel = $File.FullName.Substring($Source.Length).TrimStart([char]'\', [char]'/')
    $Dest = Join-Path $Target $Rel
    $DestDir = Split-Path -Parent $Dest
    New-Item -ItemType Directory -Force $DestDir | Out-Null
    if ((Test-Path $Dest) -and -not $Force) {
        Write-Host "SKIP existing: $Rel" -ForegroundColor Yellow
        continue
    }
    Copy-Item -Force $File.FullName $Dest
    Write-Host "Installed: $Rel" -ForegroundColor Green
}

Write-Host "`nПеред коммитом проверь git diff." -ForegroundColor Cyan
Write-Host "Затем запусти Codex из корня репозитория и попроси кратко изложить активные инструкции, relevant SPEC и текущий AI_STATUS." -ForegroundColor Cyan
