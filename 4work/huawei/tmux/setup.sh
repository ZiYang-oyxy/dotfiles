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
# TODO install tmux-pl-src
cp -r $TMUXDIR/custom/* ~/.tmux-pl-src/

log "Done!"
