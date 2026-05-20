param(
    [Parameter(Position = 0)]
    [string[]]$SkillNames,

    [string]$TargetDir = (Join-Path $env:USERPROFILE ".cursor\skills")
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$SkillsSrc = Join-Path $RepoRoot "skills"
$SkillsDst = $TargetDir

if (-not (Test-Path $SkillsDst)) {
    New-Item -ItemType Directory -Path $SkillsDst -Force | Out-Null
}

function Install-Skill {
    param([string]$Name)
    $src = Join-Path $SkillsSrc $Name
    $dst = Join-Path $SkillsDst $Name

    if (-not (Test-Path $src)) {
        Write-Error "Skill not found: $Name (expected $src)"
    }
    if (-not (Test-Path (Join-Path $src "SKILL.md"))) {
        Write-Error "Invalid skill (missing SKILL.md): $Name"
    }

    if (Test-Path $dst) {
        Write-Host "Updating $Name -> $dst"
        Remove-Item -Recurse -Force $dst
    } else {
        Write-Host "Installing $Name -> $dst"
    }

    Copy-Item -Recurse $src $dst
}

if ($SkillNames -and $SkillNames.Count -gt 0) {
    foreach ($name in $SkillNames) {
        if ($name -eq "_template") { continue }
        Install-Skill $name
    }
} else {
    Get-ChildItem $SkillsSrc -Directory | ForEach-Object {
        if ($_.Name -eq "_template") { return }
        Install-Skill $_.Name
    }
}

Write-Host "Done. Skills installed to $SkillsDst"
