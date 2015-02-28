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
source $HOME/.zshrc.custom

plugins=(battery brew cake coffee command-not-found compleat cp encode64 gem git git-extras git-flow git-remote-branch history node nvm nyan osx python rbenv ruby rvm ssh-agent sudo golang gradle heroku)
# disabled: gitfast github gitignore

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:$HOME/bin:"

case "${OSTYPE}" in
# MacOSX
darwin*)
  [ -f ~/.zshrc.osx ] && source ~/.zshrc.osx
  ;;
# Linux
linux*)
  [ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
  ;;
esac

source ~/.zshrc.env