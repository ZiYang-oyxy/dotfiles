#!/bin/bash

# bashrc
echo -n "Backup your original bashrc? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    rm -f ~/.bashrc_backup; mv -f ~/.bashrc ~/.bashrc_backup
fi
rm -f ~/.bashrc
ln -s $PWD/bashrc ~/.bashrc
echo "=== DONE! ==="

# scripts
echo -n "Backup your original ~/scripts? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    rm -rf ~/scripts_backup; mv -f ~/scripts ~/scripts_backup
fi
rm -rf ~/scripts
ln -s $PWD/scripts ~/scripts
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
