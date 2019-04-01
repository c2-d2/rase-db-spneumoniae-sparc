#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../*.mk

all: .plot.complete .stats.complete .merge.mic.complete .merge.res_tree.complete

.plot.complete: $(foreach ant,$(antibiotics),.plot.$(ant).complete)

.stats.complete:
	../../scripts/compute_stats.py ../resistance/res_cat.tsv > $(name).phylogroups.tsv
	touch $@

.plot.%.complete:
	plot_mic.R ../resistance/res_cat.tsv -b $($*) $* res_cat.$*.basic.pdf
	reproducible_pdf.sh                              res_cat.$*.basic.pdf
	plot_mic.R -z ../resistance/res_cat.tsv -b $($*) $* res_cat.$*.zoomed.pdf
	reproducible_pdf.sh                                 res_cat.$*.zoomed.pdf
	touch $@

.merge.mic.complete: .plot.complete
	/usr/bin/env gs \
		-sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default \
		-dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 \
		-dAutoRotatePages=/None \
		-sOutputFile=$(name).mic.pdf \
		$(foreach ant,$(antibiotics),res_cat.$(ant).zoomed.pdf)

	../../scripts/reproducible_pdf.sh $(name).mic.pdf
	touch $@

.merge.res_tree.complete: $(wildcard ../resistance/_res_tree.*.pdf)
	/usr/bin/env gs \
		-sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default \
		-dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 \
		-dAutoRotatePages=/None \
		-sOutputFile=$(name).res_tree.pdf \
		$(foreach ant,$(antibiotics),../resistance/_res_tree.$(ant).pdf)

	../../scripts/reproducible_pdf.sh $(name).res_tree.pdf
	touch $@

clean:
	rm -f res_cat.*.pdf .*.complete
	rm -f res_tree.*.pdf

cleanall: clean
	rm -f *.pdf *.tsv
