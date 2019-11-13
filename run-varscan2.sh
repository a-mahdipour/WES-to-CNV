
#!/bin/bash
#
#$ -cwd

. /etc/bashrc

module load varscan/2.3.6
module load gatk/3.0-0

java -jar /cluster/tools/software/varscan/2.3.6/VarScan.jar copynumber \ 
/cluster/projects/WES/data/mpileup/sample_test_vs_normal_WES.mpileup.bcf \ 
/cluster/projects/WES/data/varscan2/sample_test_vs_normal_WES.mpileup.copynumber \ 
 –mpileup 1 –data-ratio 0.21
 
 
