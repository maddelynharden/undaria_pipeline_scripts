#!/bin/bash
#SBATCH --job-name=gatk_markdupes
#SBATCH --time=48:00:00
#SBATCH --ntasks-per-node=12
#SBATCH --mem=0
#SBATCH --partition=cegs
#SBATCH -o %x_%a.out
#SBATCH --array=1-41

# Load the GATK module:
source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh
conda activate gatk4

#set variables
sample_id=$(cat wgs/samples_file.txt | sed -n ${SLURM_ARRAY_TASK_ID}p)

# Start GATK
gatk MarkDuplicatesSpark -I ${sample_id}.RG.sorted.bam -O ${sample_id}.mark_dupes.bam -M ${sample_id}.metrics








