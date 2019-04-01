#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../*.mk

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

clean:
	rm -f _*.newick .complete

cleanall: clean
	rm -f *.newick
