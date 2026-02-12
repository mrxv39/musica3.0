# Notas de estabilidad

- Se ha mejorado la estabilidad para evitar caídas ocasionales durante los bucles de reconocimiento.
- No se requieren cambios por parte del usuario.

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

The next phase will be an internal structural refactor. There will be **no changes to visible behavior** for the user.
