param(
  [string]$Src = ".\musica1.py",
  [string]$Dst = ".\musica\legacy_worker.py"
)

$ErrorActionPreference = "Stop"

if (!(Test-Path $Src)) { throw "Source not found: $Src" }
$srcText = Get-Content $Src -Raw -Encoding UTF8

# Build a run() wrapper that preserves the monolith exactly (indent only)
$header = @"
from __future__ import annotations

# AUTO-GENERATED. Source: musica1.py
# The whole legacy monolith is wrapped inside run() to avoid import-time side effects.

def run() -> None:
"@

$out = $header + ($srcText -split "`r?`n" | ForEach-Object { "    $_" } | Out-String)

Set-Content -Path $Dst -Value $out -Encoding UTF8
Write-Host "OK: rebuilt $Dst from $Src"
