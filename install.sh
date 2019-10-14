#!/bin/bash

read -p "delete vim files ? (Y/n) " CHOIX

while [[ $CHOIX != 'Y' && $CHOIX != 'y' && $CHOIX != 'N' && $CHOIX != 'n' && -n $CHOIX ]]
do
	echo "error"
	read -p "delete vim files ? (Y/n) " CHOIX
done

if [[ $CHOIX = 'Y' || $CHOIX = 'y' || -z $CHOIX ]]
then
	rm -rf ~/.vim*
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d "$HOME/.vim" ]
then
	mkdir ~/.vim
fi

cd "`pwd`/$(dirname $0)"
cp vimrc ~/.vim/
ln -s ~/.vim/vimrc ~/.vimrc
echo "press any key" && vim +PlugInstall +qall 2>/dev/null
