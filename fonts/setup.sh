#!/bin/bash

set -e

DIR="$(dirname $0)"

echo "=== Setup fonts..."
sudo sh -c "mkdir /usr/share/fonts/tmuxfonts"
sudo sh -c "cp $DIR/Inconsolata-Powerline.otf /usr/share/fonts/tmuxfonts"
sudo fc-cache -vf

echo "=== Done!"
