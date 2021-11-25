#!/bin/bash

source ~/dotfiles/_common.source

log "Setup $DIR..."

mkdir -p ~/bin
cp $DIR/bin/* ~/bin

trap - EXIT
log "$DIR Done!"
