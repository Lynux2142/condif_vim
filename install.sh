#!/bin/bash

cd "`pwd`/$(dirname $0)"

if [ -n "$1" ]
then
	if [ $1 != "--update" ]
	then
		echo "usage: ./install.sh [--update]"
		echo "	--update:"
		echo "		make a pull and install if there is a new version"
		echo "		else nothing is done"
		exit 1
	else
		RES=`git pull`
		echo $RES
		if [[ $RES == "Already up to date." ]]
		then
			exit 0
		fi
	fi
fi

read -p "delete previous vim files ? (Y/n) " CHOIX

while [[ $CHOIX != 'Y' && $CHOIX != 'y' && $CHOIX != 'N' && $CHOIX != 'n' && -n $CHOIX ]]
do
	echo "error"
	read -p "delete previous vim files ? (Y/n) " CHOIX
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

cp vimrc ~/.vim/
ln -s ~/.vim/vimrc ~/.vimrc
echo '' | vim +PlugInstall +qall 2>/dev/null
