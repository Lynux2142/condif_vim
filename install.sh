#!/bin/bash

FORCE=0

cd "`pwd`/$(dirname $0)"

if [ -n "$1" ]
then
	if [ $1 == "--update" ]
	then
		RES=`git pull`
		echo $RES
		if [[ $RES == "Already up to date." ]]
		then
			exit 0
		else
			./install.sh
			exit 0
		fi
	elif [ $1 == "--force" ]
	then
		FORCE=1
	else
		echo "usage: ./install.sh [--update] [--force]"
		echo "	--update:"
		echo "		Make a pull and install if there is a new version"
		echo "		else nothing is done"
		echo "	--force:"
		echo "		Force delete previous vim files"
		exit 1
	fi
fi

if [[ $FORCE = 0 ]]
then
	read -p "delete previous vim files ? (Y/n) " CHOIX

	while [[ $CHOIX != 'Y' && $CHOIX != 'y' && $CHOIX != 'N' && $CHOIX != 'n' && -n $CHOIX ]]
	do
		echo "error"
		read -p "delete previous vim files ? (Y/n) " CHOIX
	done
fi

if [[ $CHOIX = 'Y' || $CHOIX = 'y' || -z $CHOIX || $FORCE = 1 ]]
then
	rm -rf ~/.vim*
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d "$HOME/.vim" ]
then
	mkdir ~/.vim
fi

cp vimrc ~/.vim/
ln -sf ~/.vim/vimrc ~/.vimrc
echo '' | vim +PlugInstall +qall 2>/dev/null
echo ''
echo "Installation done."
