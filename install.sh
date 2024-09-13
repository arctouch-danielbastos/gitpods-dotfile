#!/usr/bin/env bash

echo "Setting up ohmyzsh powerlevel10k"

# Install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh) gitpod

# Install neovim
brew install neovim
"${curr ent_dir}/cleanUpTasks.sh"

# Load bash environment in zsh
# Taken from https://github.com/axonasif/bashenv.zsh
echo "set +m; source <(bash -lic 'declare -px'); set -m" >> "$HOME/.zshrc"
