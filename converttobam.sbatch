#!/bin/bash
#SBATCH --partition=cegs
#SBATCH --time=30:00:00
#SBATCH --mem=14gb
#SBATCH --cpus-per-task=12
#SBATCH --array=1-41
#SBATCH -o %x_%a.out
#SBATCH -J converttobam 


source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh

conda activate samtools

sample_id=$(cat wgs/samples_file.txt | sed -n ${SLURM_ARRAY_TASK_ID}p)

samtools view -@ 12 -b -o ${sample_id}.sorted.bam ${sample_id}.sam.sorted.sam
