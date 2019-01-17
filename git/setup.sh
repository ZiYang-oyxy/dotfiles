#!/bin/bash

source ~/dotfiles/_common.source

log "Setup $DIR..."

_ln $DIR/.gitconfig ~/.gitconfig
_ln $DIR/.gitignore_global ~/.gitignore_global
if [[ ! -e ~/.gitconfig_ignored ]]; then
    cp -f $DIR/.gitconfig_ignored ~/.gitconfig_ignored
fi

log "Done!"
