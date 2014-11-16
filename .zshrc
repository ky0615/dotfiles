
ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_THEME="dst_e"
ZSH_CUSTOM=$ZSH"/../zshcustom"
source $HOME/.zshrc.custom

plugins=(battery brew cake coffee command-not-found compleat cp encode64 gem git git-extras git-flow git-remote-branch history node nvm nyan osx perl python rbenv ruby rvm ssh-agent sudo golang gradle heroku)
# disabled: gitfast github gitignore

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:$HOME/bin:"

export PATH="${PATH}:/opt/X11/bin:/usr/local/mysql/bin:/Users/tarosa/dev/Tools/apache-maven-2.2.1/bin:/Users/tarosa/usr/share/ant//bin:/Users/ozaki/.svm/current/rt/bin:/Users/ozaki/Library/Haskell/bin:/Users/tarosa/android-sdks/tools:/Users/tarosa/android-sdks/extTools/dex2jar-0.0.9.15:/Users/tarosa/bin:/opt/X11/bin:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/:/Users/tarosa/local/bin:/usr/local/git/bin:/Users/tarosa/dotfiles/bin:/sbin:/usr/local/bin:/Users/tarosa/dev/Project/sandbox/stax-sdk-0.2.11:/Users/tarosa/dev/air/bin:/Users/tarosa/dev/flex/bin:/Users/tarosa/sandbox/GoogleAppEngine/sdk/1.3.4/google_appengine:/Users/tarosa/sandbox/GAEJava/sdk/appengine-java-sdk-1.3.7/bin:/Users/tarosa/dev/go/bin:/Users/tarosa/sandbox/jruby/jruby-1.5.2/bin:/Users/tarosa/sandbox/mirah/mirah/bin:/apache-ant/bin:~/.rvm/bin:/opt/local/lib/mysql55/bin:/opt/local/lib/postgresql93/bin"
export PATH=${PATH}:~/gsutil

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export LANG="ja_JP.UTF-8"
export XMODIFIERS="@im=uim"
export GTK_IM_MODULE="uim"

if [[ -s $HOME/.pyenv/bin/pyenv ]]
then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
fi

if [[ -s $HOME/.phpenv/bin/phpenv ]]
then
  export PATH="$HOME/.phpenv/bin:$PATH"
  eval "$(phpenv init -)"
fi

# if [[ $HOME/.rbenv/bin/pyenv ]] ;
#   eval "$(rbenv init -)"
#   export PATH="$HOME/.rbenv/bin:$PATH"
# fi

PATH=$PATH:/Applications/Xcode6-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/

export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="/opt/go/"
PATH=$PATH:/opt/gocode/bin/:/usr/local/opt/go/libexec/bin

if [[ -s /var/nvm/nvm.sh ]]
then
  . /var/nvm/nvm.sh
  nvm use default
  . $NVM_DIR/bash_completion
fi

if [[ -s $HOME/.nvm/nvm.sh ]] 
then
  . $HOME/.nvm/nvm.sh
  nvm use default
  . $NVM_DIR/bash_completion
fi


if [[ -s /usr/libexec/java_home ]]
then
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)
  export PATH=$JAVA_HOME/bin:$PATH
fi

