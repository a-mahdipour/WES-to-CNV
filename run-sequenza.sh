
#!/bin/bash
#
#$ -cwd

. /etc/bashrc

module load python/2.7.3

pypy /data/home/R/packages/3.1.0/sequenza/exec/sequenza-utils.py bam2seqz \
 --fasta /cluster/projects/ref/refdata-GRCh38-2.1.0/genome.fa \
 -n /cluster/projects/WES/data/RTBM_199_Buccal_WES_S14_sorted.bam \
 -t /cluster/projects/WES/data/RTBM_199T__P6_WES_S13_sorted.bam \
 -gc /cluster/projects/ref/refdata-GRCh38-2.1.0/genome.fa | \
gzip > Sample_test_vs_normal_chr1_bin50.seqz.gz

