# Stabilization (OCR → verifiers)

- Verifier functions (e.g., verificar_stackefectivo, verificar_stack) are now hardened to accept None, int, and float values, preventing .replace crashes on non-string input.
- The condiciones_salida_preflop function now receives p1bet_base as an explicit parameter, avoiding NameError issues in the preflop loop.
- No changes were made to ROI or detection logic; only stability improvements.
