param(
  [string]$Src = ".\musica1.py",
  [string]$CoreDir = ".\musica\core"
)

$ErrorActionPreference = "Stop"

# -------------------------
# Targets (function names)
# -------------------------
$targetsCapture = @(
  "capturar_imagen",
  "ejecutar_script_captura_screenshot",
  "ejecutar_script_captura_screenshot_mesa"
)

$targetsTM = @(
  "buscar_imagen_en_area",
  "buscar_imagen_en_area2",
  "encontrar_imagen",
  "encontrar_imagen_con_umbral"
)

$allTargets = @($targetsCapture + $targetsTM)

# -------------------------
# Helpers
# -------------------------
function Get-FunctionBlock {
  param(
    [string[]]$Lines,
    [string]$FuncName
  )

  # Only top-level defs in musica1.py
  $pattern = "^def\s+$FuncName\s*\("
  $start = -1
  for ($i = 0; $i -lt $Lines.Count; $i++) {
    if ($Lines[$i] -match $pattern) { $start = $i; break }
  }
  if ($start -lt 0) { return $null }

  # End at next top-level def OR EOF
  $end = $Lines.Count
  for ($j = $start + 1; $j -lt $Lines.Count; $j++) {
    if ($Lines[$j] -match "^def\s+") {
      $end = $j
      break
    }
  }

  $block = $Lines[$start..($end-1)]
  return [pscustomobject]@{
    Start = $start
    End   = $end
    Block = $block
  }
}

# -------------------------
# Load source
# -------------------------
if (!(Test-Path $Src)) { throw "Source not found: $Src" }
$srcLines = Get-Content $Src -Encoding UTF8

# -------------------------
# Extract blocks
# -------------------------
$blocks = @{}
foreach ($fn in $allTargets) {
  $b = Get-FunctionBlock -Lines $srcLines -FuncName $fn
  if ($null -eq $b) { throw "Function not found in $Src: $fn" }
  $blocks[$fn] = $b
}

# -------------------------
# Prepare output paths
# -------------------------
New-Item -ItemType Directory -Force -Path $CoreDir | Out-Null
$capturePath  = Join-Path $CoreDir "capture.py"
$templatePath = Join-Path $CoreDir "template_match.py"
$apiPath      = Join-Path $CoreDir "detect_api.py"
$initPath     = Join-Path $CoreDir "__init__.py"

# -------------------------
# Write capture.py
# -------------------------
@"
from __future__ import annotations

# Extracted from musica1.py (do not edit manually)

import os
import time
import subprocess

import cv2
import numpy as np
import mss
"@ | Set-Content -Path $capturePath -Encoding UTF8

foreach ($fn in $targetsCapture) {
  "" | Add-Content -Path $capturePath -Encoding UTF8
  $blocks[$fn].Block | Add-Content -Path $capturePath -Encoding UTF8
}

# -------------------------
# Write template_match.py
# -------------------------
@"
from __future__ import annotations

# Extracted from musica1.py (do not edit manually)

import os
import time

import cv2
import numpy as np
"@ | Set-Content -Path $templatePath -Encoding UTF8

foreach ($fn in $targetsTM) {
  "" | Add-Content -Path $templatePath -Encoding UTF8
  $blocks[$fn].Block | Add-Content -Path $templatePath -Encoding UTF8
}

# -------------------------
# Write detect_api.py
# -------------------------
@"
from __future__ import annotations

from .capture import (
    capturar_imagen,
    ejecutar_script_captura_screenshot,
    ejecutar_script_captura_screenshot_mesa,
)

from .template_match import (
    buscar_imagen_en_area,
    buscar_imagen_en_area2,
    encontrar_imagen,
    encontrar_imagen_con_umbral,
)

__all__ = [
    "capturar_imagen",
    "ejecutar_script_captura_screenshot",
    "ejecutar_script_captura_screenshot_mesa",
    "buscar_imagen_en_area",
    "buscar_imagen_en_area2",
    "encontrar_imagen",
    "encontrar_imagen_con_umbral",
]
"@ | Set-Content -Path $apiPath -Encoding UTF8

# Ensure __init__.py exists
if (!(Test-Path $initPath)) {
  "from __future__ import annotations`r`n" | Set-Content -Path $initPath -Encoding UTF8
}

Write-Host "OK: wrote $capturePath"
Write-Host "OK: wrote $templatePath"
Write-Host "OK: wrote $apiPath"
Write-Host "NOTE: musica1.py was NOT modified."
