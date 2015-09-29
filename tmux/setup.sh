#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`

echo "=== Setup tmux..."

rm -f ~/.tmux.conf
rm -f ~/.tmux-powerlinerc
rm -rf ~/.tmux-pl-src

ln -s $DIR/tmux.conf ~/.tmux.conf
ln -s $DIR/tmux-powerlinerc ~/.tmux-powerlinerc
git clone https://github.com/erikw/tmux-powerline ~/.tmux-pl-src
cp -r $DIR/custom/* ~/.tmux-pl-src/

echo "=== Done!"
