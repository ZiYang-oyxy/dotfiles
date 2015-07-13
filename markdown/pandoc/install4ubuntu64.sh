#!/bin/bash

P=`readlink -f $(dirname $0)`

cd $P

## install newest pandoc for 64bit ubuntu
{
sudo apt-get install libyaml-0-2 && \
sudo apt-get install pandoc && \
sudo dpkg -i dep/dpkg/*
} || {
echo "** Install failed"
exit 1
}

mkdir -p ~/bin ~/.pandoc
ln -fs $PWD/pandoc_md.sh ~/bin/pandoc_md.sh
rm -f ~/.pandoc/pandoc_css ~/.pandoc/templates
ln -s $P/pandoc_css ~/.pandoc/pandoc_css
ln -s $P/templates ~/.pandoc/templates
