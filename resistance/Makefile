#
# Create RASE metadata table from user-provided MICs and breakpoints.
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

.PHONY: step1 step2 step3 step4 step5

include ../*.mk

all: .res_cat.complete

.res_cat.complete:
	$(MAKE) step1
	$(MAKE) step2
	$(MAKE) step3
	$(MAKE) step4
	$(MAKE) step5
	touch $@

step1: ## Print order of leaves to a file (to keep the same order everywhere)
	rase_db_tree_print_order.py -i ../tree/tree.newick > _leaves.tsv

step2: ## Assemble metadata tables

	# sort metadata tables
	cat ../published/isolates.2013.tsv | sort_with_header.sh -k 3 > _isolates.2013.tsv
	cat ../published/isolates.2015.tsv | sort_with_header.sh -k 2 > _isolates.2015.tsv

	# check if taxids are the same
	cut -f3 _isolates.2013.tsv | tail -n +2 > _taxids1.txt
	cut -f2 _isolates.2015.tsv | tail -n +2 > _taxids2.txt
	cut -f1 _leaves.tsv        | tail -n +2 > _taxids3.txt
	diff _taxids1.txt _taxids2.txt
	diff _taxids1.txt _taxids3.txt

step3: ## Assign resistance categories (apply breakpoints)
	rase_db_assign_re_cat.py -i _isolates.2013.tsv -t 2 -b $(pen) -m 12 -a pen > _res_cat.pen.tsv
	rase_db_assign_re_cat.py -i _isolates.2013.tsv -t 2 -b $(cro) -m 13 -a cro > _res_cat.cro.tsv
	rase_db_assign_re_cat.py -i _isolates.2013.tsv -t 2 -b $(sxt) -m 14 -a sxt > _res_cat.sxt.tsv
	rase_db_assign_re_cat.py -i _isolates.2013.tsv -t 2 -b $(ery) -m 15 -a ery > _res_cat.ery.tsv
	rase_db_assign_re_cat.py -i _isolates.2013.tsv -t 2 -b $(tet) -m 16 -a tet > _res_cat.tet.tsv

step4: ## Perform ancestral state reconstruction (infer missing resistance categories)
	for ant in $(antibiotics); do \
		echo "Ancestral state reconstruction: $$ant"; \
		rase_db_ancestral_state_reconstruction.py --antibiotic $$ant --in-tsv "_res_cat.$$ant.tsv" --tree ../tree/tree.newick > __res_cat.$$ant.tsv; \
	done

step5: ## Assemble metadata file
	paste \
		<(echo "taxid"; cat _taxids1.txt) \
		<(cut -f 13  _isolates.2015.tsv | sed 's/Sequence Cluster/pg/g') \
		<(cut -f 2   _leaves.tsv) \
		<(cut -f 9   _isolates.2015.tsv | sed 's/Serotype From Reads/serotype/g') \
		<(cut -f 11  _isolates.2015.tsv | sed 's/Sequence Type From Reads/ST/g') \
		$(foreach ant, $(antibiotics),<(cut -f 2-4 __res_cat.$(ant).tsv) ) \
	> res_cat.tsv

clean:
	rm -f _*.{tsv,txt} .*.complete *.pdf

cleanall:
	rm -f *.tsv
