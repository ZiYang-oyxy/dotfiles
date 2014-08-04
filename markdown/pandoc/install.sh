#!/bin/bash

## for `dot` tool
#sudo apt-get install graphviz
#
## install newest pandoc
#sudo apt-get install haskell-platform
#cabal update
#cabal install pandoc

# install my data
mkdir -p ~/bin ~/.pandoc
ln -s $PWD/pandoc_md.sh ~/bin/pandoc_md.sh
ln -s $PWD/pandoc_css ~/.pandoc/pandoc_css
ln -s $PWD/templates ~/.pandoc/templates
