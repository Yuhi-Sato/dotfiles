#!/bin/bash
# Dotfiles install script for Dev Containers and new machines.
# VS Code Dev Containers clones the dotfiles repo to ~/dotfiles and runs this script.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CHEZMOI_BIN="$HOME/.local/bin/chezmoi"

if ! command -v chezmoi &>/dev/null && [ ! -x "$CHEZMOI_BIN" ]; then
  mkdir -p "$HOME/.local/bin"
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
fi

CHEZMOI="$CHEZMOI_BIN"
if command -v chezmoi &>/dev/null; then
  CHEZMOI="$(command -v chezmoi)"
fi

"$CHEZMOI" init --apply --source="$SCRIPT_DIR"
