#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`
ROOT=$DIR/../../..
TMUXDIR=$ROOT/tmux

. $ROOT/_common.sh

log "Setup tmux..."

rm -f ~/.tmux.conf
rm -f ~/.tmux-powerlinerc
rm -rf ~/.tmux-pl-src

ln -s $TMUXDIR/tmux.conf ~/.tmux.conf
ln -s $TMUXDIR/tmux-powerlinerc ~/.tmux-powerlinerc
if git clone https://github.com/erikw/tmux-powerline ~/.tmux-pl-src; then
	cp -r $TMUXDIR/custom/* ~/.tmux-pl-src/
fi

log "Done!"
