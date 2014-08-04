#!/bin/bash
DOT_FILES=( .zshrc .vimrc .zshrc.custom .gitconfig)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done
[ ! -d ~/.vim ] && ln -s ~/dotfiles/vimfiles ~/.vim
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
