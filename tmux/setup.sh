#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`
ROOT=$DIR/..

. $ROOT/_common.sh

log "Setup tmux..."

rm -f ~/.tmux.conf
rm -f ~/.tmux-powerlinerc
rm -rf ~/.tmux-pl-src

ln -s $DIR/tmux.conf ~/.tmux.conf
ln -s $DIR/tmux-powerlinerc ~/.tmux-powerlinerc
ln -sd $DIR/.tmux-pl-src ~/.tmux-pl-src
git clone https://github.com/erikw/tmux-powerline ~/.tmux-pl-src
cp -r $DIR/custom/* ~/.tmux-pl-src/

log "Done!"
