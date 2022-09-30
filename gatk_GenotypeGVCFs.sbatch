#!/bin/bash
#BATCH --job-name=gatk_GenomicsDBImport
#SBATCH --time=16:00:00
#SBATCH --ntasks-per-node=12
#SBATCH --mem=0
#SBATCH --partition=largemem
#SBATCH -o %x_%a.out
#SBATCH --array=1-33
#SBATCH --account=noujdine_61

# Load the GATK module:
source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh
conda activate gatk4

#set variables
list_id=$(ls interval_list_33 |sed -n ${SLURM_ARRAY_TASK_ID}p)


# Start GATK
gatk GenotypeGVCFs -R Kr2015_Undaria.pinnatifida_superscaffolds.fasta --sequence-dictionary Kr2015_Undaria.pinnatifida_superscaffolds.dict -V gendb://${list_id}_data -O ${list_id}.vcf.gz



