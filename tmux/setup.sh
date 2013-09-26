#!/bin/bash

P=`readlink -f $(dirname $0)`

echo -n "Backup your original tmux files? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    rm -f ~/.tmux.conf_backup; mv -f ~/.tmux.conf ~/.tmux.conf_backup
    rm -f ~/.tmux-powerlinerc_backup; mv -f ~/.tmux-powerlinerc ~/.tmux-powerlinerc_backup
fi

rm -f ~/.tmux.conf
rm -f ~/.tmux-powerlinerc

ln -s $P/tmux.conf ~/.tmux.conf
ln -s $P/tmux-powerline/tmux-powerlinerc ~/.tmux-powerlinerc
echo "=== DONE! ==="

# patch fonts
bash $P/tmux-powerline/fonts/setup.sh
