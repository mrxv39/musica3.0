from __future__ import annotations

from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "musica1.py"
DST = ROOT / "musica" / "legacy_worker.py"


def main() -> None:
    if not SRC.exists():
        raise SystemExit(f"ERROR: source file not found: {SRC}")

    src_text = SRC.read_text(encoding="utf-8")

    # Build legacy_worker.py with:
    # - same imports and definitions as musica1.py
    # - runtime section wrapped into run()
    # We do NOT change any logic; only indentation/wrapping.
    out_lines: list[str] = []
    out_lines.append("from __future__ import annotations\n")
    out_lines.append("# AUTO-GENERATED FILE. DO NOT EDIT MANUALLY.\n")
    out_lines.append("# Generated from musica1.py to preserve identical behavior.\n")
    out_lines.append("# All runtime execution is wrapped inside run() for import-safety.\n\n")

    # We wrap ALL original content inside run() except we keep it as-is by indentation.
    # This is the safest \"mechanical\" wrap: any existing top-level execution remains,
    # but now only runs when run() is called.
    out_lines.append("def run() -> None:\n")
    for line in src_text.splitlines(True):
        # Preserve empty lines exactly
        if line.strip() == "":
            out_lines.append("    " + line)
        else:
            out_lines.append("    " + line)

    DST.parent.mkdir(parents=True, exist_ok=True)
    DST.write_text("".join(out_lines), encoding="utf-8")
    print(f"OK: wrote {DST}")


if __name__ == "__main__":
    main()
