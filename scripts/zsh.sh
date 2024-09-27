#!/usr/bin/env bash

sudo chsh -s $(which zsh) gitpod

dotfile_dir=~/.dotfiles

# Move the Zsh configuration files
mv -f "$dotfile_dir/zsh/.zshrc" "$HOME/.zshrc"

# Load bash environment in zsh
# Taken from https://github.com/axonasif/bashenv.zsh
printf "set +m; source <(bash -lic 'declare -px'); set -m" >> "$HOME/.zshrc"
