#!/bin/bash

P=`readlink -f $(dirname $0)`

echo -n "Backup your original tmux files? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    mv -f ~/.tmux.conf ~/.tmux.conf_backup
    mv -f ~/.tmux-powerlinerc ~/.tmux-powerlinerc_backup
    rm -rf ~/.tmux-pl-src_bak; mv -f ~/.tmux-pl-src ~/.tmux-pl-src_bak
fi

rm -f ~/.tmux.conf
rm -f ~/.tmux-powerlinerc
rm -rf ~/.tmux-pl-src

ln -s $P/tmux.conf ~/.tmux.conf
ln -s $P/tmux-powerlinerc ~/.tmux-powerlinerc
git clone https://github.com/erikw/tmux-powerline ~/.tmux-pl-src
cp -r $P/custom/* ~/.tmux-pl-src/

echo "=== DONE! ==="

# patch fonts
echo -n "Patch fonts for my tmux"
bash $P/fonts/setup.sh
