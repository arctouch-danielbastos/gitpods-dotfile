#!/usr/bin/env bash

# Install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh) gitpod

# Install neovim
brew install neovim
current_dir=$(dirname "$(realpath "$0")") 

# Load bash environment in zsh
# Taken from https://github.com/axonasif/bashenv.zsh
echo "set +m; source <(bash -lic 'declare -px'); set -m" >> "$HOME/.zshrc"

# Ensure necessary directories exist
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.local/share/nvim"
mkdir -p "$HOME/.oh-my-zsh/themes"

echo "===== MOVING NEOVIM FILES"

# Move or link the Neovim configuration files
mv "$current_dir/nvim/init.lua" "$HOME/.config/nvim/init.lua"
mv "$current_dir/nvim/lazy" "$HOME/.local/share/nvim/lazy"
mv "$current_dir/nvim/lazy-lock.json" "$HOME/.config/nvim/lazy-lock.json"

echo "===== MOVING ZSH FILES"
# Move or link the Zsh configuration files
mv "$current_dir/zsh/.zshrc" "$HOME/.zshrc"
mv "$current_dir/zsh/dbastos.zsh-theme" "$HOME/.oh-my-zsh/themes/dbastos.zsh-theme"
