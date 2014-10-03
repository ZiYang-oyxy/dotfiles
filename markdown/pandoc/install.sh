#!/bin/bash

P=`readlink -f $(dirname $0)`

## for `dot` tool
#sudo apt-get install graphviz
#
## install newest pandoc
#sudo apt-get install haskell-platform
#cabal update
#cabal install pandoc

# install my data
mkdir -p ~/bin ~/.pandoc
ln -s $P/pandoc_md.sh ~/bin/pandoc_md.sh
ln -s $P/pandoc_css ~/.pandoc/pandoc_css
ln -s $P/templates ~/.pandoc/templates
