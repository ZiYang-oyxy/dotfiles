#!/bin/bash
#
# a tool for converting pandoc's markdown easily
#
# Author: ie7unnel <oywymail@163.com>

usage() {
	cat <<EOF
Usage: pandoc_md.sh [options] [markdown_files]...
  OPTIONS:
      -c CORE_CSS               core css file path
      -s SIDEBAR_CSS            sidebar css file path
      -r                        output html with regular toc
      -n                        output html without toc

  By default, pandoc_md.sh converts pandoc's markdown files to
  html files embedded a sidebar.
EOF
	exit 1
}

CORE_CSS=~/.pandoc/pandoc_css/ie7unnel.css
SIDEBAR_CSS=~/.pandoc/pandoc_css/sidebar.css
T=t.html
TOC=--toc

while getopts ":c:s:rn" OPTION
do
	case $OPTION in
	c ) CORE_CSS="$OPTARG";;
	s ) SIDEBAR_CSS="$OPTARG";;
	r ) SIDEBAR_CSS="" && T="default";;
	n ) TOC="" && SIDEBAR_CSS="" && T="default";;
	* ) usage
	esac
done

if [ -z "$CORE_CSS" ]; then
	CSS_C=""
else
	CSS_C="-c "$CORE_CSS""
fi

if [ -z "$SIDEBAR_CSS" ]; then
	CSS_S=""
else
	CSS_S="-c "$SIDEBAR_CSS""
fi

shift $(( $OPTIND - 1 ))
[ -z "$1" ] && echo "need markdown files" && usage

for arg in "$@"; do
	echo "converting "$arg""

echo "pandoc \
-f markdown+ignore_line_breaks \
-t html "$arg" > "${arg%.*}".html \
"$CSS_C" \
"$CSS_S" \
"$TOC" \
--template="$T" \
--number-sections \
--highlight-style=haddock \
--self-contained" | tee /tmp/pdtmp && sh < /tmp/pdtmp

	if [ "$?" -eq 0 ]; then
		echo "output: create "$arg".html"
	else
		echo "output: convert "${arg%.*}" failed!"
	fi
	echo
done
