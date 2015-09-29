#!/bin/bash

set -e

echo "=== Setup vim..."

DIR=`readlink -f $(dirname $0)`

# vim files
rm -rf ~/.vim
rm -f ~/.vimrc

ln -sd $DIR/vim-base ~/.vim
ln -s $DIR/vimrc ~/.vimrc

# for persistant undo
mkdir -p ~/.vim/undodir

[ -d ~/.vim/bundle/vundle ] || {
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
}

sudo apt-get install exuberant-ctags
sudo apt-get install cscope

echo "=== Done!"

# echo "Setup dictionary..."
# sudo sh -c "apt-get install stardict"
# sudo sh -c "apt-get install sdcv"
# [ -e $P/stardict-langdao-ec-gb-2.4.2.tar.gz ] || wget -O stardict-langdao-ec-gb-2.4.2.tar.gz https://dl.dropboxusercontent.com/s/dqqa5goulgt3wp9/stardict-langdao-ec-gb-2.4.2.tar.gz?token_hash=AAHQ5XX-mCgpgSN67CZAtM8lESnRF2MderYw67Quo77XLA&dl=1 & wait
# [ -e $P/stardict-langdao-ce-gb-2.4.2.tar.gz ] || wget -O stardict-langdao-ce-gb-2.4.2.tar.gz https://dl.dropboxusercontent.com/s/rc4g62xevaickig/stardict-langdao-ce-gb-2.4.2.tar.bz2?token_hash=AAE-LJ3a1irBxgcltV9upxWvQGeocJJ_ik9RYqotrTmPGQ&dl=1 & wait
# tar -xf $P/stardict-langdao-ec-gb-2.4.2.tar.gz
# tar -xf $P/stardict-langdao-ce-gb-2.4.2.tar.gz
# sudo sh -c "mv -u ./stardict-langdao-ec-gb-2.4.2 /usr/share/stardict/dic/"
# sudo sh -c "mv -u ./stardict-langdao-ce-gb-2.4.2 /usr/share/stardict/dic/"
# echo "=== Done!"
