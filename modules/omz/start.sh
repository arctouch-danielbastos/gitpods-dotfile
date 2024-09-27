#!/usr/bin/env bash

sudo chsh -s $(which zsh) gitpod

current_dir="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"

# Move the Zsh configuration files
mv -f "$current_dir/.zshrc" "$HOME/.zshrc"

# Load bash environment in zsh
# Taken from https://github.com/axonasif/bashenv.zsh
printf "set +m; source <(bash -lic 'declare -px'); set -m" >> "$HOME/.zshrc"
