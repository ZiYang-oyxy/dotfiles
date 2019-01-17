#!/bin/bash

# pack
#cd ~/ && tar --exclude='.git' --exclude='./ziyang_dotfile/.vim/undodir' -zcf ./ziyang_dotfile.tgz ./ziyang_dotfile && ad put ziyang_dotfile.tgz && ad put ./ziyang_dotfile/ziyang_dotfile.sh && cd -

# install
#bash <(curl -s http://airdrop.oss-cn-hangzhou-zmf.aliyuncs.com/files%2Fziyang_dotfile.sh) && source ~/.bashrc

# ~/ziyang_dotfile filelist
#.gdbinit
#.gdbinit.d/
#.gdbrc
#.tmux.conf
#.ziyang_bashrc
#.ziyang_vim/
#.ziyang_vimrc
#FlameGraph/
#bin/
#xfinder.source
#ziyang_dotfile.sh


# ========= common start ==========

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

fini(){
    printf "${RED}Aborted!${NC}\n"
    trap - EXIT
    exit 1
}

log(){
    printf "${GREEN}$@${NC}\n"
}

_ln(){
    if [[ -e "$2" ]]; then
        mv -f $2 $2.bak
    fi
    ln -sf $1 $2
}

trap fini EXIT INT TERM

# ========= common end ==========

set -ex
log "Install ziyang_dotfile..."

curl http://airdrop.oss-cn-hangzhou-zmf.aliyuncs.com/files%2Fziyang_dotfile.tgz -o ~/ziyang_dotfile.tgz
rm -rf ~/ziyang_dotfile
tar xf ~/ziyang_dotfile.tgz -C ~/

if ! type ctags >/dev/null 2>&1; then
    sudo yum -y install ctags
fi

if ! type cscope >/dev/null 2>&1; then
    sudo yum -y install cscope
fi

#if ! type tmux >/dev/null 2>&1; then
#    sudo yum -y install tmux
#fi

grep ziyang_bashrc ~/.bashrc || echo "source ~/ziyang_dotfile/.ziyang_bashrc" >> ~/.bashrc

_ln ~/ziyang_dotfile/.gdbinit.d ~/.gdbinit.d
_ln ~/ziyang_dotfile/.gdbinit ~/.gdbinit

trap - EXIT
log "Install finished!"
