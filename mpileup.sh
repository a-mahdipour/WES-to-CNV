#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#

. /etc/bashrc

module load samtools/1.2

samtools mpileup −f /cluster/projects/ref/refdata-GRCh38-2.1.0/genome.fa \
−Q 20 \
/cluster/projects/tiedemannlab/WES/data/RTBM_199_Buccal_WES_S14_sorted.bam \
| gzip > /cluster/projects/tiedemannlab/WES/data/RTBM_199_Buccal_WES_S14_sorted.pileup.gz


