#!/usr/bin/env bash

echo "Setting up ohmyzsh powerlevel10k"

# Install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh) gitpod

# echo alias gitpod=/usr/bin/gp > $HOME/.oh-my-zsh/custom/gitpod.zsh
# env

# Install neovim
brew install neovim

current_dir=$(dirname "$(realpath "$0")") 
"${current_dir}/cleanUpTasks.sh"
"${current_dir}/symlink.sh"

# Load bash environment in zsh
# Taken from https://github.com/axonasif/bashenv.zsh
echo "set +m; source <(bash -lic 'declare -px'); set -m" >> "$HOME/.zshrc"
