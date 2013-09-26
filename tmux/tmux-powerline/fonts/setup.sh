#!/bin/bash

P="$(dirname $0)"

echo "Patching fonts for tmux-powerline ..."
sudo sh -c "mkdir /usr/share/fonts/tmuxfonts"
sudo sh -c "cp $P/Inconsolata-Powerline.otf /usr/share/fonts/tmuxfonts"
sudo fc-cache -vf

echo "=== DONE! ==="
