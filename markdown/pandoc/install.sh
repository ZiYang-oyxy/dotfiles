#!/bin/bash

# for `dot` tool
sudo apt-get install graphviz

# install newest pandoc
sudo apt-get install haskell-platform
cabal update
cabal install pandoc
sudo cp ~/.cabal/bin/* /usr/bin/
sudo cp ~/.cabal/share/* /usr/share -r

# install my data
mkdir -p ~/bin ~/.pandoc
cp pandoc_md.sh ~/bin/
cp -r pandoc_css ~/.pandoc/
cp -r ~/.cabal/share/pandoc*/data/* ~/.pandoc/
cp -r templates ~/.pandoc/
