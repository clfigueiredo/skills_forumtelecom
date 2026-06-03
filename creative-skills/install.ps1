$ErrorActionPreference = "Stop"

$source = Join-Path $PSScriptRoot "skills"
$target = Join-Path $HOME ".codex\skills"

if (-not (Test-Path -LiteralPath $source)) {
    throw "Skills source folder not found: $source"
}

New-Item -ItemType Directory -Force -Path $target | Out-Null

Get-ChildItem -LiteralPath $source -Directory | ForEach-Object {
    $destination = Join-Path $target $_.Name
    if (Test-Path -LiteralPath $destination) {
        Remove-Item -LiteralPath $destination -Recurse -Force
    }
    Copy-Item -LiteralPath $_.FullName -Destination $destination -Recurse
    Write-Host "Installed skill: $($_.Name)"
}

Write-Host "Done. Restart Codex to reload the skills."
