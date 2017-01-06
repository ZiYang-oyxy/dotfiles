#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`

bash $DIR/bash/setup.sh

echo "=== Setup tools..."
rm -rf ~/tools
ln -s $DIR/tools ~/tools
echo "=== Done!"

bash $DIR/vim/setup.sh

bash $DIR/git/setup.sh

bash $DIR/tmux/setup.sh

#bash $DIR/fonts/setup.sh

#bash $DIR/markdown/pandoc/install4ubuntu64.sh

# 长按延迟
#xset r rate 220 160
