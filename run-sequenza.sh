#!/bin/bash
#
#$ -cwd

. /etc/bashrc

module load python/2.7.3

pypy /data/home/mpx155/R/packages/3.1.0/sequenza/exec/sequenza-utils.py bam2seqz \
 --fasta /cluster/projects/tiedemannlab/Reference_Files/ref/refdata-GRCh38-2.1.0/genome.fa \
 -n /cluster/projects/tiedemannlab/WES/data/RTBM_199_Buccal_WES_S14_sorted.bam \
 -t /cluster/projects/tiedemannlab/WES/data/RTBM_199T__P6_WES_S13_sorted.bam \
 -gc /cluster/projects/tiedemannlab/Reference_Files/ref/refdata-GRCh38-2.1.0/genome.fa \
 --chromosome chr1 | \
pypy /data/home/mpx155/R/packages/3.1.0/sequenza/exec/sequenza-utils.py binning -w 50 | \
gzip > RTBM_199_Buccal_WES_S14_sorted_vs_Buccal_chr1_bin50.seqz.gz
