#!/bin/bash

P=`readlink -f $(dirname $0)`

# vim files
echo -n "Backup your original vim files? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    rm -rf ~/.vim_backup; mv -f ~/.vim ~/.vim_backup
    rm -rf ~/.vimrc_backup; mv -f ~/.vimrc ~/.vimrc_backup
fi

rm -rf ~/.vim
rm -f ~/.vimrc

ln -sd $P/vim-base ~/.vim
ln -s $P/vimrc ~/.vimrc

# for persistant undo
mkdir -p ~/.vim/undodir

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "=== DONE! ==="

# setup dictionary
echo -n "Setup dictionary? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    sudo sh -c "apt-get install stardict"
    sudo sh -c "apt-get install sdcv"
    wget -O stardict-langdao-ec-gb-2.4.2.tar.gz https://dl.dropboxusercontent.com/s/dqqa5goulgt3wp9/stardict-langdao-ec-gb-2.4.2.tar.gz?token_hash=AAHQ5XX-mCgpgSN67CZAtM8lESnRF2MderYw67Quo77XLA&dl=1 & wait
    wget -O stardict-langdao-ce-gb-2.4.2.tar.gz https://dl.dropboxusercontent.com/s/rc4g62xevaickig/stardict-langdao-ce-gb-2.4.2.tar.bz2?token_hash=AAE-LJ3a1irBxgcltV9upxWvQGeocJJ_ik9RYqotrTmPGQ&dl=1 & wait
    tar -xf $P/stardict-langdao-ec-gb-2.4.2.tar.gz
    tar -xf $P/stardict-langdao-ce-gb-2.4.2.tar.gz
    rm stardict-langdao-ec-gb-2.4.2.tar.gz
    rm stardict-langdao-ce-gb-2.4.2.tar.gz
    sudo sh -c "mv -u ./stardict-langdao-* /usr/share/stardict/dic/"
    echo "=== DONE! ==="
fi

exit 0
