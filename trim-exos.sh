#!/bin/bash
# Run this script with the bash shell.

#SBATCH --job-name=trimmmomatic
# SLURM job name shown in the queue (note: "trimmmomatic" has extra m's; name is just a label).

#SBATCH --nodes=1
# Request 1 compute node.

#SBATCH --cpus-per-task=4
# Request 4 CPU cores for the job (matches Trimmomatic -threads 4 below).

#SBATCH --mem=12G
# Request 12 GB of RAM total for the job.

#SBATCH --time=1:00:00
# Max wall-clock runtime (HH:MM:SS).

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/trimommatic-exos.%j.log
# File for standard output (stdout). %j is replaced with the SLURM job ID.

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/trimmomatic-exos.%j.err

#SBATCH --mail-type=END,FAIL
# Send email when the job ends successfully (END) or fails (FAIL).

#SBATCH --mail-user=niniortiz99@gmail.com
# Email address for notifications.

### ENVIRONMENT

module load Trimmomatic
# Load Trimmomatic from the cluster's module system (sets PATH/JAVA env as needed).

module list
# Print loaded modules into the log for reproducibility/debugging.

wd="/lisc/data/scratch/course/2025w300106/ortizvales/exos"
# Working directory containing the input FASTQ files.

outDir="$wd/results/trimmomatic"
# Output directory for trimmed reads + summary.

mkdir -p $outDir
# Create the output directory if it doesn't already exist.

### Execution

echo "Started job at $(date)"
# Write a timestamp into the log.

trimmomatic PE \
  -threads 4 \
  -summary $outDir/Exos_summary_txt \
  $wd/Exos_R1.fastq.gz $wd/Exos_R2.fastq.gz \
  -baseout $outDir/Exos_ \
  ILLUMINACLIP:/lisc/opt/sw/software/Trimmomatic/0.40-Java-17/adapters/TruSeq3-PE.fa:2:30:10 \
  SLIDINGWINDOW:4:20 \
  MINLEN:50
# Run Trimmomatic in paired-end (PE) mode on gzipped FASTQ input reads.
