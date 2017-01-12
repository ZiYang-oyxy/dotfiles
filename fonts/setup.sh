#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`
ROOT=$DIR/..

. $ROOT/_common.sh

log "Setup fonts..."
#sudo apt-get install fontconfig
sudo sh -c "mkdir -p /usr/share/fonts/tmuxfonts"
sudo sh -c "cp $DIR/Inconsolata-Powerline.otf /usr/share/fonts/tmuxfonts"
sudo fc-cache -vf

log "Done!"
