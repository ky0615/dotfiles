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

# zsh config
ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_THEME="dst_e"
ZSH_CUSTOM=$ZSH"/../zshcustom"

plugins=(
  aws
  common-aliases
  docker docker-compose
  git git-flow
  kubectl
  pip python
  sudo
  terraform
  yarn
  zsh-syntax-highlighting
)

source ~/.zshrc.env
source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc.custom

# User configuration
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:$HOME/bin:"$PATH

case "${OSTYPE}" in
# MacOSX
darwin*)
  [ -f ~/.zshrc.mac ] && source ~/.zshrc.mac
  ;;
# Linux
linux*)
  [ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
  ;;
esac

alias l='ls -lah'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
