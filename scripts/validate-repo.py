#!/usr/bin/env python3
"""Lightweight repository documentation checks.

Run from the repository root:
    python3 scripts/validate-repo.py

The checker looks for obvious empty files, unresolved local Markdown links,
and Markdown image references whose target does not exist.
"""

from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
errors = []

for path in ROOT.rglob("*"):
    if not path.is_file() or ".git" in path.parts:
        continue
    if path.stat().st_size == 0 and path.name != ".gitkeep":
        errors.append(f"empty file: {path.relative_to(ROOT)}")

for md in ROOT.rglob("*.md"):
    if ".git" in md.parts:
        continue
    text = md.read_text(encoding="utf-8", errors="replace")
    for pattern in (r"\[[^\]]+\]\(([^)#]+)\)", r"!\[[^\]]*\]\(([^)#]+)\)"):
        for target in re.findall(pattern, text):
            if target.startswith(("http://", "https://", "mailto:", "#")):
                continue
            target = target.split()[0].strip("<>")
            candidate = (md.parent / target).resolve()
            try:
                candidate.relative_to(ROOT.resolve())
            except ValueError:
                errors.append(f"outside repo: {md.relative_to(ROOT)} -> {target}")
                continue
            if not candidate.exists():
                errors.append(f"missing reference: {md.relative_to(ROOT)} -> {target}")

if errors:
    print("\n".join(errors))
    sys.exit(1)

print("Repository documentation checks passed.")
