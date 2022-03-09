#!/bin/bash
#SBATCH --job-name=gatk-test
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --output=output.%j.gatk-test

#### SLURM 1 processor GATK test to run for 1 hour.

# Load the GATK module:
module load apps/gatk/3.7

# Start GATK
java -jar $GATKJAR -T CountLoci -R exampleFASTA.fasta -I exampleBAM.bam -o output.txt
