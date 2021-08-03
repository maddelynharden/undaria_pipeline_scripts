#!/bin/bash
#SBATCH --partition=cegs
#SBATCH --time=20:00:00
#SBATCH --mem=10gb
#SBATCH --cpus-per-task=12

source activate bowtie2

bowtie2 -x Kr2015_Undaria.pinnatifida_superscaffolds -1 ${1}_1_P.fastq.gz -2 ${1}_2_P.fastq.gz -p 12 -S ${1}.sam



