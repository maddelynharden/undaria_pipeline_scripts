#!/bin/bash
#SBATCH --partition=cegs
#SBATCH -J bowtie2
#SBATCH -o %x_%a.out
#SBATCH --time=2-0
#SBATCH --mem=30gb
#SBATCH --cpus-per-task=12
#SBATCH --array=1-41

source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh

conda activate bowtie2

sample_id=$(cat wgs/samples_file.txt | sed -n ${SLURM_ARRAY_TASK_ID}p)

bowtie2 -x Kr2015_Undaria.pinnatifida_superscaffolds -1 ${sample_id}_1_P.fastq.gz -2 ${sample_id}_2_P.fastq.gz -p 12 -S ${sample_id}.sam


