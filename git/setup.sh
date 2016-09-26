#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`

echo "=== Setup git..."
rm -f ~/.gitconfig
cp $DIR/gitconfig.temp ~/.gitconfig
echo "=== Done!"
