#!/bin/sh

echo "Installing/Updating zen-browser..."
paru -S --noconfirm --needed zen-browser-bin
echo "Zen installed successfully."

echo "Installing/Updating ghostty..."
paru -S --noconfirm --needed ghostty
echo "Ghostty installed successfully."

echo "Installing/Updating VS Code..."
paru -S --noconfirm --needed visual-studio-code-bin
echo "VS Code installed successfully."

echo "Installing/Updating Yazi..."
paru -S --noconfirm --needed yazi
echo "Yazi installed successfully."

echo "Installing/Updating cmake..."
paru -S --noconfirm --needed cmake
echo "Cmake installed successfully."
