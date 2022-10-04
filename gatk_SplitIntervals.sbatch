#!/bin/bash
#BATCH --job-name=gatk_SplitIntervals
#SBATCH --time=16:00:00
#SBATCH --ntasks-per-node=12
#SBATCH --mem=0
#SBATCH --partition=oneweek
#SBATCH -o %x.out
#SBATCH --account=noujdine_61


# Load the GATK module:
source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh
conda activate gatk4


# Start GATK
gatk SplitIntervals -R Kr2015_Undaria.pinnatifida_superscaffolds.fasta --sequence-dictionary Kr2015_Undaria.pinnatifida_superscaffolds.dict -O interval_list_33 --scatter-count 33 

