#!/bin/bash
set -e

# 1. Install tmux
echo "Installing tmux..."
paru -S --noconfirm --needed tmux

# 2. Install TPM (Tmux Plugin Manager)
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ -d "$TPM_DIR" ]; then
  echo "TPM is already installed."
else
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

echo "Setup complete!"
echo "Now enter tmux and press 'Prefix (Ctrl+S) + I' to install the plugins."
