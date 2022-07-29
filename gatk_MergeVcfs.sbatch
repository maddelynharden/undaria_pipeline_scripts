#!/bin/bash
#BATCH --job-name=gatk_MergeVcfs
#SBATCH --time=4-0
#SBATCH --mem=0
#SBATCH --partition=largemem
#SBATCH -o %x.out
#SBATCH --account=noujdine_61

# Load the GATK module:
source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh
conda activate gatk4

#set variables
if [ -f list_vcfs_to_merge.txt ]; then
  rm list_vcfs_to_merge.txt
fi
for interval in $(ls interval_list_33)
do 
  echo "${interval}.sorted.vcf.gz" >> list_vcfs_to_merge.txt
done


# Start GATK
gatk MergeVcfs -R Kr2015_Undaria.pinnatifida_superscaffolds.fasta --SEQUENCE_DICTIONARY Kr2015_Undaria.pinnatifida_superscaffolds.dict -I list_vcfs_to_merge.txt -O Undaria_Variants.vcf
