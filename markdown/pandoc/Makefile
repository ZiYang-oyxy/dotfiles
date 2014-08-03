# build html file from pandoc's extended markdown file
#
# Author: ie7unnel <oywymail@163.com>
#

# markdown source files
#  extensions are interpreted as:
#   .md   -- regular toc
#   .mdsb -- toc in sidebar
#   .mdnt -- no toc

#### user-defined variables below
MSRC := $(shell find . -name '*.md' -or -name '*.mdsb' -or -name '*.mdnt' | xargs -i basename {})

CORE_CSS := ~/.pandoc/pandoc_css/ie7unnel.css
SIDEBAR_CSS := ~/.pandoc/pandoc_css/sidebar.css



#### no user-defined variables below

# all html files
HTML1 := $(MSRC:.mdsb=.html)
HTML2 := $(HTML1:.mdnt=.html)
HTML := $(HTML2:.md=.html)

all: $(HTML)

# toc in sidebar
%.html : %.mdsb $(SIDEBAR_CSS)
	pandoc_md.sh -c $(CORE_CSS) -s $(SIDEBAR_CSS) $<

# regular toc
%.html : %.md
	pandoc_md.sh -r -c $(CORE_CSS) $<

# no toc
%.html : %.mdnt
	pandoc_md.sh -n -c $(CORE_CSS) $<

clean:
	rm -f $(HTML)
