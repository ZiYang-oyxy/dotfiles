#!/bin/bash

source ~/dotfiles/_common.source

log "Setup $DIR..."

_ln $DIR/tmux.conf ~/.tmux.conf
_ln $DIR/tmux-powerlinerc ~/.tmux-powerlinerc

[[ -d ~/.tmux-pl-src ]] || {
git clone https://github.com/erikw/tmux-powerline ~/.tmux-pl-src
}
_ln $DIR/custom/themes/mytheme.sh ~/.tmux-pl-src/themes/mytheme.sh

trap - EXIT
log "$DIR Done!"
