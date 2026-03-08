#!/bin/bash

# detect if Brewfile has changed
# Brewfile hash: {{ include "Brewfile" | sha256sum }}

# Install packages via Homebrew
brew bundle --file="$HOME/.local/share/chezmoi/Brewfile"

# Enable fzf keybindings and completions
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish

echo "Dotfiles setup complete!"
