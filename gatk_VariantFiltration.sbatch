#!/bin/bash
#SBATCH --job-name=gatk_VariantFiltration
#SBATCH --time=48:00:00
#SBATCH --ntasks-per-node=12
#SBATCH --mem=0
#SBATCH --partition=largemem
#SBATCH -o %x.out

# Load the GATK module:
source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh
conda activate gatk4

gatk VariantFiltration -R Kr2015_Undaria.pinnatifida_superscaffolds.fasta -V Undaria_Variants.vcf -O Filtered_UnVariants.vcf.gz --filter-name "RMS_MappingQuality_Filter" --filter-expression "MQ < 40.0" --filter-name "MappingQuality_RS_Filter1" --filter-expression "MQRankSum < -" --filter-name "QualityofDepth_Filter" --filter-expression "QD < 25.0" 
