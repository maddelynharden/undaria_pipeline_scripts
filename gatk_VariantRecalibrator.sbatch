#!/bin/bash
#SBATCH --job-name=gatk_VariantFiltration
#SBATCH --time=48:00:00
#SBATCH --ntasks-per-node=12
#SBATCH --mem=0
#SBATCH --partition=oneweek
#SBATCH -o %x.out

# Load the GATK module:
source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh
conda activate gatk4

gatk VariantFiltration -R Kr2015_Undaria.pinnatifida_superscaffolds.fasta -V Undaria_Variants.vcf -O Filtered_UnVariants.vcf.gz --filter-name "RMS_MappingQuality_Filter" --filter-expression "MQ > 37.0" --filter-name "MappingQuality_RS_Filter" --filter-expression "MQRankSum < 2.0" --filter-name "QualityofDepth_Filter" --filter-expression "DP < 10.0" 
