#!/bin/bash
DOT_FILES=( .zshrc .vimrc .zshrc.custom)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done
[ ! -d ~/.vim ] && ln -s ~/dotfiles/vimfiles ~/.vim