
SHELL=/bin/bash
cleanup?=0

# witness is passed as e.g.: witness="10 2 5"

copy:
	./copy.sh $(name)

compile:
	./compile.sh $(name)

setup:
	./setup.sh $(name)

proof:
	./proof.sh $(name)

witness:
	./witness.sh $(name) $(witness)

witnessoutput:
	./witnessoutput.sh $(name)

verifier:
	./verifier.sh $(name)

generate:
	./generate.sh $(name) $(witness)

clear:
	./clear.sh $(name)

mightcleanup:
	@if [ $(cleanup) = 1 ] || [[ $(cleanup) = true ]]; then make clear; fi;

retrieve:
	./retrieve.sh $(name)
	make mightcleanup

full:
	make copy
	make generate
	make retrieve
	make mightcleanup
