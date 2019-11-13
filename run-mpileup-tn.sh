#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash

. /etc/bashrc

module load samtools/1.2

samtools mpileup -q 1 -f /cluster/projects/tiedemannlab/Reference_Files/ref/refdata-GRCh38-2.1.0/genome.fa /cluster/projects/tiedemannlab/WES/data/RTBM_199_Buccal_WES_S14_sorted.bam /cluster/projects/tiedemannlab/WES/data/RTBM_199T__P6_WES_S13_sorted.bamx
