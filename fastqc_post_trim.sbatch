#!/bin/bash
#SBATCH --mem=5gb
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=12
#SBATCH -o fastqc_post_trim_logs/%x_%a.out
#SBATCH -J fastqc_post_trim

outdir=fastqc_post_trim # output directory
samples_file=wgs/samples_file.txt
sample_id=`cat $samples_file | sed -n ${SLURM_ARRAY_TASK_ID}p`
reads1=${sample_id}_1_P.fastq.gz
reads2=${sample_id}_2_P.fastq.gz

# Create output directory (if needed)
if [[ ! -d $outdir ]]
then
	echo "Creating output directory ${outdir}"
	mkdir $outdir 
fi

# Load fastqc
source ~/bin/anaconda3/etc/profile.d/conda.sh
conda activate fastqc
fastqc --version
if [[ $? -ne 0 ]]
then
	echo "Error - check FASTQC installation."
	exit 1
fi

if [[ -f $reads1 ]] && [[ -f $reads2 ]]
then
	printf "Running FASTQC on 2 read files associated \
with ${sample_id}:\n\
$reads1 and ${reads2}.\n\n"
	fastqc -t $SLURM_CPUS_PER_TASK -o $outdir $reads1 $reads2
else
	echo "Error - either\n$reads1 or \n$reads2 associated \
with $sample_id not detected. Exiting.."
	exit 1
fi
