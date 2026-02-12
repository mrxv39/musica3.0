# Notas de estabilidad

- El sistema ahora soporta 4 mesas simultáneas.
- Cada worker puede operar en paralelo sin colisiones de click.
- El sistema es estable y verificado en producción.

# Corrección automática de stacks

A veces el sistema puede leer 245 en vez de 24.5 al mostrar los stacks.
Ahora el sistema corrige esto automáticamente.
No tienes que hacer nada, la corrección es interna.
No notarás ningún cambio salvo que los stacks ahora se muestran de forma más precisa.

# Functional Status (Stable Baseline)

The system is currently fully operational. The following detections and features are confirmed working:

- TIME
- NO BOARD
- DEALER
- STACKEFECT
- Card recognition
- Exit condition

# Stable click system v1.0

- Multi-worker click lock implemented
- 4 workers can run simultaneously
- Lock file: runtime\blockclick.txt
- No click collisions
- System verified stable

The next phase will be an internal structural refactor. There will be **no changes to visible behavior** for the user.

------------------------------------------------------------
# Upcoming Stability & Accuracy Improvements
------------------------------------------------------------

The system is currently stable and operational.

The next internal phase will introduce:

- More robust validation of detected cards before actions
- Additional verification before sending clicks to AutoHotkey
- Internal comparison with real hand history XML
- Accuracy statistics engine

These improvements will:

- Increase stability during live play
- Reduce rare OCR misreads
- Provide measurable accuracy metrics

No visible behavioral changes are expected for users.
