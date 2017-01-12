#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`
ROOT=$DIR/..

. $ROOT/_common.sh

log "Setup git..."
rm -f ~/.gitconfig
ln -s $DIR/.gitconfig ~/.gitconfig
if [[ ! -e ~/.gitconfig_ignored ]]; then
	cp -f $DIR/.gitconfig_ignored ~/.gitconfig_ignored
fi
log "Done!"
