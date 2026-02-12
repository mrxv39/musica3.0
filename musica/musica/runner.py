from __future__ import annotations

from .legacy_worker import run


def run_worker() -> None:
    # Thin orchestrator: delegate to legacy monolith wrapped in run()
    run()
