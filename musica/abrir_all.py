# abrir_all.py
import subprocess
import traceback
import os
import time
import sys
from pathlib import Path
from logger_util import get_logger

# Initialize logger
logger = get_logger(__name__)

# Base directory (project root)
BASE_DIR = Path(__file__).resolve().parent

# Ensure logs directory exists (absolute, project-local)
LOG_DIR = BASE_DIR / "logs"
LOG_DIR.mkdir(parents=True, exist_ok=True)


def run_preflight_check() -> bool:
    """
    Run dependency preflight check before starting workers.

    Returns:
        bool: True if all dependencies are present, False otherwise
    """
    preflight_script = BASE_DIR / "scripts" / "preflight_check.py"

    if not preflight_script.exists():
        logger.warning(f"Preflight script not found at {preflight_script}, skipping check")
        return True

    logger.info("Running preflight dependency check...")

    try:
        result = subprocess.run(
            [sys.executable, str(preflight_script)],
            capture_output=True,
            text=True,
            timeout=10
        )

        # Print preflight output for user visibility
        if result.stdout:
            print(result.stdout)
        if result.stderr:
            print(result.stderr, file=sys.stderr)

        if result.returncode != 0:
            logger.error("=" * 60)
            logger.error("PREFLIGHT CHECK FAILED")
            logger.error("=" * 60)
            logger.error("Required dependencies are missing. Workers cannot start.")
            logger.error("Run the preflight check for details: python scripts/preflight_check.py")
            logger.error("=" * 60)
            return False

        logger.info("Preflight check passed - all dependencies present")
        return True

    except subprocess.TimeoutExpired:
        logger.error("Preflight check timed out")
        return False
    except Exception as e:
        logger.error(f"Preflight check failed with error: {e}")
        return False


# Definir las variables base para cada instancia del script
variables1 = {
    'mesa': 2,
    'x1': 520,
    'y1': 807,
    'x2': 1296,
    'y2': 1404,
    'ancho': 776,
    'alto': 597,
    'x1t': 0,
    'y1t': 700,
    'anchot': 500,
    'altot': 700
}

variables2 = {
    'mesa': 1,
    'x1': 520,
    'y1': 210,
    'x2': 1296,
    'y2': 807,
    'ancho': 776,
    'alto': 597,
    'x1t': 0,
    'y1t': 0,
    'anchot': 500,
    'altot': 700
}

variables3 = {
    'mesa': 3,
    'x1': 1296,
    'y1': 210,
    'x2': 2072,
    'y2': 807,
    'ancho': 776,
    'alto': 597,
    'x1t': 2065,
    'y1t': 5,
    'anchot': 500,
    'altot': 700
}

variables4 = {
    'mesa': 4,
    'x1': 1296,
    'y1': 807,
    'x2': 2072,
    'y2': 1404,
    'ancho': 776,
    'alto': 597,
    'x1t': 2065,
    'y1t': 700,
    'anchot': 500,
    'altot': 700
}

# Convertir las variables en argumentos de línea de comando
# (ojo: se respeta el orden de inserción del dict en Python 3.7+)
args1 = [f"{value}" for _, value in variables1.items()]
args2 = [f"{value}" for _, value in variables2.items()]
args3 = [f"{value}" for _, value in variables3.items()]
args4 = [f"{value}" for _, value in variables4.items()]


def run_process(script: str, args: list[str], mesa_id: int):
    """
    Launch a worker process with output redirected to mesa-specific log file.

    IMPORTANT:
      - Uses sys.executable so workers run with the same Python (e.g., 3.10).
      - Uses -u for unbuffered output so logs show errors immediately.
      - Forces cwd to project directory so relative paths work consistently.

    Args:
        script: Path to the Python script to execute (relative to project root or absolute)
        args: List of command-line arguments (strings)
        mesa_id: Mesa/table identifier (1-4)

    Returns:
        tuple: (process object, log file path)
    """
    log_file = LOG_DIR / f"mesa_{mesa_id}.log"

    # Build absolute script path (more robust on Windows)
    script_abs = BASE_DIR / script

    cmd = [sys.executable, "-u", str(script_abs)] + list(args)

    # Ensure log file directory exists
    log_file.parent.mkdir(parents=True, exist_ok=True)

    with open(log_file, "a", encoding="utf-8") as f:
        f.write("\n" + "=" * 80 + "\n")
        f.write(f"START WORKER mesa={mesa_id}\n")
        f.write(f"CMD: {' '.join(cmd)}\n")
        f.write(f"CWD: {BASE_DIR}\n")
        f.write("=" * 80 + "\n")
        f.flush()

        process = subprocess.Popen(
            cmd,
            stdout=f,
            stderr=subprocess.STDOUT,
            cwd=str(BASE_DIR),
            creationflags=subprocess.CREATE_NEW_CONSOLE  # abre consola nueva por proceso
        )
        return process, str(log_file)


def main() -> int:
    # Parse command-line arguments
    skip_preflight = '--no-preflight' in sys.argv

    try:
        logger.info("=== Starting Musica Multi-Table Application ===")

        # Run preflight check unless explicitly skipped
        if not skip_preflight:
            if not run_preflight_check():
                logger.error("Exiting due to missing dependencies")
                return 1
        else:
            logger.warning("Preflight check skipped (--no-preflight flag)")

        logger.info("Launching 4 table monitoring instances")

        # Ejecutar instancias del script de lógica con diferentes variables base
        logger.info("Starting Mesa 2 (process 1)")
        process1, log_file1 = run_process("musica1.py", args1, mesa_id=2)
        logger.info(f"Mesa 2: PID={process1.pid} -> {os.path.abspath(log_file1)}")

        logger.info("Starting Mesa 1 (process 2)")
        process2, log_file2 = run_process("musica1.py", args2, mesa_id=1)
        logger.info(f"Mesa 1: PID={process2.pid} -> {os.path.abspath(log_file2)}")

        logger.info("Starting Mesa 3 (process 3)")
        process3, log_file3 = run_process("musica1.py", args3, mesa_id=3)
        logger.info(f"Mesa 3: PID={process3.pid} -> {os.path.abspath(log_file3)}")

        logger.info("Starting Mesa 4 (process 4)")
        process4, log_file4 = run_process("musica1.py", args4, mesa_id=4)
        logger.info(f"Mesa 4: PID={process4.pid} -> {os.path.abspath(log_file4)}")

        logger.info("All processes started successfully, waiting for completion...")

        failed_workers: list[tuple[str, int]] = []

        # Esperar a que los procesos terminen
        exit_code1 = process1.wait()
        if exit_code1 != 0:
            logger.error(f"Mesa 2 process FAILED with exit code {exit_code1}")
            failed_workers.append(('Mesa 2', exit_code1))
        else:
            logger.info("Mesa 2 process completed")

        exit_code2 = process2.wait()
        if exit_code2 != 0:
            logger.error(f"Mesa 1 process FAILED with exit code {exit_code2}")
            failed_workers.append(('Mesa 1', exit_code2))
        else:
            logger.info("Mesa 1 process completed")

        exit_code3 = process3.wait()
        if exit_code3 != 0:
            logger.error(f"Mesa 3 process FAILED with exit code {exit_code3}")
            failed_workers.append(('Mesa 3', exit_code3))
        else:
            logger.info("Mesa 3 process completed")

        exit_code4 = process4.wait()
        if exit_code4 != 0:
            logger.error(f"Mesa 4 process FAILED with exit code {exit_code4}")
            failed_workers.append(('Mesa 4', exit_code4))
        else:
            logger.info("Mesa 4 process completed")

        if failed_workers:
            logger.error(f"=== {len(failed_workers)} worker(s) FAILED ===")
            for mesa_name, exit_code in failed_workers:
                logger.error(f"  {mesa_name}: exit code {exit_code}")
            return 1

        logger.info("=== All workers finished successfully ===")
        return 0

    except KeyboardInterrupt:
        logger.warning("Interrupted by user")
        return 130
    except Exception:
        logger.error("Unexpected error in abrir_all:")
        logger.error(traceback.format_exc())
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
