#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`

echo "=== Setup git..."
rm -f ~/.gitconfig
ln -s $DIR/.gitconfig ~/.gitconfig
if [[ ! -e ~/.gitconfig_ignored ]]; then
	cp -f $DIR/.gitconfig_ignored ~/.gitconfig_ignored
fi
echo "=== Done!"
