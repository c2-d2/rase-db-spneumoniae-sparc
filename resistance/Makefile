#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

.PHONY: all help clean cleanall
.SECONDARY:
.SUFFIXES:

SHELL=/usr/bin/env bash -eo pipefail

include ../conf.mk

# print leave order
TPO=../rase/rase/rase_db_tree_print_order.py
# assign res categories
ARC=../rase/rase/rase_db_assign_re_cat.py
# ancestral state reconstruction
ASR=../rase/rase/rase_db_ancestral_state_reconstruction.py
# sort with header
SWH=../rase/scripts/sort_with_header.sh

all: .res_cat.complete

.res_cat.complete:
	$(TPO) -i ../tree/tree.newick > _leaves.tsv

	# sort metadata tables
	cat ../published/isolates.2013.tsv | $(SWH) -k 3 > _isolates.2013.tsv
	cat ../published/isolates.2015.tsv | $(SWH) -k 2 > _isolates.2015.tsv


	# check if taxids are the same
	cut -f3 _isolates.2013.tsv | tail -n +2 > _taxids1.txt
	cut -f2 _isolates.2015.tsv | tail -n +2 > _taxids2.txt
	cut -f1 _leaves.tsv        | tail -n +2 > _taxids3.txt
	diff _taxids1.txt _taxids2.txt
	diff _taxids1.txt _taxids3.txt


	# assign resistance categories
	$(ARC) -i _isolates.2013.tsv -t 2 -b $(pen) -m 12 -a pen > _res_cat.pen.tsv
	$(ARC) -i _isolates.2013.tsv -t 2 -b $(cro) -m 13 -a cro > _res_cat.cro.tsv
	$(ARC) -i _isolates.2013.tsv -t 2 -b $(tmp) -m 14 -a tmp > _res_cat.tmp.tsv
	$(ARC) -i _isolates.2013.tsv -t 2 -b $(ery) -m 15 -a ery > _res_cat.ery.tsv
	$(ARC) -i _isolates.2013.tsv -t 2 -b $(tet) -m 16 -a tet > _res_cat.tet.tsv

	# ancestral state reconstruction
	for x in _res*.tsv; do \
		ant=$$(echo "$$x" | sed 's/.tsv$$//g' | sed 's/_res_cat\.//g'); \
		$(ASR) -a $$ant -i "$$x" -t ../tree/tree.newick -p "_res_tree.$$ant.pdf" > "_$$x"; \
	done

	# assemble the final file
	paste \
		<(echo "taxid"; cat _taxids1.txt) \
		<(cut -f 13  _isolates.2015.tsv | sed 's/Sequence Cluster/phylogroup/g') \
		<(cut -f 9   _isolates.2015.tsv | sed 's/Serotype From Reads/serotype/g') \
		<(cut -f 11  _isolates.2015.tsv | sed 's/Sequence Type From Reads/ST/g') \
		<(cut -f 2   _leaves.tsv) \
		<(cut -f 2-4 __res_cat.pen.tsv) \
		<(cut -f 2-4 __res_cat.cro.tsv) \
		<(cut -f 2-4 __res_cat.tmp.tsv) \
		<(cut -f 2-4 __res_cat.ery.tsv) \
		<(cut -f 2-4 __res_cat.tet.tsv) \
	> res_cat.tsv

	touch $@

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean
	rm -f _*.{tsv,txt} .*.complete *.pdf

cleanall: clean ## Clean
	rm -f *.tsv
