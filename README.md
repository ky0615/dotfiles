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
brew tap aws/tap

brew install zlib arp-scan neofetch wget socat x264 autoconf ffmpeg jpeg x265 automake flac jq libogg xmlstarlet awscli plantuml sqlite gradle lame libpng protobuf xz boost graphviz yt-dlp gcc tmux cmake openssh readline zsh icu4c curl libusb opus git git-extras git-flow git-lfs glfw imagemagick mpv iperf vim mysql w3m watch webp fzf libiconv rsync int128/tap/kubectl-external-forward coreutils fontforge redis asciidoc eksctl helm helmfile apktool lua fontconfig freetype pkg-config aws-iam-authenticator aws-sam-cli progress k9s argoproj/tap/kubectl-argo-rollouts argocd nmap qt gmp cocoapods sdl2 grep direnv openvpn source-highlight zoxide tfenv gpg


brew install --cask adobe-creative-cloud bartender adobe-acrobat-reader coolterm firefox bettertouchtool cyberduck app-cleaner calibre discord jetbrains-toolbox musicbrainz-picard obs path-finder xquartz vlc visual-studio-code homebrew/cask/1password authy loopback clipy mysqlworkbench homebrew/cask-versions/temurin8 balenaetcher jad ngrok wireshark mongodb-compass macfuse

# need manual install 
# docker https://docs.docker.com/docker-for-mac/apple-m1/
# google-japanese-ime https://www.google.co.jp/ime/
# istat menus6 https://bjango.com/mac/istatmenus/

git clone https://github.com/anyenv/anyenv ~/.anyenv
~/.anyenv/bin/anyenv init

anyenv install jenv
anyenv install nodenv
anyenv install pyenv
anyenv install rbenv
anyenv install phpenv
anyenv install goenv

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
git clone https://github.com/nodenv/node-build-update-defs.git $(nodenv root)/plugins/node-build-update-defs
git clone https://github.com/nodenv/nodenv-default-packages.git $(nodenv root)/plugins/nodenv-default-packages
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

ln -s $HOME/dotfiles/default-packages $(nodenv root)/default-packages

./init.sh

```

https://developer.apple.com/download/all/

