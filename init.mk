#
# Initialization of Make (shell, basic rules, etc.)
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

SHELL=/usr/bin/env bash -eo pipefail
export PATH := ../rase/scripts:../rase/src/rase:$(PATH)

.SECONDARY:
.SUFFIXES:
.PHONY: all clean cleanall help

all:

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean

cleanall: clean ## Clean all

