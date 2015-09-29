#!/bin/bash

set -e

DIR=`readlink -f $(dirname $0)`

echo "=== Setup bash..."
rm -f ~/.bash_aliases
ln -s $DIR/bash_aliases ~/.bash_aliases
echo "=== Done!"
