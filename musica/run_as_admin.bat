@echo off
:: Verifica si el script se está ejecutando como administrador
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo Solicitando permisos de administrador...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~fnx0' -Verb runAs"
    exit /b
)

:: Ejecuta el script de Python
python "C:\Users\Usuario\Desktop\AHK-Studio-master\Projects\musica\kill_old_pythonw_processes.py"
echo Presiona Enter para salir...
pause