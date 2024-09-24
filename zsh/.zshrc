# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="pure"
ZSH_THEME="dbastos"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git aliases gh)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gpd='gitpod'

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
alias gpov='gitpod workspace list | tail -n +2 | fzf --height=10% --layout=reverse --border | awk "{print \$1}" | xargs -I{} gitpod workspace open --editor code-desktop --open {}'

alias gpnew='gitpod workspace create https://github.com/quizlet/quizlet-web/ --editor code-desktop --open'
source <(fzf --zsh)
