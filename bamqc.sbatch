#!/bin/bash
#SBATCH --partition=cegs
#SBATCH --time=20:00:00
#SBATCH --mem=15gb
#SBATCH --cpus-per-task=12

source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh

conda activate qualimap

#define the variable
shortid=`echo $1 | sed 's/_.*//g'`

qualimap bamqc -bam ${1}.sorted.bam -outdir ${shortid}_bamqc_results --java-mem-size=14G
