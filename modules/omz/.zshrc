# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
dotfile_dir=~/.dotfiles
export ZSH="$dotfile_dir/modules/omz/install"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="pure"
ZSH_THEME="dbastos"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git aliases gh)

# Install oh-my-zsh
source "$dotfile_dir/modules/omz/install/oh-my-zsh.sh"
# Avoid clash with gitpod CLI
unalias gp
unalias gl

alias gs="git status --short"
alias gl="git log --oneline --decorate"
alias ytr="yarn test:rendererw"
alias ytj="yarn test:jsw"

wu() {
  local page="$1"
  local base=$(gp url 8082)
  echo "${base}/${page}"
}


  
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
