#!/bin/bash

touch .zshrc.custom

DOT_FILES=( .zshenv .zshrc .vimrc .zshrc.custom .gitconfig .zshrc.mac .zshrc.mac-si .zshrc.mac-x86 .zshrc.linux .zshrc.env .gitignore_global .tmux.conf)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done
[ ! -d ~/.vim ] && ln -s ~/dotfiles/vimfiles ~/.vim
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc

cd $HOME/dotfiles/vimfiles/bundle/vimproc
sudo make
cd $HOME/dotfiles

git submodule init
git submodule update
