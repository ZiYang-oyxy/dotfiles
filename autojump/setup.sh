#!/bin/bash

source ~/dotfiles/_common.source

log "Setup $DIR..."

git clone --depth 1 https://github.com/wting/autojump.git ~/dotfiles/$REPOS/autojump
(
cd $REPOS/autojump
./install.py
)

trap - EXIT
log "$DIR Done!"
