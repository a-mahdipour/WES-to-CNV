# WES-to-CNV

_Providing required files in shell starting from WES data to detect copy number variations_
---

This Repo covers the following steps in generating CNVs from WES data. To this end, follow the bellow steps :

1- Starting from the sorted BAM file of WES, using _run-mpileup.sh_ one may convert it to an pileup data. For the main functions and more infor please see https://github.com/dnanexus/samtools_mpileup.

2- Moreover, having BAM files of WES for tumor and normal samples, one may run _run-mpileup-tc.sh_ to generate a relative test-to-control pileup file

3- Applying Varscan2 to detect the copy number variations (CNV). One may try _run_varscan2.sh_ to find the CNVs of test sample in comarison to the normal control. 

4- To generate the CNV from bam files of test samples relative to a normal control, one may apply the _run-Sequenza.sh_ via using _sequenza-utils.py_ python function to convert BAM files to seqz file and then apply _sequenza_ R package to annotate 
CNVs. For lateron steps and more details see https://github.com/mbourgey/EBI_cancer_workshop_CNV.

5- Using _run-sequenza.sh_ one can also target a specific genomic location via

```
pypy /data/home/R/packages/3.1.0/sequenza/exec/sequenza-utils.py bam2seqz \
 --fasta /cluster/projects/ref/refdata-GRCh38-2.1.0/genome.fa \
 -n /cluster/projects/WES/data/RTBM_199_Buccal_WES_S14_sorted.bam \
 -t /cluster/projects/WES/data/RTBM_199T__P6_WES_S13_sorted.bam \
 -gc /cluster/projects/ref/refdata-GRCh38-2.1.0/genome.fa \
 --chromosome chr1 | \
gzip > Sample_test_vs_normal_WES_chr1.seqz.gz
```



