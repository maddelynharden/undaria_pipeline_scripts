#!/bin/bash
#SBATCH --job-name=gatk_VariantsToTable_KD
#SBATCH --time=02:00:00
#SBATCH --ntasks-per-node=12
#SBATCH --mem=30g
#SBATCH --partition=oneweek
#SBATCH -o %x.out

# Load the GATK module:
source ~/bin/anaconda3/etc/profile.d/conda.sh
conda activate gatk

gatk VariantsToTable -V Undaria_Variants.vcf \
-O Undaria_Variants.tab \
-F TYPE \
-F QD \
-F MQ \
-F MQRankSum

