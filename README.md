# dotfiles

## install

### mac

```bash
git clone git@github.com:ky0615/dotfiles.git ~/dotfiles
cd dotfiles

sudo xcodebuild -license
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew tap homebrew/command-not-found

brew install zlib arp-scan neofetch wget socat x264 autoconf ffmpeg jpeg x265 automake flac jq libogg xmlstarlet awscli plantuml sqlite gradle lame libpng protobuf xz boost graphviz tfenv youtube-dl gcc openjdk tmux clang-format cmake openssh readline zsh icu4c curl libusb opus git git-extras git-flow git-lfs glfw imagemagick mpv iperf vim mysql w3m watch webp fzf

brew cask install adobe-creative-cloud bartender coolterm docker firefox adoptopenjdk8 bettertouchtool cyberduck dropbox app-cleaner calibre discord fantastical loopback google-backup-and-sync google-japanese-ime istat-menus5 jetbrains-toolbox musicbrainz-picard obs path-finder sketch xquartz vlc vox

git clone https://github.com/anyenv/anyenv ~/.anyenv
~/.anyenv/bin/anyenv init

anyenv install jenv
anyenv install nodenv
anyenv install pyenv

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
git clone git://github.com/nodenv/node-build-update-defs.git $(nodenv root)/plugins/node-build-update-defs
ln -s $HOME/dotfiles/default-packages $(nodenv root)/default-packages
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update


./init.sh

```


## install MongoDB

```bash
brew tap mongodb/brew
brew install mongodb-community
```
