#!/bin/bash

source ~/dotfiles/_common.source

log "Setup $DIR..."

git clone --depth 1 https://github.com/wting/autojump.git $DIR/.repo/autojump
(
cd $DIR/.repo/autojump
./install.py
)

trap - EXIT
log "$DIR Done!"
