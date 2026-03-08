#!/bin/bash

mkdir -p ~/.config/ghostty

PLUGINS_DIR="~/.zsh/plugins"

mkdir -p $PLUGINS_DIR

# Zsh plugins (git clone to ~/.zsh/plugins/)
[ ! -d $PLUGINS_DIR/powerlevel10k ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $PLUGINS_DIR/powerlevel10k
[ ! -d $PLUGINS_DIR/zsh-autosuggestions ] && git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $PLUGINS_DIR/zsh-autosuggestions
[ ! -d $PLUGINS_DIR/zsh-syntax-highlighting ] && git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting $PLUGINS_DIR/zsh-syntax-highlighting

if [ ! -d $PLUGINS_DIR/fzf ]; then
  git clone --depth=1 https://github.com/junegunn/fzf.git $PLUGINS_DIR/fzf
  ~/.zsh/plugins/fzf/install --all --no-update-rc
fi

if [ ! -d $PLUGINS_DIR/lazygit ]; then
  git clone --depth=1 https://github.com/jesseduffield/lazygit.git $PLUGINS_DIR/lazygit
  cd $PLUGINS_DIR/lazygit
  go install
fi

echo "Dotfiles setup complete!"
