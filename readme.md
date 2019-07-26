# *Streptococcus pneumoniae* RASE database

## Dataset

We used 616 pneumococcal genomes from a carriage study in Massachusetts children \[[Croucher *et al.* 2013](https://www.ncbi.nlm.nih.gov/pubmed/23644493), [Croucher *et al.* 2015](https://www.nature.com/articles/sdata201558)\]. The datasets comprises draft genome assemblies from Illumina HiSeq reads, resistance data, and lineages inferred from sequence cluster computed using [BAPS](http://www.helsinki.fi/bsg/software/BAPS/).


## Methods

The *S. pneumoniae* RASE database was constructed with the [EUCAST breakpoints](http://www.eucast.org/clinical_breakpoints/) ([mg/L]): ceftriaxone (CRO): 0.25, erythromycin (ERY): 0.25, benzylpenicillin (PEN): 0.06, trimethoprim-sulfamethoxazole (SXT): 1.00, and tetracycline (TET): 1.00.

The draft assemblies  were downloaded from the SRA FTP server using the accession codes provided in [Table 1](https://www.nature.com/articles/sdata201558/tables/1) of \[[Croucher *et al.* 2015](https://www.nature.com/articles/sdata201558)\].  The phylogenetic tree was downloaded from [DataDryad](https://datadryad.org/handle/10255/dryad.83423). The pneumococcal ProPhyle index was constructed with the *k*-mer size *k=18*.


## Issues

Please use [Github issues](https://github.com/c2-d2/rase-db-spneumoniae-sparc/issues).


## Releases and changelog

See [Github releases](https://github.com/c2-d2/rase-db-spneumoniae-sparc/releases).


## License

[MIT](LICENSE).


## Contact

[Karel Brinda](https://scholar.harvard.edu/brinda) \<kbrinda@hsph.harvard.edu\>
