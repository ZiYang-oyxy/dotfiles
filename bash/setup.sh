#!/bin/bash -ex

source ~/dotfiles/_common.source

log "Setup $DIR..."

_ln $DIR/.bashrc ~/.bashrc
_ln $DIR/.profile ~/.profile
_ln $DIR/.inputrc ~/.inputrc
_ln $DIR/.bashrc_custom ~/.bashrc_custom

if [[ ! -e ~/.bashrc_ignored ]]; then
    cp -f $DIR/.bashrc_ignored ~/.bashrc_ignored
fi

log "$DIR Done!"
