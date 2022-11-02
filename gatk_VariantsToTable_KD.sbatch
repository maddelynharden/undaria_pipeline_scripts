#!/bin/bash
#SBATCH --job-name=gatk_VariantsToTable_KD
#SBATCH --time=02:00:00
#SBATCH --ntasks-per-node=12
#SBATCH --mem=30g
#SBATCH --partition=oneweek
#SBATCH -o %x.out

# Load the GATK module:
cond=~/.conda_for_sbatch.sh
[[ -a "$cond" ]] && source "$cond" || { echo "Error on source of $cond"; exit 1; }

conda activate gatk4

gatk VariantsToTable -V Undaria_Variants.vcf \
-O Undaria_Variants.tab \
-F TYPE \
-F QD \
-F MQ \
-F MQRankSum

