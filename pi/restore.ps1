param(
    [string]$TargetRoot = "$HOME",
    [switch]$Force
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$sourcePi = Join-Path $repoRoot "pi"
$targetPi = Join-Path $TargetRoot ".pi"
$sourceAgent = Join-Path $sourcePi "agent"
$targetAgent = Join-Path $targetPi "agent"

if (-not (Test-Path $sourceAgent)) {
    throw "Source pi agent directory not found at $sourceAgent"
}

New-Item -ItemType Directory -Force -Path $targetPi | Out-Null

if ((Test-Path $targetAgent) -and (-not $Force)) {
    throw "Target $targetAgent already exists. Re-run with -Force if you want to overwrite versioned files."
}

if (Test-Path $targetAgent) {
    Remove-Item -Recurse -Force $targetAgent
}

Copy-Item -Recurse -Force $sourceAgent $targetAgent

$settingsExample = Join-Path $targetAgent "settings.json.example"
$settingsPath = Join-Path $targetAgent "settings.json"
if ((Test-Path $settingsExample) -and (-not (Test-Path $settingsPath))) {
    Copy-Item -Force $settingsExample $settingsPath
}

$modelsExample = Join-Path $targetAgent "models.json.example"
$modelsPath = Join-Path $targetAgent "models.json"
if ((Test-Path $modelsExample) -and (-not (Test-Path $modelsPath))) {
    Copy-Item -Force $modelsExample $modelsPath
}

Write-Host "Restore complete." -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Edit $settingsPath and replace placeholder tool paths."
Write-Host "2. Edit $modelsPath and fill in local provider credentials."
Write-Host "3. Keep auth.json local only."
Write-Host "4. Copy workflow skills into project .agents/skills or ~/.pi/agent/skills as needed."
