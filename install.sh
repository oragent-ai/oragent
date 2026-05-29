#!/usr/bin/env sh
#
# Oragent installer — https://oragent.org
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/oragent-ai/oragent/main/install.sh | sh
#
# What this does:
#   1. Verifies Python ≥ 3.11 is present.
#   2. Warns if tmux is missing (required at runtime).
#   3. Uninstalls the legacy 'claude-code-terminal' package if found
#      (the pre-rename PyPI name); session storage migrates automatically
#      on first launch of the new package.
#   4. Installs 'oragent' via pipx (preferred) or pip --user.
#   5. Verifies the 'oragent' command is reachable.
#
# Environment overrides:
#   PIPX, PIP, PYTHON — point at non-default binaries.

set -eu

PIPX_BIN="${PIPX:-pipx}"
PIP_BIN="${PIP:-pip3}"
PYTHON_BIN="${PYTHON:-python3}"
OLD_PKG="claude-code-terminal"
NEW_PKG="oragent"

printf '\n▶ Oragent installer\n  https://oragent.org\n\n'

# ── Python ≥ 3.11 ────────────────────────────────────────────────────────
if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
    printf '✗ Python 3 not found on PATH. Install Python ≥ 3.11 first.\n'
    printf '  macOS:  brew install python@3.13\n'
    printf '  Linux:  use your distro package manager or pyenv.\n'
    exit 1
fi
PY_VER=$("$PYTHON_BIN" -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
PY_MAJOR=${PY_VER%.*}
PY_MINOR=${PY_VER#*.}
if [ "$PY_MAJOR" -lt 3 ] || { [ "$PY_MAJOR" -eq 3 ] && [ "$PY_MINOR" -lt 11 ]; }; then
    printf '✗ Python %s detected; Oragent requires ≥ 3.11.\n' "$PY_VER"
    exit 1
fi
printf '✓ Python %s\n' "$PY_VER"

# ── tmux (runtime dep, not install-time) ─────────────────────────────────
if ! command -v tmux >/dev/null 2>&1; then
    printf '⚠  tmux not found on PATH. Oragent uses tmux at runtime.\n'
    printf '   macOS:  brew install tmux\n'
    printf '   Linux:  apt install tmux  (or your distro equivalent)\n'
    printf '   Install will continue; install tmux before running oragent.\n'
else
    printf '✓ tmux present\n'
fi

# ── Migrate from legacy claude-code-terminal ─────────────────────────────
migrated=0
if command -v "$PIPX_BIN" >/dev/null 2>&1; then
    if "$PIPX_BIN" list 2>/dev/null | grep -q "$OLD_PKG"; then
        printf '▶ Removing legacy %s (pipx)…\n' "$OLD_PKG"
        "$PIPX_BIN" uninstall "$OLD_PKG"
        migrated=1
    fi
fi
if [ "$migrated" -eq 0 ] && "$PIP_BIN" show "$OLD_PKG" >/dev/null 2>&1; then
    printf '▶ Removing legacy %s (pip)…\n' "$OLD_PKG"
    "$PIP_BIN" uninstall -y "$OLD_PKG"
fi

# ── Install oragent ──────────────────────────────────────────────────────
if command -v "$PIPX_BIN" >/dev/null 2>&1; then
    printf '▶ Installing %s via pipx…\n' "$NEW_PKG"
    "$PIPX_BIN" install --force "$NEW_PKG"
else
    printf '⚠  pipx not found. Falling back to pip --user.\n'
    printf '   Recommended: install pipx and re-run this script.\n'
    "$PIP_BIN" install --user --upgrade "$NEW_PKG"
fi

# ── Verify ───────────────────────────────────────────────────────────────
printf '\n'
if command -v oragent >/dev/null 2>&1; then
    INSTALLED_VER=$(oragent --version 2>/dev/null || printf '(version unknown)')
    printf '✓ %s\n' "$INSTALLED_VER"
    printf '\n▶ Next:  run  oragent  to launch the supervisor.\n'
    printf '         docs:  https://oragent.org\n'
else
    printf '⚠ Installed, but `oragent` is not on PATH yet.\n'
    if command -v "$PIPX_BIN" >/dev/null 2>&1; then
        printf '  Fix:  %s ensurepath  →  reopen your shell.\n' "$PIPX_BIN"
    else
        printf '  Fix:  add ~/.local/bin to your PATH and reopen your shell.\n'
    fi
fi
