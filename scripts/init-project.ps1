param(
    [Parameter(Mandatory = $true)]
    [string]$TargetPath,

    [Parameter(Mandatory = $true)]
    [string]$ProjectName,

    [switch]$CreatePiSkillsBridge,

    [switch]$ForceSkillsBridge
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$templateRoot = Join-Path $repoRoot "template"

if (-not (Test-Path $templateRoot)) {
    throw "Template directory not found: $templateRoot"
}

if (-not (Test-Path $TargetPath)) {
    New-Item -ItemType Directory -Path $TargetPath | Out-Null
}

Copy-Item -Path (Join-Path $templateRoot "*") -Destination $TargetPath -Recurse -Force

$files = Get-ChildItem -Path $TargetPath -Recurse -File -Force
foreach ($file in $files) {
    $content = Get-Content -Raw $file.FullName
    if ($content -like "*{{PROJECT_NAME}}*") {
        $updated = $content.Replace("{{PROJECT_NAME}}", $ProjectName)
        [System.IO.File]::WriteAllText($file.FullName, $updated, [System.Text.Encoding]::UTF8)
    }
}

if ($CreatePiSkillsBridge) {
    $codexSkillsPath = Join-Path $TargetPath ".codex\skills"
    $agentsDir = Join-Path $TargetPath ".agents"
    $agentsSkillsPath = Join-Path $agentsDir "skills"

    if (-not (Test-Path $codexSkillsPath)) {
        throw "Cannot create pi skills bridge because .codex\skills was not found at: $codexSkillsPath"
    }

    if (-not (Test-Path $agentsDir)) {
        New-Item -ItemType Directory -Path $agentsDir | Out-Null
    }

    if (Test-Path $agentsSkillsPath) {
        $existing = Get-Item $agentsSkillsPath -Force
        if ($existing.LinkType -eq "Junction" -or $existing.LinkType -eq "SymbolicLink") {
            if ($ForceSkillsBridge) {
                Remove-Item -Force $agentsSkillsPath
            } else {
                Write-Host "Skills bridge already exists: $agentsSkillsPath"
                Write-Host "Use -ForceSkillsBridge to replace it."
            }
        } elseif ($ForceSkillsBridge) {
            Remove-Item -Recurse -Force $agentsSkillsPath
        } else {
            Write-Host "Skipping bridge creation because $agentsSkillsPath already exists and is not a link."
            Write-Host "Use -ForceSkillsBridge to replace it."
        }
    }

    if (-not (Test-Path $agentsSkillsPath)) {
        New-Item -ItemType Junction -Path $agentsSkillsPath -Target $codexSkillsPath | Out-Null
        Write-Host "Created pi skills bridge: $agentsSkillsPath -> $codexSkillsPath"
    }
}

Write-Host "Initialized AI project workflow template into: $TargetPath"
Write-Host "Project name placeholder replaced with: $ProjectName"
Write-Host "Next recommended steps:"
Write-Host "1. Fill AGENTS.md with project-specific rules"
Write-Host "2. Refine README.md and docs/"
Write-Host "3. Add project-local skills in .codex/skills/"
if ($CreatePiSkillsBridge) {
    Write-Host "4. pi skills bridge is enabled through .agents/skills"
} else {
    Write-Host "4. If pi should use .codex/skills, rerun with -CreatePiSkillsBridge or create the bridge manually"
}
