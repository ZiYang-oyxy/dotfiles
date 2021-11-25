#!/bin/bash -xve

source ~/dotfiles/_common.source

bash $DIR/bash/setup.sh

mkdir -p $DIR/.repo

log "Setup tools..."
if [[ -d ~/tools ]]; then
    rm -rf ~/tools.bak
    mv ~/tools ~/tools.bak
fi
ln -s $DIR/tools ~/tools
bash $DIR/tools/setup.sh

bash $DIR/vim/setup.sh

bash $DIR/git/setup.sh

bash $DIR/tmux/setup.sh

bash $DIR/autojump/setup.sh

#bash $DIR/fonts/setup.sh

#bash $DIR/markdown/pandoc/install4ubuntu64.sh

# 长按延迟
#xset r rate 220 160

trap - EXIT
log "Done!"
