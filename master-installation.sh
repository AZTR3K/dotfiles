#!/bin/bash
set -e

# Define the dotfiles root directory
DOTFILES_DIR=$(pwd)

echo "Starting Master Installation..."

# --- 1. System Prerequisites & Scripts ---
echo "Running installation scripts..."
chmod +x "$DOTFILES_DIR/scripts/"*.sh

# Run existing logic scripts
bash "$DOTFILES_DIR/scripts/aur.sh"
bash "$DOTFILES_DIR/scripts/crucial-apps.sh"
bash "$DOTFILES_DIR/scripts/zsh.sh"
bash "$DOTFILES_DIR/scripts/tmux.sh"
bash "$DOTFILES_DIR/scripts/github.sh"

# --- 2. Symlink Configs (~/.config/*) ---
echo "Symlinking .config folders..."
mkdir -p "$HOME/.config"

for conf in "$DOTFILES_DIR/config/"*; do
    [ -e "$conf" ] || continue # skip if directory is empty
    target_name=$(basename "$conf")
    target_path="$HOME/.config/$target_name"

    rm -rf "$target_path"
    ln -sfn "$conf" "$target_path"
    echo "   Linked: ~/.config/$target_name"
done

# --- 3. Symlink Home files (~/.*) ---
echo "Symlinking home hidden files..."

# This glob (.*) catches .tmux.conf and .clang-format
# We exclude . and .. to avoid linking the directory to itself
for item in "$DOTFILES_DIR/home/".*; do
    [ -e "$item" ] || continue
    target_name=$(basename "$item")

    # Skip the current and parent directory pointers
    if [[ "$target_name" == "." || "$target_name" == ".." ]]; then
        continue
    fi

    target_path="$HOME/$target_name"

    rm -rf "$target_path"
    ln -sfn "$item" "$target_path"
    echo "   Linked: ~/$target_name"
done

echo "Setup Complete!"
