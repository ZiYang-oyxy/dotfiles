#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`

echo "=== Setup bash..."
rm -f ~/.bash_aliases
rm -f ~/.bashrc
rm -f ~/.profile
ln -s $DIR/.bash_aliases ~/.bash_aliases
ln -s $DIR/.bashrc ~/.bashrc
ln -s $DIR/.profile ~/.profile
if [[ ! -e ~/.bashrc_ignored ]]; then
	cp -f $DIR/.bashrc_ignored ~/.bashrc_ignored
fi
echo "=== Done!"
