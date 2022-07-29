#!/bin/bash
#SBATCH --mem=15gb
#SBATCH --time=01:00:00
#SBATCH -o multiqc_kelly_rerun.out
#SBATCH -J multiqc_kelly_rerun

qc_dir=fastqc_post_trim

# Load multiqc
source ~/bin/anaconda3/etc/profile.d/conda.sh
conda activate multiqc
multiqc --version
if [[ $? -ne 0 ]]
then
	echo "Error - check MultiQC installation."
fi

# If input directory exists, run MultiQC
if [[ -d $qc_dir ]]
then
	multiqc -o $qc_dir $qc_dir
else
	echo "Error - input directory to MultiQC, \
${qc_dir}, not found."
fi

