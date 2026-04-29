param()

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$sourceRoot = Join-Path $repoRoot "skills"
$targetRoot = Join-Path $repoRoot "template\.codex\skills"

$skillNames = @(
    "workflow-grill-with-docs",
    "workflow-plan-acceptance",
    "workflow-implement",
    "workflow-review-md",
    "workflow-diagnose"
)

if (-not (Test-Path $sourceRoot)) {
    throw "Source skills directory not found: $sourceRoot"
}

if (-not (Test-Path $targetRoot)) {
    throw "Target template skills directory not found: $targetRoot"
}

foreach ($skillName in $skillNames) {
    $sourceSkill = Join-Path $sourceRoot $skillName
    $targetSkill = Join-Path $targetRoot $skillName

    if (-not (Test-Path $sourceSkill)) {
        throw "Missing source skill: $sourceSkill"
    }

    if (Test-Path $targetSkill) {
        Remove-Item -Recurse -Force $targetSkill
    }

    Copy-Item -Recurse -Force $sourceSkill $targetSkill
    Write-Host "Synced $skillName"
}

Write-Host "Template workflow skills are now synced from root skills/."
