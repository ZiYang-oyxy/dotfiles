#!/bin/bash
#
# powerful pandoc markdown converter
#
# Author: OuyangXY <hh123okbb@gmail.com>

usage() {
	cat <<EOF
Usage: pandoc_md.sh [options] [markdown_files]...
  OPTIONS:
      -c CORE_CSS               core css file path
      -s SIDEBAR_CSS            sidebar css file path
      -a ACCON_CSS              accondion css file path
      -r                        output html with regular toc
      -n                        output html without toc
      -p                        pure html without any css

  By default, pandoc_md.sh converts pandoc's markdown files to
  html files embedded a sidebar.
EOF
	exit 1
}

# CORE_CSS=~/.pandoc/pandoc_css/ie7unnel.css
# SIDEBAR_CSS=~/.pandoc/pandoc_css/sidebar.css

# custom for TP-LINK release
CORE_CSS=~/.pandoc/pandoc_css/tplink.css
SIDEBAR_CSS=~/.pandoc/pandoc_css/tplink_sidebar.css
ACCON_CSS=~/.pandoc/pandoc_css/tplink_accondion.css

T=t.html
TOC=--toc

while getopts ":c:s:a:rnp" OPTION
do
	case $OPTION in
	c ) CORE_CSS="$OPTARG";;
	s ) SIDEBAR_CSS="$OPTARG";;
	a ) ACCON_CSS="$OPTARG";;
	r ) SIDEBAR_CSS="";;
	n ) TOC="" && SIDEBAR_CSS="";;
	p ) CORE_CSS="" && SIDEBAR_CSS="";;
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

if [ -z "$ACCON_CSS" ]; then
	CSS_A=""
else
	CSS_A="-c "$ACCON_CSS""
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
"$CSS_A" \
"$TOC" \
--template="$T" \
--number-sections \
--highlight-style=haddock \
--self-contained" | tee /tmp/pdtmp && sh < /tmp/pdtmp

	if [ "$?" -eq 0 ]; then
		echo "output: create "${arg%.*}".html"
	else
		echo "output: convert "$arg" failed!"
	fi
	echo
done
