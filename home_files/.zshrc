export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Let's not shadow gp
unalias gp
alias gps='git push'

# Get home quick!
alias cdq="cd $GITPOD_REPO_ROOT"
alias cdv="cd $GITPOD_REPO_ROOT/vendor/quizlet-shared-config"
