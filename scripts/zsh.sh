#!/usr/bin/env bash

# Install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null
sudo chsh -s $(which zsh) gitpod

current_dir=~/.dotfiles/scripts/zsh.sh

# Ensure necessary directories exist
mkdir -p "$HOME/.oh-my-zsh/themes"

printf "===== MOVING ZSH FILES"

# Move or link the Zsh configuration files
mv -f "$current_dir/zsh/.zshrc" "$HOME/.zshrc"
mv -f "$current_dir/zsh/dbastos.zsh-theme" "$HOME/.oh-my-zsh/themes/dbastos.zsh-theme"

# Load bash environment in zsh
# Taken from https://github.com/axonasif/bashenv.zsh
printf "set +m; source <(bash -lic 'declare -px'); set -m" >> "$HOME/.zshrc"
