#!/bin/bash

source ~/dotfiles/_common.source

log "Setup $DIR..."

#sudo apt-get install fontconfig
sudo sh -c "mkdir -p /usr/share/fonts/tmuxfonts"
sudo sh -c "cp $DIR/Inconsolata-Powerline.otf /usr/share/fonts/tmuxfonts"
sudo fc-cache -vf

log "$DIR Done!"
