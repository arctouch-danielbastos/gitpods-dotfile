#!/usr/bin/env bash

# Install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null
sudo chsh -s $(which zsh) gitpod

dotfile_dir=~/.dotfiles

# Ensure necessary directories exist
mkdir -p "$HOME/.oh-my-zsh/themes"

printf "===== MOVING ZSH FILES\n"

# Move or link the Zsh configuration files
mv -f "$dotfile_dir/zsh/.zshrc" "$HOME/.zshrc"
mv -f "$dotfile_dir/zsh/dbastos.zsh-theme" "$HOME/.oh-my-zsh/themes/dbastos.zsh-theme"

# Load bash environment in zsh
# Taken from https://github.com/axonasif/bashenv.zsh
printf "set +m; source <(bash -lic 'declare -px'); set -m" >> "$HOME/.zshrc"
