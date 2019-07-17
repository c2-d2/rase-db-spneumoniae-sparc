include ../*.mk

all: .complete

.complete:
	./download_sparc1_assemblies.sh
	touch $@

cleanall:
	rm -f *.fa .complete

