# Dotfiles & System Setup

This repository contains my personal configurations (Hyprland, Neovim, Tmux, Zsh, etc.) and automation scripts to set up a fresh Arch Linux environment from scratch.

## Quick Start

To get everything installed—including AUR helpers, essential apps, SSH keys, and all configurations—run the following commands:

```bash
# 1. Clone the repository to your home folder
git clone https://github.com/AZTR3K/dotfiles.git

# 2. Enter the directory
cd ~/dotfiles

# 3. Make the master script executable
chmod +x master-installation.sh

# 4. Run the installation
./master-installation.sh
```

---

## What the Master Script Does

The `master-installation.sh` handles the heavy lifting in this order:

1.  **System Setup:** Installs `yay`, `paru`, and base development tools.
2.  **Apps:** Installs core software (Zen Browser, Ghostty, VS Code, Yazi, etc.).
3.  **Shell & Tools:** Sets up Oh My Zsh, Powerlevel10k, and Tmux Plugin Manager.
4.  **Security:** Generates a new SSH key for GitHub.
5.  **Symlinking:** Automatically maps everything in `/config` to `~/.config/` and everything in `/home` to `~/`.

---

## Repository Structure

- **`config/`**: Directory-based configs (e.g., `~/.config/nvim`, `~/.config/hypr`).
- **`home/`**: Individual dotfiles (e.g., `~/.tmux.conf`, `~/.clang-format`).
- **`scripts/`**: Modular logic for specific installation tasks.

---

## Key Bindings Summary

| Tool | Action | Binding |
| :--- | :--- | :--- |
| **Tmux** | Leader Key | `Ctrl-s` |
| **Tmux** | Reload Config | `Prefix + r` |
| **Yazi** | Toggle Hidden Files | `z` then `h` |
| **Hyprland** | Terminal (Ghostty) | `SUPER + ENTER` |
| **Hyprland** | Zen Browser | `SUPER + z` |
