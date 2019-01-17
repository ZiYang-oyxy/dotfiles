#!/bin/bash

source ~/dotfiles/_common.source

log "Setup $DIR..."

git clone --depth 1 https://github.com/cyrus-and/gdb-dashboard.git ~/dotfiles/$REPOS/gdb-dashboard
(
_ln $REPOS/gdb-dashboard/.gdbinit ~/.gdbinit
_ln $DIR/.gdbinit.d ~/.gdbinit.d
)

trap - EXIT
log "$DIR Done!"
