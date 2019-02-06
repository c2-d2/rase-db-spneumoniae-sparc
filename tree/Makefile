#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#
#
.PHONY: all help clean cleanall
.SECONDARY:
.SUFFIXES:

SHELL=/usr/bin/env bash -eo pipefail

include ../conf.mk

all: .complete

.complete:
	../rase/rase/rase_db_prepare_tree.py \
		-i ../published/SPARC.core_genes.tree \
		-o tree.newick \
		-m ../published/isolates.2013.tsv \
		-n 2 \
		-t 2 \
		-p 3

	touch $@


help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean
	rm -f _*.newick .complete

cleanall: clean
	rm -f *.newick
