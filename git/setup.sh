#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`

echo "=== Setup git..."
rm -f ~/.gitconfig
ln -s $DIR/gitconfig ~/.gitconfig
echo "=== Done!"
