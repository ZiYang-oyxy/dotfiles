#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`
ROOT=$DIR/../..

. $ROOT/_common.sh

trap fini EXIT INT TERM

bash $ROOT/bash/setup.sh `echo ${DIR##*/4work/}`

log "Setup tools..."
rm -rf ~/tools
ln -s $ROOT/tools ~/tools
log "Done!"

bash $DIR/vim/setup.sh

bash $ROOT/git/setup.sh

bash $DIR/tmux/setup.sh

trap - EXIT
log "All Done!"
