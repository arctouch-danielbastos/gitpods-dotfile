#!/usr/bin/env bash

# Install neovim
brew install neovim > /dev/null
dotfile_dir=~/.dotfiles

# Ensure necessary directories exist
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.local/share/nvim"

printf "===== MOVING NEOVIM FILES"

# Move or link the Neovim configuration files
mv -f "$dotfile_dir/nvim/init.lua" "$HOME/.config/nvim/init.lua"
mv -f "$dotfile_dir/nvim/lazy" "$HOME/.local/share/nvim/lazy"
mv -f "$dotfile_dir/nvim/lazy-lock.json" "$HOME/.config/nvim/lazy-lock.json"
