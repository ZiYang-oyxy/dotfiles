#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`
ROOT=$DIR/../..

log "Setup pandoc..."

# install newest version of pandoc from https://github.com/jgm/pandoc/releases

cd $DIR
mkdir -p ~/bin ~/.pandoc
ln -fs $DIR/pandoc_md.sh ~/bin/pandoc_md.sh
rm -f ~/.pandoc/pandoc_css ~/.pandoc/templates
ln -s $DIR/pandoc_css ~/.pandoc/pandoc_css
ln -s $DIR/templates ~/.pandoc/templates

log "Done!"
