# set char code
export LC_MESSAGES=ja_JP.UTF-8
export LC_IDENTIFICATION=ja_JP.UTF-8
export LC_COLLATE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LC_MEASUREMENT=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8
export LC_NAME=ja_JP.UTF-8
export LESSCHARSET=utf-8
export GPG_TTY=$(tty)

# zsh config
ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_THEME="dst_e"
ZSH_CUSTOM=$ZSH"/../zshcustom"

plugins=(
  aws
  common-aliases
  # command-not-found
  docker docker-compose
  gradle
  git git-flow
  kubectl helm
  pip python
  sudo
  terraform
  tig
  yarn npm
  zsh-interactive-cd
  # zsh-autosuggestions
  # zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc.custom

# User configuration
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:$HOME/bin:"$PATH

case "${OSTYPE}" in
# MacOSX
darwin*)
  [ -f ~/.zshrc.mac ] && source ~/.zshrc.mac

  case "$(uname -m)" in
  # Apple Silicon
  arm64*)
    [ -f ~/.zshrc.mac-si ] && source ~/.zshrc.mac-si
    ;;
  # Apple Intel Mac
  x86_64*)
    [ -f ~/.zshrc.mac-x86 ] && source ~/.zshrc.mac-x86
    ;;
  esac

  ;;
# Linux
linux*)
  [ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
  ;;
esac

alias l='ls -lah'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

source ~/.zshrc.env

if (which zprof > /dev/null 2>&1) ;then
  zprof
fi

