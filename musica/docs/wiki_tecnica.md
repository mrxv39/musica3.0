# MUSICA 3.0 — Arquitectura Técnica (Stable)

## Estado Actual

La arquitectura está completamente modularizada y estable:

- Entrypoint limpio (musica1.py)
- Orquestador (runner.py)
- Lógica legacy encapsulada (legacy_worker.py)
- Estado runtime aislado (state.py)

---

## Estructura del Proyecto

musica/
│
├── musica1.py                → Entry point
│
├── musica/
│   ├── runner.py             → Loop principal
│   ├── legacy_worker.py      → Lógica original encapsulada
│   ├── config.py             → Parseo de argumentos CLI
│   ├── state.py              → Estado runtime
│   └── logging_utils.py

---

## Flujo de Ejecución

1. musica1.py
   - Parseo de argumentos
   - Llama a run_worker(config)

2. runner.py
   - Inicializa RuntimeState
   - Ejecuta loop controlado
   - Llama a legacy_worker.ejecutar_busqueda_concurrente()

3. legacy_worker.py
   - Contiene toda la lógica original (detección, OCR, scripts AHK)

---

## Stable click system v1.0

### clicktablas() — Multi-worker lock

- Usa CoordMode Mouse, Screen
- Usa sistema de lock basado en archivo:
    runtime\blockclick.txt
- Espera mientras el archivo lock existe (Sleep 100ms loop)
- Crea archivo lock antes del click
- Ejecuta click principal
- Restaura posición original del mouse
- Realiza click final en posición original
- Elimina archivo lock tras ejecución
- Lock es portable usando A_ScriptDir

### Estado

- 4 workers simultáneos
- Cada worker lanzado manualmente por CLI
- Lock previene colisiones de click
- Sistema verificado con 4 mesas

---

## Normalización OCR de Stacks

El OCR puede omitir puntos decimales en stacks, por ejemplo:

- 245 → 24.5

La normalización se aplica únicamente a:

- p2stack
- p3stack
- stackefect

No se modificaron:

- ROIs
- Lógica OCR
- Orden de detección

El sistema es ahora estable y los valores impresos son consistentes.

---

## Filosofía del Refactor

- No modificar ROIs
- No modificar lógica OCR
- No modificar thresholds
- Solo separar estructura
- Import safety y testabilidad
- Sin efectos colaterales al importar

---

## Estado Runtime

Actualmente el sistema:

- Detecta TIME correctamente
- Detecta NOBOARD correctamente
- Detecta DEALER correctamente
- Detecta STACKEFECT correctamente
- Ejecuta OCR correctamente
- Reconoce cartas correctamente

Pendiente:

- Ajustes de variables globales legacy que dependían del while externo
- Corrección de scope interno en ejecutar_busqueda_concurrente()

------------------------------------------------------------
## Stabilization & Validation Phase (New Critical Phase)
------------------------------------------------------------

### UI Stability Gate

Purpose:
Prevent decision-making on partially rendered UI frames.

Planned behavior:
- Detect hero hole cards before any other logic.
- Validate correct rank + suit format.
- Require two consecutive identical reads for stability.
- Add timeout protection (2–3 seconds).
- Block pipeline until validation succeeds.

---

### AHK Situation Validation Layer

Purpose:
Ensure detected situation matches the one sent to AutoHotkey.

Planned behavior:
- Log detected situation.
- Log situation passed to AHK.
- Add guard clause on mismatch.
- Add debug for invalid transitions.

---

### XML Ground Truth Importer

Purpose:
Compare OCR-detected hands with real XML hand history data.

Planned system:
- Parse XML files.
- Store cards, stacks, bets, timestamps in SQLite.
- Match OCR-detected hands with XML data.
- Build comparison layer.

---

### OCR Statistics Engine

Purpose:
Measure real OCR accuracy.

Planned metrics:
- Hero card error rate
- Opponent stack error rate
- Bet error rate
- Effective stack error rate

Output:
- Console summary
- CSV export

No ROIs, thresholds, or OCR detection logic will be modified in this phase.
