#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#

. /etc/bashrc

module load samtools/1.2

samtools mpileup −f /cluster/projects/ref/refdata-GRCh38-2.1.0/genome.fa \
−Q 20 \
/cluster/projects/WES/data/Sample_WES_sorted.bam \
| gzip > /cluster/projects/WES/data/Sample_WES_sorted.pileup.gz


