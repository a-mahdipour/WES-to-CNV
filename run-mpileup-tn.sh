
#!/bin/bash
#
#$ -cwd
#$ -S /bin/bash

. /etc/bashrc

module load samtools/1.2

samtools mpileup -q 1 -f /cluster/projects/ref/refdata-GRCh38-2.1.0/genome.fa \
/cluster/projects/WES/data/Sample_normal_WES_sorted.bam \
/cluster/projects/tiedemannlab/WES/data/Sample_test_WES_sorted.bam

