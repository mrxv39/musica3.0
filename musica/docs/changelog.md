2026-02-12 — Stack OCR Normalization

ANTES:
- OCR could return stacks without decimal point (e.g., 245 instead of 24.5).
- Validators could invalidate values.

AHORA:
- Automatic normalization converts large integer stacks to decimal format.
- Printed stack values are now consistent.

IMPACTO:
- More accurate stack display.
- No change to detection logic or ROIs.
## 2026-02-11 — Rollback to Stable + Structural Refactor Decision

  - TIME detected
  - NO BOARD detected
  - DEALER detected
  - STACKEFECT detected
  - OCR working
  - Hand correctly recognized (e.g. 3C8H)
  - Exit condition working as expected

## [v3.0.0] - Refactor estructural completado

### Added
- Separation of entrypoint (musica1.py)
- Orchestrator module (runner.py)
- Encapsulation of original logic in legacy_worker.py
- RuntimeState for tick control
- Import-safe architecture

### Changed
- Removed global infinite loop from monolithic file
- Removed side effects at import time
- Modularized the system

### Fixed
- All tests passing (14/14)

### Pending
- Move inicio = time.time() inside proper function
- Remove legacy global dependencies
- Validate full preflop → AHK execution stability
