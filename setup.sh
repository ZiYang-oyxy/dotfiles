#!/bin/bash

# my bash custom
echo -n "Backup your original bash_aliases? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
	mv -f ~/.bash_aliases ~/.bash_aliases_backup
fi
rm -f ~/.bash_aliases
ln -s $PWD/bash_aliases ~/.bash_aliases
echo "=== DONE! ==="

# tools
echo -n "Backup your original ~/tools? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    rm -rf ~/tools_backup; mv -f ~/tools ~/tools_backup
fi
rm -rf ~/tools
ln -s $PWD/tools ~/tools
echo "=== DONE! ==="

# vim
bash $PWD/vim/setup.sh

# tmux & powerline
bash $PWD/tmux/setup.sh

# git
rm -f ~/.gitconfig
ln -s $PWD/gitconfig ~/.gitconfig

# pandoc
bash $PWD/markdown/pandoc/install.sh
