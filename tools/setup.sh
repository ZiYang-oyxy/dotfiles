#!/bin/bash

source ~/dotfiles/_common.source

log "Setup $DIR..."

mkdir -p ~/bin
cp $DIR/bin/* ~/bin

if [[ -e ~/.bashrc_ignored ]]; then
    echo "source $DIR/xfinder.source" >> ~/.bashrc_ignored
else
    echo "source $DIR/xfinder.source" >> ~/.bashrc
fi

trap - EXIT
log "$DIR Done!"
