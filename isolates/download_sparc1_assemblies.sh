#! /usr/bin/env bash

#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

set -f -o pipefail

THREADS=10
SCRIPT_DIR=$(dirname "$0")
FILE="${SCRIPT_DIR}/../published/isolates.2015.tsv"

function download_isolate ()
{
	taxid=$2
	first_cont=$5
	fa=${taxid}.fa
	a=`echo ${first_cont:0:2}`
	b=`echo ${first_cont:2:2}`
	c=`echo ${first_cont:4:2}`
	echo "Downloading isolate $taxid (first contig: $first_cont, a: $a, b: $b)"
	url="ftp://ftp.ncbi.nlm.nih.gov/sra/wgs_aux/${a}/${b}/${a}${b}${c}/${a}${b}${c}.1.fsa_nt.gz"
	curl -s $url | gzip -d > $fa
	test -s $fa
}

export -f download_isolate

parallel -j $THREADS --colsep '\t' --skip-first-line --halt now,fail=1 --no-notice download_isolate :::: ${FILE}

