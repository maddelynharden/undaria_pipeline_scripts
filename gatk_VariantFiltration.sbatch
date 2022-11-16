#!/bin/bash
#SBATCH --job-name=gatk_VariantFiltration
#SBATCH --time=48:00:00
#SBATCH --ntasks-per-node=12
#SBATCH --mem=0
#SBATCH --partition=oneweek
#SBATCH -o %x.out

# Load the GATK module:
cond=~/.conda_for_sbatch.sh
[[ -a "$cond" ]] && source "$cond" || { echo "Error on source of $cond"; exit 1; }

conda activate gatk4

gatk VariantFiltration -R Kr2015_Undaria.pinnatifida_superscaffolds.fasta -V Undaria_Variants.vcf -O Filtered_UnVariants.vcf.gz --filter-name "RMS_MappingQuality_Filter" --filter-expression "MQ < 35.0" --filter-name "MappingQuality_RS_Filter1" --filter-expression "MQRankSum < -12.5" --filter-name "QualityofDepth_Filter" --filter-expression "QD < 25.0" 
