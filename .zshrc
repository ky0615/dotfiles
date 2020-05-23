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

plugins=(adb aws brew cargo common-aliases docker docker-compose fabric git git-extras git-flow git-extras git-remote-branch gradle history iterm2 kubectl node npm osx pip pipenv python pyenv rbenv sudo ssh-agent terraform vscode xcode yarn)

source $ZSH/oh-my-zsh.sh

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

source ~/.zshrc.env
source $HOME/.zshrc.custom

alias l='ls -lah'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
