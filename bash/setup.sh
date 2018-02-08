#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`
ROOT=$DIR/..

. $ROOT/_common.sh

log "Setup bash..."

rm -f ~/.bash_aliases
rm -f ~/.bashrc
rm -f ~/.profile
rm -f ~/.inputrc
ln -sf $DIR/.bash_aliases ~/.bash_aliases
ln -sf $DIR/.bashrc ~/.bashrc
ln -sf $DIR/.profile ~/.profile
ln -sf $DIR/.inputrc ~/.inputrc
if [[ ! -e ~/.bashrc_ignored ]]; then
	cp -f $DIR/.bashrc_ignored ~/.bashrc_ignored
fi

if [[ -n $1 ]]; then
    ln -sf $ROOT/4work/$1/bash/.bashrc_4work ~/.bashrc_4work
fi

log "Done!"
