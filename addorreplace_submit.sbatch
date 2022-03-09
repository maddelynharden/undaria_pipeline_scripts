#!/bin/bash
#SBATCH -o %x_%a.out
#SBATCH -J addorreplace
#SBATCH -p cegs
#SBATCH --time=10:00:00
#SBATCH --mem=50gb
#SBATCH --ntasks-per-node=12

# Load the GATK module:
source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh
conda activate gatk4

#set variables
sample_id=$(cat wgs/samples_file.txt | sed -n ${SLURM_ARRAY_TASK_ID}p)
sample_fastq=${sample_id}_1_P.fastq.gz
rg_options=$(python /scratch/mharden/undaria_variation/undaria_pipeline_scripts/parse_RG.py $sample_fastq) 

# Start GATK

gatk AddOrReplaceReadGroups -I ${sample_id}.sorted.bam -O ${sample_id}.RG.sorted.bam $rg_options

