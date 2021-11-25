#!/bin/bash -xe

source ~/dotfiles/_common.source

log "Setup $DIR..."

_ln $DIR/vim-base ~/.vim
_ln $DIR/vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# for persistant undo
mkdir -p ~/.vim/undodir

#if ! type ctags >/dev/null 2>&1; then
#    sudo apt-get install exuberant-ctags
#fi

#if ! type cscope >/dev/null 2>&1; then
#    sudo apt-get install cscope
#fi

# needed by vim ale
#brew install cppcheck shellcheck

log "$DIR Done!"
