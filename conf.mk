#########
# INDEX #
#########

#index name
name=$(shell basename $(abspath $(CURDIR)/..))

# k-mer size, can contain multiple values
k=18

###############
# BREAKPOINTS #
###############

pen=0.06  # Benzylpenicillin
cro=0.25  # Ceftriaxone
tmp=1.00  # Trimethoprim
ery=0.25  # Erythromycin
tet=1.00  # Tetracycline

############
# PLOTTING #
############
antibiotics=pen cro tmp ery tet
