param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$SkillName,

    [string]$SourceDir = (Join-Path $env:USERPROFILE ".cursor\skills")
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Local = Join-Path $SourceDir $SkillName
$Dest = Join-Path $RepoRoot "skills\$SkillName"

if (-not (Test-Path $Local)) {
    Write-Error "Local skill not found: $Local"
}

if (Test-Path $Dest) {
    Remove-Item -Recurse -Force $Dest
}

Copy-Item -Recurse $Local $Dest
Write-Host "Synced $Local -> $Dest"
Write-Host "Remember to update README.md index and commit."
