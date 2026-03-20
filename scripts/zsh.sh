#!/bin/bash
set -e

# 1. Install Zsh
sudo pacman -S --needed --noconfirm zsh curl git

# 2. Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

# 3. Install P10K and Plugins into OMZ folders
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

echo "Installing plugins and themes..."
[ -d "$ZSH_CUSTOM/themes/powerlevel10k" ] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
[ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] || git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
[ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# 4. Create .zshrc (Same as before)
cat <<EOF > "$HOME/.zshrc"
if [[ -r "\${XDG_CACHE_HOME:-\$HOME/.cache}/p10k-instant-prompt-\${(%):-%n}.zsh" ]]; then
  source "\${XDG_CACHE_HOME:-\$HOME/.cache}/p10k-instant-prompt-\${(%):-%n}.zsh"
fi

export ZSH="\$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source \$ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8a8a8a,bold"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)

bindkey -s '^L' 'clear\n'
:q() { exit }

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
EOF

# 5. Change shell
[ "$SHELL" != "$(which zsh)" ] && sudo chsh -s "$(which zsh)" "$USER"

echo "Done! Restart your terminal."
