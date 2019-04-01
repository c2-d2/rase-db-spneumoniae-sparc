#
# Configuration file for a RASE database. Defines k-mer size resistance
# breakpoints for individual antibiotics and the order of antibiotics for
# plotting.
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#


#########
# INDEX #
#########

#db name
name=spneumoniae-sparc

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
