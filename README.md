# CNVfromWES
Providing CNV curve from WES data.


CNV from WES: using sequence:




#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash
#

. /etc/bashrc

module load samtools/1.2

samtools mpileup −f /cluster/projects/tiedemannlab/Reference_Files/ref/refdata-GRCh38-2.1.0/genome.fa −Q 20 /cluster/projects/tiedemannlab/WES/data/RTBM_199_Buccal_WES_S14_sorted.bam | gzip > /cluster/projects/tiedemannlab/WES/data/RTBM_199_Buccal_WES_S14_sorted.pileup.gz


samtools mpileup -d 8000 −f /cluster/projects/tiedemannlab/Reference_Files/ref/refdata-GRCh38-2.1.0/genome.fa −Q 20 /cluster/projects/tiedemannlab/RTBM_199T__P6_WES_S13_sorted.bam | gzip > /cluster/projects/tiedemannlab/RTBM_199T__P6_WES_S13_sorted.pileup.gz


1- Having BAM files of Tumor and Normal cells, we run mpileup to generate a pileup file

samtools mpileup -q 1 -f /cluster/projects/tiedemannlab/Reference_Files/ref/refdata-GRCh38-2.1.0/genome.fa /cluster/projects/tiedemannlab/WES/data/RTBM_199_Buccal_WES_S14_sorted.bam /cluster/projects/tiedemannlab/WES/data/RTBM_199T__P6_WES_S13_sorted.bam


2-Varscan2 CopyNumber

java -jar /cluster/tools/software/varscan/2.3.6/VarScan.jar copynumber mPileupFile outputFile –mpileup 1 –data-ratio x.x


java -jar /cluster/tools/software/varscan/2.3.6/VarScan.jar copynumber run_mpileup_tumor_vs_normal.sh.o213767 /cluster/projects/tiedemannlab/WES/data/mpileup/RTBM_199T__P6_WES_S13_sorted.varscan –mpileup 1 –data-ratio 0.21





#!/bin/bash
#
#$ -cwd

. /etc/bashrc

module load varscan/2.3.6
module load gatk/3.0-0

java -jar /cluster/tools/software/varscan/2.3.6/VarScan.jar copynumber \ 
/cluster/projects/tiedemannlab/WES/data/mpileup/RTBM_199T__P6_WES_vs_RTBM_199_Buccal_WES_S14.mpileup.bcf \ 
/cluster/projects/tiedemannlab/WES/data/varscan2/RTBM_199T__P6_WES_vs_RTBM_199_Buccal_WES_S14.mpileup.copynumber \ 
 –mpileup 1 –data-ratio 0.21


BAM to seqz


pypy /data/home/mpx155/R/packages/3.1.0/sequenza/exec/sequenza-utils.py bam2seqz \
 --fasta /cluster/projects/tiedemannlab/Reference_Files/ref/refdata-GRCh38-2.1.0/genome.fa \
 -n /cluster/projects/tiedemannlab/WES/data/RTBM_199_Buccal_WES_S14_sorted.bam \
 -t /cluster/projects/tiedemannlab/WES/data/RTBM_199T__P6_WES_S13_sorted.bam \
 -gc /cluster/projects/tiedemannlab/Reference_Files/ref/refdata-GRCh38-2.1.0/genome.fa \
 --chromosome chr1 | \
pypy /data/home/mpx155/R/packages/3.1.0/sequenza/exec/sequenza-utils.py binning -w 50 | \
gzip > RTBM_199_Buccal_WES_S14_sorted_vs_Buccal_chr1_bin50.seqz.gz


