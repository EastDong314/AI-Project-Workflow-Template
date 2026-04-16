param(
    [string]$ProjectPath = (Get-Location).Path,
    [switch]$Force
)

$ErrorActionPreference = "Stop"

$codexSkillsPath = Join-Path $ProjectPath ".codex\skills"
$agentsDir = Join-Path $ProjectPath ".agents"
$agentsSkillsPath = Join-Path $agentsDir "skills"

if (-not (Test-Path $codexSkillsPath)) {
    throw ".codex\skills not found at: $codexSkillsPath"
}

if (-not (Test-Path $agentsDir)) {
    New-Item -ItemType Directory -Path $agentsDir | Out-Null
}

if (Test-Path $agentsSkillsPath) {
    $existing = Get-Item $agentsSkillsPath -Force
    if (($existing.LinkType -eq "Junction" -or $existing.LinkType -eq "SymbolicLink") -and -not $Force) {
        Write-Host "Skills bridge already exists: $agentsSkillsPath"
        exit 0
    }

    if (-not $Force) {
        throw "$agentsSkillsPath already exists. Rerun with -Force to replace it."
    }

    if ($existing.LinkType -eq "Junction" -or $existing.LinkType -eq "SymbolicLink") {
        Remove-Item -Force $agentsSkillsPath
    } else {
        Remove-Item -Recurse -Force $agentsSkillsPath
    }
}

New-Item -ItemType Junction -Path $agentsSkillsPath -Target $codexSkillsPath | Out-Null
Write-Host "Created pi skills bridge: $agentsSkillsPath -> $codexSkillsPath"
