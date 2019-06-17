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

plugins=(adb aws brew cargo docker docker-compose fabric git git-extras git-flow git-remote-branch gradle history iterm2 node npm osx pip python sudo vscode xcode yarn)

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tarosa/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tarosa/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tarosa/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tarosa/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"


# if (which zprof > /dev/null 2>&1) ;then
  # zprof
# fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/tarosa/.anyenv/envs/nodenv/versions/10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/tarosa/.anyenv/envs/nodenv/versions/10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/tarosa/.anyenv/envs/nodenv/versions/10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/tarosa/.anyenv/envs/nodenv/versions/10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/tarosa/.anyenv/envs/nodenv/versions/10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/tarosa/.anyenv/envs/nodenv/versions/10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh