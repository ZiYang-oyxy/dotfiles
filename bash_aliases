#!/bin/bash

export PATH=/sbin:~/bin:~/tools:$PATH

TERM=xterm
PS1='╔║${debian_chroot:+($debian_chroot)}\[\033[35m\]\w\[\033[00m\]║═╗\n╚═>> '

# for git information of tmux-powerline
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

alias vi="vim"
alias d="sdcv"

. ~/.bashrc_notrack
. ~/tools/common.sh
