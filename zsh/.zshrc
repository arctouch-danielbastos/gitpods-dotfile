# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
dotfile_dir=~/.dotfiles
export ZSH="$dotfile_dir/zsh/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="pure"
ZSH_THEME="dbastos"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git aliases gh)

# Install oh-my-zsh
source ~/.dotfiles/zsh/.oh-my-zsh/oh-my-zsh.sh
unalias gp
alias gs='git push'
  
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gpd='gitpod'

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
