#!/bin/bash
#SBATCH --partition=cegs
#SBATCH --time=20:00:00
#SBATCH --mem=5gb
#SBATCH --cpus-per-task=12


source activate bowtie2

bowtie2-build undaria_kr2015/Kr2015_Undaria.pinnatifida_superscaffolds.fasta Kr2015_Undaria.pinnatifida_superscaffolds 

