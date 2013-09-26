#!/bin/bash

sudo sh -c "apt-get install ruby1.8-dev"
sudo sh -c "gem1.8 install json"
sudo sh -c "chmod a+x flavor.rb"
ln -s $PWD/flavor.rb $HOME/bin/flavor
