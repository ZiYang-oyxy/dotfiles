#!/bin/bash

set -e

echo "=== Setup pandoc..."

DIR=`readlink -f $(dirname $0)`

# install newest version of pandoc from https://github.com/jgm/pandoc/releases

cd $DIR
mkdir -p ~/bin ~/.pandoc
ln -fs $DIR/pandoc_md.sh ~/bin/pandoc_md.sh
rm -f ~/.pandoc/pandoc_css ~/.pandoc/templates
ln -s $DIR/pandoc_css ~/.pandoc/pandoc_css
ln -s $DIR/templates ~/.pandoc/templates

echo "=== Done!"
