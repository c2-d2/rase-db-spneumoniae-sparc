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
# ANTIBIOTICS #
###############

antibiotics=cro ery pen sxt tet

###############
# BREAKPOINTS #
###############

cro=0.25  # Ceftriaxone
ery=0.25  # Erythromycin
pen=0.06  # Benzylpenicillin
sxt=1.00  # Trimethoprim-sulfamethoxazole
tet=1.00  # Tetracycline
