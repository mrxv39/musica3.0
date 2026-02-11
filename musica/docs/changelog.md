2026-02-11
ANTES: occasional crashes due to NoneType .replace / NameError in preflop loop
AHORA: verifiers accept None/numbers, preflop loop uses explicit p1bet_base param
IMPACTO: worker runs continuously without those crashes
