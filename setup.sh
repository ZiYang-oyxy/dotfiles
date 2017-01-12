#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`

. "$DIR"/_common.sh

trap fini EXIT INT TERM

bash $DIR/bash/setup.sh

log "Setup tools..."
rm -rf ~/tools
ln -s $DIR/tools ~/tools
log "Done!"

bash $DIR/vim/setup.sh

bash $DIR/git/setup.sh

bash $DIR/tmux/setup.sh

#bash $DIR/fonts/setup.sh

#bash $DIR/markdown/pandoc/install4ubuntu64.sh

# 长按延迟
#xset r rate 220 160

trap - EXIT
log "All Done!"
