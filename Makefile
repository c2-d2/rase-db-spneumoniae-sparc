#
# This is the main Makefile for constructing RASE databases. It specifies the
# order in which individual subdirectories with own Makefiles will be invoked.
# This file is to be symlinked.
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

DIRS=tree isolates resistance index _output published unpublished
ALLDIRS=$(DIRS) plots

.PHONY: data cluster plots $(DIRS) output

include *.mk

all: $(DIRS)

data: published unpublished ## Prepare published and unpublished data

tree: data ## Prepare phylogenetic tree
	$(MAKE) -C tree

isolates: data ## Download isolates
	$(MAKE) -C isolates

resistance: tree data ## Process resistance data
	$(MAKE) -C resistance

plots: ## Generate plots
	$(MAKE) -C plots

index: tree isolates ## Construct ProPhyle k-mer index
	$(MAKE) -C index

output: _output ## Copy database files to _output
_output: index resistance
	$(MAKE) -C _output

published: ## Download and process published data
	$(MAKE) -C published

unpublished: ## Verify that unpublished data were properly copied
	$(MAKE) -C unpublished

cluster: ## Submit RASE DB construction to cluster
	snakemake --cores 9999 -p \
		--cluster-config ../cluster.json \
		--cluster 'sbatch -p {cluster.queue} -n {cluster.n} -t {cluster.time} --mem={cluster.memory}'

clean:
	for x in $(ALLDIRS); do \
		$(MAKE) -C $$x clean; \
	done

cleanall:
	for x in $(ALLDIRS); do \
		$(MAKE) -C $$x cleanall; \
	done
