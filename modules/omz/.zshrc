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

wt() {
  local file="$1"
  if [[ "$file" == services/renderer* ]]; then
    echo "🔧 Testing Renderer file: $file"
    yarn test:rendererw "$file"
  else
    echo "🧪 Testing app/js file: $file"
    yarn test:jsw "$file"
  fi
}


wu() {
  local page="$1"
  local base=$(gp url 8082)
  local url="${base}/${page}"
  echo -n "$url" | echo "🌎 URL is: $url \n🧑🏾‍💻 Opening on your browser";
  gp preview "${base}/${page}" --external
}


  
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
