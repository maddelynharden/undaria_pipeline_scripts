#!/bin/bash
#SBATCH --partition=cegs
#SBATCH --time=10:00:00
#SBATCH --mem=5gb
#SBATCH --cpus-per-task=12
#SBATCH --mail-type=FAIL

source activate trim

trimmomatic PE -threads 12 -phred33 \
wgs/${1}_1.fastq.gz wgs/${1}_2.fastq.gz \
wgs/${1}_1_P.fastq.gz wgs/${1}_1_U.fastq.gz \
wgs/${1}_2_P.fastq.gz wgs/${1}_2_U.fastq.gz \
ILLUMINACLIP:/project/noujdine_61/common_resources/Trimmomatic_adapters_v0.39/TruSeq3-PE.fa:2:30:10:2:keepBothReads \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:5:20 \
MINLEN:50


