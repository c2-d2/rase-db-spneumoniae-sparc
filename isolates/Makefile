include ../*.mk

all: .complete

.complete:
	./download_sparc1_assemblies.sh
	touch $@

clean:
	rm -f *.fa .complete

