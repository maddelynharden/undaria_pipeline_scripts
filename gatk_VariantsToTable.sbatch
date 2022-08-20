#!/bin/bash
#SBATCH --job-name=gatk_VariantsToTable
#SBATCH --time=48:00:00
#SBATCH --ntasks-per-node=12
#SBATCH --mem=0
#SBATCH --partition=largemem
#SBATCH -o %x.out

# Load the GATK module:
source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh
conda activate gatk4

gatk VariantsToTable -R Kr2015_Undaria.pinnatifida_superscaffolds.fasta -V Undaria_maf_hwe_mm.vcf -F CHROM -GF MQRankSum -GF FS -GF AN -GF AF  -GF AD -GF MQ -GF QD -GF DP  -O undaria_snps.table
