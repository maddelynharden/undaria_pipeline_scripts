#!/bin/bash

#run fastqc
for i in `cat wgs/samples_file.txt`
do
  echo $i
  sbatch -o $i.fastqc.out -J $i undaria_pipeline_scripts/fastqc_submit.sbatch $i
done

#run trimmomatic
# We want to use our list of sample names, not .out files, because we ran the
# trimming on paired-end FASTQ reads for each sample (2 FASTQs / sample)

for i in `cat wgs/samples_file.txt`
do 
  echo $i
  sbatch --out=$i.out
  trimsubmit.sbatch $i
done


#run bowtie-build

#run bowtiesubmit

#run SAMtools sort

#run bamqc via qualimap
