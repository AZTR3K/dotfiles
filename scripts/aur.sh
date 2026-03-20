#!/bin/bash
set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo "Starting setup..."

# 1. Install prerequisites (git and base-devel are required for building AUR packages)
echo "Ensuring base-devel and git are installed..."
sudo pacman -S --needed --noconfirm git base-devel

# 2. Install yay (if not present)
if command_exists yay; then
    echo "yay is already installed. Skipping..."
else
    echo "Installing yay..."
    rm -rf yay
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
    echo "yay installed successfully."
fi

# 3. Install paru (if not present)
if command_exists paru; then
    echo "paru is already installed. Skipping..."
else
    echo "Installing paru..."
    rm -rf paru
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm
    cd ..
    rm -rf paru
    echo "paru installed successfully."
fi

echo "All done!"
