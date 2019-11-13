#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash

. /etc/bashrc

module load samtools/1.2

java -jar /cluster/tools/software/varscan/2.3.6/VarScan.jar copynumber run_mpileup_tumor_vs_normal.sh.o213767 /cluster/projects/tiedemannlab/WES/data/mpileup/RTBM_199T__P6_WES_S13_sorted.varscan –mpileup 1 –data-ratio 0.21
