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

# --- 2. Symlink Configs (File-by-File Mirroring) ---
echo "Symlinking specific config files..."

# This finds all files inside your dotfiles/config/
# and mirrors their path inside ~/.config/
find "$DOTFILES_DIR/config" -type f | while read -r file; do
    # Get the relative path (e.g., hypr/overrides.conf)
    rel_path=${file#$DOTFILES_DIR/config/}
    target_path="$HOME/.config/$rel_path"

    # Create the parent directory (e.g., ~/.config/hypr) if it doesn't exist
    mkdir -p "$(dirname "$target_path")"

    # Link the file (overwrite if exists, but don't touch other files in folder)
    ln -sfn "$file" "$target_path"
    echo "   Linked: ~/.config/$rel_path"
done

# --- 3. Symlink Home files (~/.*) ---
echo "Symlinking home hidden files..."

for item in "$DOTFILES_DIR/home/".*; do
    [ -e "$item" ] || continue
    target_name=$(basename "$item")

    # Skip . and ..
    if [[ "$target_name" == "." || "$target_name" == ".." ]]; then
        continue
    fi

    target_path="$HOME/$target_name"

    # Link the file directly to Home
    ln -sfn "$item" "$target_path"
    echo "   Linked: ~/$target_name"
done

echo "Setup Complete!"
