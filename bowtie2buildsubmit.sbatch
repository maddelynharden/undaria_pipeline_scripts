#!/bin/bash
#SBATCH --partition=cegs
#SBATCH --time=20:00:00
#SBATCH --mem=5gb
#SBATCH --cpus-per-task=12

source /spack/apps/linux-centos7-x86_64/gcc-8.3.0/anaconda3-2019.10-bpb6unkhyvkirwkg44uqchcy5jyhzhvt/etc/profile.d/conda.sh

conda activate bowtie2

bowtie2-build undaria_kr2015/Kr2015_Undaria.pinnatifida_superscaffolds.fasta Kr2015_Undaria.pinnatifida_superscaffolds 

