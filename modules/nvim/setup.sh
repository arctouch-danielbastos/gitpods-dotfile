#!/usr/bin/env bash

# Install neovim
brew install neovim > /dev/null
current_dir="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"

# Ensure necessary directories exist
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.local/share/nvim"

# Move the Neovim configuration files
mv -f "$current_dir/nvim/init.lua" "$HOME/.config/nvim/init.lua"
mv -f "$current_dir/nvim/lazy" "$HOME/.local/share/nvim/lazy"
mv -f "$current_dir/nvim/lazy-lock.json" "$HOME/.config/nvim/lazy-lock.json"
