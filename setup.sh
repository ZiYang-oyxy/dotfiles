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
