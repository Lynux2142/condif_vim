#!/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -z "~/.vim" ];
then
	mkdir ~/.vim
fi

cd "`pwd`/$(dirname $0)"
cp vimrc ~/.vim/
ln -s ~/.vim/vimrc ~/.vimrc
echo "press any key" && vim +PlugInstall +qall 2>/dev/null
