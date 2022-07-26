#!/bin/bash
#SBATCH --partition=cegs
#SBATCH --time=02:00:00
#SBATCH --mem=50gb
#SBATCH --cpus-per-task=12
#SBATCH -J samtoolssort
#SBATCH -o %x_%a.out
#SBATCH --array=1-41

source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh

conda activate samtools


sample_id=$(cat wgs/samples_file.txt | sed -n ${SLURM_ARRAY_TASK_ID}p)

samtools sort -@ 12 -m 3G -o ${sample_id}.sam.sorted.sam ${sample_id}.sam
