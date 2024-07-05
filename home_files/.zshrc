export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

unalias gp
alias gpu='git push'

# Get home quick!
alias cdq="cd $GITPOD_REPO_ROOT"
alias cdv="cd $GITPOD_REPO_ROOT/vendor/quizlet-shared-config"

# For CLI utils that need to open URLs
export BROWSER=$GP_EXTERNAL_BROWSER