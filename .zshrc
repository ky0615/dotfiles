
ZSH=$HOME/dotfiles/oh-my-zsh
ZSH_THEME="dst_e"
ZSH_CUSTOM=$ZSH"/../zshcustom"
source $HOME/.zshrc.custom
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ant apache2-macports autoenv battery brew cake coffee command-not-found compleat cp encode64 gem git git-extras git-flow git-remote-branch gitfast github gitignore golang gradle heroku history jruby macports mercurial mvn mysql-macports node nvm nyan osx perl python rbenv repo ruby rvm ssh-agent sudo svn symfony2 web-search)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:"

export PATH="${PATH}:/opt/X11/bin:/usr/local/mysql/bin:/Users/tarosa/dev/Tools/apache-maven-2.2.1/bin:/Users/tarosa/usr/share/ant//bin:/Users/ozaki/.svm/current/rt/bin:/Users/ozaki/Library/Haskell/bin:/Users/tarosa/android-sdks/tools:/Users/tarosa/android-sdks/extTools/dex2jar-0.0.9.15:/Users/tarosa/bin:/opt/X11/bin:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/:/Users/tarosa/local/bin:/usr/local/git/bin:/Users/tarosa/dotfiles/bin:/sbin:/usr/local/bin:/Users/tarosa/dev/Project/sandbox/stax-sdk-0.2.11:/Users/tarosa/dev/air/bin:/Users/tarosa/dev/flex/bin:/Users/tarosa/sandbox/GoogleAppEngine/sdk/1.3.4/google_appengine:/Users/tarosa/sandbox/GAEJava/sdk/appengine-java-sdk-1.3.7/bin:/Users/tarosa/dev/go/bin:/Users/tarosa/sandbox/jruby/jruby-1.5.2/bin:/Users/tarosa/sandbox/mirah/mirah/bin:/apache-ant/bin:~/.rvm/bin:/opt/local/lib/mysql55/bin:/opt/local/lib/postgresql93/bin"
export PATH=${PATH}:~/gsutil

# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# [[ -s "${HOME}/.perl5/perlbrew/etc/bashrc" ]] && source $HOME/.perl5/perlbrew/etc/bashrc
nvm use default
# perlbrew use 5.18.1

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
export LANG="ja_JP.UTF-8"
export XMODIFIERS="@im=uim"
export GTK_IM_MODULE="uim"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

PATH=$PATH:/Applications/Xcode6-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/
# export GOROOT="/usr/local/Cellar/go/1.2.2/"
export GOPATH="/usr/local/_go"
