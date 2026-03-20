#!/bin/bash
set -e

EMAIL="ahsan.17april@gmail.com"

echo "Generating a new SSH key for GitHub..."
ssh-keygen -t ed25519 -C "$EMAIL" -f "$HOME/.ssh/id_ed25519" -N ""

echo "Starting the SSH agent..."
eval "$(ssh-agent -s)"

echo "Adding your SSH key to the agent..."
ssh-add "$HOME/.ssh/id_ed25519"

echo "-------------------------------------------------------"
echo "COMPLETED: Your SSH public key is displayed below:"
echo "-------------------------------------------------------"
cat "$HOME/.ssh/id_ed25519.pub"
echo "-------------------------------------------------------"
echo "Copy the entire line above (starting with ssh-ed25519)."
