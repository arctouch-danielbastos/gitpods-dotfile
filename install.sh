#!/usr/bin/env bash

echo "Setting up ohmyzsh powerlevel10k"

# Install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh) gitpod

# echo alias gitpod=/usr/bin/gp > $HOME/.oh-my-zsh/custom/gitpod.zsh
# env

# Install neovim
brew install neovim

current_dir="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
"${current_dir}/cleanUpTasks.sh"

# Symlink dotfiles
dotfiles_source="${current_dir}/home_files"

while read -r file; do
    relative_file_path="${file#"${dotfiles_source}"/}"
    target_file="${HOME}/${relative_file_path}"
    target_dir="${target_file%/*}"

    if test ! -d "${target_dir}"; then
        mkdir -p "${target_dir}"
    fi

    printf 'Installing dotfiles symlink %s\n' "${target_file}"
    ln -sf "${file}" "${target_file}"

done < <(find "${dotfiles_source}" -type f)

# Load bash environment in zsh
# Taken from https://github.com/axonasif/bashenv.zsh
echo "set +m; source <(bash -lic 'declare -px'); set -m" >> "$HOME/.zshrc"
