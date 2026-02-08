#!/bin/bash
# Run this script with the bash shell.

#SBATCH --job-name=STAR
# SLURM job name shown in the queue.

#SBATCH --nodes=1
# Request 1 compute node.

#SBATCH --cpus-per-task=16
# Request 16 CPU cores for this job (matches STAR --runThreadN 16 below).

#SBATCH --mem=40G
# Request 40 GB RAM total for the job (STAR indexing/alignment can be memory intensive).

#SBATCH --time=12:00:00
# Max wall-clock runtime (HH:MM:SS).

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/STAR.%j.log
# Standard output (stdout) log file. %j is replaced with the SLURM job ID.

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/STAR.%j.err
# saves error log
#SBATCH --mail-type=END,FAIL
# Email notification when the job ends (END) or fails (FAIL).

#SBATCH --mail-user=niniortiz99@gmail.com
# Email address for notifications.

### ENVIRONMENT

module load STAR
# Load the STAR aligner from the cluster module system.

module list
# Print loaded modules into the log (useful for reproducibility/debugging).

### Execution

STAR --runThreadN 16 \
# Number of threads STAR will use (should match --cpus-per-task).

--genomeDir /lisc/data/scratch/course/2025w300106/ortizvales/exos/pig_STAR_index \
# Path to the pre-built STAR genome index directory for the reference genome (here: pig / Sus scrofa).

--readFilesIn /lisc/data/scratch/course/2025w300106/ortizvales/exos/results/trimmomatic/Exos__1P \
              /lisc/data/scratch/course/2025w300106/ortizvales/exos/results/trimmomatic/Exos__2P \
# Input reads to align (paired-end):
# - first file is mate 1 (R1) trimmed "paired" output from Trimmomatic (1P)
# - second file is mate 2 (R2) trimmed "paired" output from Trimmomatic (2P)
# Note: these filenames suggest they are the paired-surviving reads; unpaired reads are not included here.

--outFileNamePrefix /lisc/data/scratch/course/2025w300106/ortizvales/exos/results/STAR_output/Exos_ \
# Prefix for all STAR output files (STAR appends standardized suffixes).
# Example expected main output: Exos_Aligned.sortedByCoord.out.bam (depending on STAR defaults)

--outSAMtype BAM SortedByCoordinate
# Output alignments in BAM format and sort by genomic coordinate.
# This produces a coordinate-sorted BAM suitable for downstream QC, counting, and visualization.

