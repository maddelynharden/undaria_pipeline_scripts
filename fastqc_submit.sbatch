#!/bin/bash
#SBATCH --partition=cegs
#SBATCH --time=10:00:00
#SBATCH --mem=5gb
#SBATCH --cpus-per-task=12

source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh

conda activate fastqc_env

#set variables
outdir=fastqc
datadir=wgs
sample_id=$1

# Create FASTQC output directory (if needed)
if [[ -d $outdir ]]
then
  printf "Detected output directory ${outdir}.\n\n"
else
  printf "Creating output directory ${outdir}.\n\n"
  mkdir $outdir 
fi

fastqc -t 12 -o $outdir ${datadir}/${sample_id}_1.fastq.gz ${datadir}/${sample_id}_2.fastq.gz 

