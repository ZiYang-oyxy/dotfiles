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

### find

IGNORE_FILE="-name \".repo\" -prune -o -name \".git\" -prune"

function _xfind()
{
	find . $IGNORE_FILE -o -name "*$@*"
}

function _xfindi()
{
	find . $IGNORE_FILE -o -iname "*$@*"
}

find_ed() {
	awk --re-interval -v cmd="$*" -v me="$ME" '
	BEGIN {
		system("clear")
		cmd2 = sprintf("bash -c \"source %s; %s\"", me, cmd)
		while ((cmd2 | getline) > 0) {
			lines[++i] = $0
			printf("[%s] %s\n", i, $0)
		}

		if (i == 0)
			exit

		printf("goto: ")
	}

	{
		num = $1
		if (num > i || num < 1)
			exit

		system(sprintf("vim %s", lines[num]))
		printf("goto: ")
	}
	' -
}

alias xfind="find_ed _xfind"
alias xfindi="find_ed _xfindi"

### grep

FIND='find . -regextype posix-egrep'
SHELL_FILE_PAT_REV="(.*/(Makefile|makefile)|.*\.(c|h|cpp|S|java|xml|mk|lua))"
C_FILE_PAT=".*\.(c|cc|cpp|h)"
MAKE_FILE_PAT="(.*/(Makefile|makefile)|.*\.(mk))"

grep_ed() {
	# EXAMPLE:
	# "./b:7:xgrep a" := [35m[K./b[m[K[36m[K:[m[K[32m[K7[m[K[36m[K:[m[Kxgrep [01;31m[Ka[m[K

	CMD="$1"
	shift

	CMD=$CMD" \\\\\"$*\\\\\""

	awk --re-interval -v cmd="$CMD" -v me="$ME" '
	BEGIN {
		system("clear")
		cmd2 = sprintf("bash -c \"source %s; %s\"", me, cmd)
		while ((cmd2 | getline) > 0) {
			if ($1 == "Binary" && $2 == "file")
				continue
			lines[++i] = $0
			printf("[%s] %s\n", i, $0)
		}

		if (i == 0)
			exit

		printf("goto: ")
	}

	{
		num = $1
		if (num > i || num < 1)
			exit

		file = gensub(/^.{8}([^\033]+).{29}([0-9]+).*/, "\\1", "", lines[num])
		row = gensub(/^.{8}([^\033]+).{29}([0-9]+).*/, "\\2", "", lines[num])

		system(sprintf("vim +%s %s", row, file))
		printf("goto: ")
	}
	' -
}

grep_fact() {
	while [ -n "$1" ]; do
		local _suffix=$1
		eval "alias $1grep=\"grep_ed _$1grep\""
		eval "alias $1grepi=\"grep_ed _$1grepi\""
		shift
	done
}

function _xgrep() {
	$FIND $IGNORE_FILE -o -type f -name "*" -print0 | xargs -0 grep -H --color=always -n "$@"
}

function _xgrepi() {
	$FIND $IGNORE_FILE -o -type f -name "*" -print0 | xargs -0 grep -H -i --color=always -n "$@"
}

function _jgrep()
{
	$FIND $IGNORE_FILE -o  -type f -name "*.java" -print0 | xargs -0 grep -H --color=always -n "$@"
}

function _jgrepi()
{
	$FIND $IGNORE_FILE -o  -type f -name "*.java" -print0 | xargs -0 grep -H -i --color=always -n "$@"
}

function _lgrep()
{
	$FIND $IGNORE_FILE -o -type f -name "*.lua" -print0 | xargs -0 grep -H --color=always -n "$@"
}

function _lgrepi()
{
	$FIND $IGNORE_FILE -o -type f -name "*.lua" -print0 | xargs -0 grep -H -i --color=always -n "$@"
}

function _cgrep()
{
	$FIND $IGNORE_FILE -o -type f -iregex "$C_FILE_PAT" -print0 | xargs -0 grep -H --color=always -n "$@"
}

function _cgrepi()
{
	$FIND $IGNORE_FILE -o -type f -iregex "$C_FILE_PAT" -print0 | xargs -0 grep -H -i --color=always -n "$@"
}

function _sgrep()
{
	$FIND $IGNORE_FILE -o -type f ! -iregex "$SHELL_FILE_PAT_REV" -print0 | xargs -0 grep -H --color=always -n "$@"
}

function _sgrepi()
{
	$FIND $IGNORE_FILE -o -type f ! -iregex "$SHELL_FILE_PAT_REV" -print0 | xargs -0 grep -H -i --color=always -n "$@"
}

function _resgrep()
{
	for dir in `$FIND $IGNORE_FILE -o -name res -type d`; do $FIND $dir -type f -name '*\.xml' -print0 | xargs -0 grep -H --color=always -n "$@"; done;
}

function _resgrepi()
{
	for dir in `$FIND $IGNORE_FILE -o -name res -type d`; do $FIND $dir -type f -name '*\.xml' -print0 | xargs -0 grep -H -i --color=always -n "$@"; done;
}

function _mgrep()
{
	$FIND $IGNORE_FILE -o  -type f -iregex "$MAKE_FILE_PAT" -print0 | xargs -0 grep -H --color=always -n "$@"
}

function _mgrepi()
{
	$FIND $IGNORE_FILE -o  -type f -iregex "$MAKE_FILE_PAT" -print0 | xargs -0 grep -H -i --color=always -n "$@"
}

grep_fact c j l m res s x

function h()
{
	if [[ "$2" = "k" ]]; then
		echo $(($1 / 1024)) KB
	fi

	if [[ "$2" = "m" ]]; then
		echo $(($1 / 1024 / 1024)) MB
	fi

	if [[ "$2" = "g" ]]; then
		echo $(($1 / 1024 / 1024 /1024)) GB
	fi
}
