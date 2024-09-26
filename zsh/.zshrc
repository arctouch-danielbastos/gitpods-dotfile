# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="pure"
ZSH_THEME="dbastos"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git aliases gh)

unalias gst
alias gst='git status --short'

source $ZSH/oh-my-zsh.sh
unalias gp
alias gs='git push'
  
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gpd='gitpod'

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
