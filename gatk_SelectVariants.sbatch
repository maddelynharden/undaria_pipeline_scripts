#!/bin/bash
#SBATCH --job-name=gatk_SelectVariants
#SBATCH --time=48:00:00
#SBATCH --ntasks-per-node=12
#SBATCH --mem=0
#SBATCH --partition=largemem
#SBATCH -o %x.out

# Load the GATK module:
cond=~/.conda_for_sbatch.sh
[[ -a "$cond" ]] && source "$cond" || { echo "Error on source of $cond"; exit 1; }

conda activate gatk4

gatk SelectVariants -R Kr2015_Undaria.pinnatifida_superscaffolds.fasta -V Filtered_UnVariants.vcf.gz -O Selected_Undaria_Variants.vcf.gz --exclude-filtered
