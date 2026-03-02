#!/bin/bash

touch .zshrc.custom

DOT_FILES=( .zshenv .zshrc .vimrc .zshrc.custom .gitconfig .zshrc.mac .zshrc.mac-si .zshrc.mac-x86 .zshrc.linux .zshrc.env .gitignore_global .tmux.conf .gitattributes)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done
[ ! -d ~/.vim ] && ln -s ~/dotfiles/vimfiles ~/.vim

# vim-plug のインストール
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim プラグインのインストール
vim -es -u ~/.vimrc -i NONE -c 'PlugInstall' -c 'qa'

git submodule init
git submodule update
