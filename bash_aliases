#!/bin/bash

export PATH=/sbin:~/bin:~/tools:$PATH

PS1='╔║${debian_chroot:+($debian_chroot)}\[\033[30;44m\]\w/\[\033[00m\]║═╗\n╚═>> '

# for git information of tmux-powerline
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

alias vi="vim"
alias d="sdcv"

. ~/.bashrc_notrack
. ~/tools/common.sh
