#!/bin/bash
#SBATCH --partition=cegs
#SBATCH --time=10:00:00
#SBATCH --mem=5gb
#SBATCH --cpus-per-task=12

fastqc -t 12 -o fastqc wgs/${1}

