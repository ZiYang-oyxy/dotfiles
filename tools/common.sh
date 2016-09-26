#!/bin/bash

ME=`readlink -f $BASH_SOURCE`
LOG_NAME="oyxy"
VPS="45.32.74.56"
#VPS="108.61.207.141"
PORT="22222"

function hanssh()
{
	if [ "$1" = "-k" ]
	then
		sudo kill $(pidof hans)
	else
		sudo hans -c $VPS -p wtmjsysww -n $LOG_NAME -m 800
		sleep 1
		ssh -p $PORT -CNvg -D 127.0.0.1:9090 $LOG_NAME@10.8.8.1
	fi
}

function hanssh1()
{
	ssh -p $PORT -CNvg -D 127.0.0.1:9090 $LOG_NAME@$VPS
}

. ~/tools/xfinder.sh
