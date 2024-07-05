# The Oh-My-Zsh Git plugin aliases `gp` to `git push`, but we don't want to shadow the Gitpods CLI
# https://www.gitpod.io/docs/references/gitpod-cli
unalias gp
alias gpu='git push'

# Use a shorter alias than the Oh-My-Zsh Git plugin default
unalias gdca
alias gdc='git diff --cached'

# Get home quick!
alias cdq="cd $GITPOD_REPO_ROOT"
alias cdv="cd $GITPOD_REPO_ROOT/vendor/quizlet-shared-config"

# For CLI utils that need to open URLs
export BROWSER=$GP_EXTERNAL_BROWSER

# Initialize Java integration for KMP
# https://github.com/gitpod-io/workspace-images/blob/e91b47d148d6687703e258a7589b8cba74367a88/chunks/lang-java/Dockerfile#L11-L27
export SDKMAN_DIR="/home/gitpod/.sdkman"
[[ -s "/home/gitpod/.sdkman/bin/sdkman-init.sh" ]] && source "/home/gitpod/.sdkman/bin/sdkman-init.sh"