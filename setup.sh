#!/bin/bash
DOT_FILES=( .zshrc .vimrc)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done

ln -s ~/dotfiles/vimfiles ~/.vim
