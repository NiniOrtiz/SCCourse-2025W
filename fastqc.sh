#!/bin/bash
# Run this script with the bash shell.

#SBATCH --job-name=fastqc
# SLURM job name shown in the queue (squeue).

#SBATCH --nodes=1
# Request 1 compute node.

#SBATCH --cpus-per-task=2
# Request 2 CPU cores for the job (matches FastQC -t 2 below).

#SBATCH --mem=2G
# Request 2 GB RAM total for the job.

#SBATCH --time=1:00:00
# Max wall-clock runtime (HH:MM:SS).

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/fastqc.%j.log
# Standard output (stdout) log file. %j is replaced with the SLURM job ID.

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/fastqc.%j.err
#saves the error log
#SBATCH --mail-type=END,FAIL
# Send email notifications when the job ends (END) or fails (FAIL).

#SBATCH --mail-user=niniortiz99@gmail.com
# Email address for notifications.

### ENVIRONMENT

module load FASTQC
# Load FastQC from the cluster's module system so the fastqc command is available.

module list
# Print loaded modules into the log for reproducibility/debugging.

OutDir="/lisc/data/scratch/course/2025w300106/ortizvales/results/QC"
# Output directory where FastQC reports (HTML + ZIP) will be written.

readsDir="/lisc/data/scratch/course/2025w300106/ortizvales"
# Directory containing the input FASTQ files.

### Execution

echo "Started job at $(date)"
# Print a start timestamp into the log.

fastqc -t 2 -o $OutDir \
  $readsDir/SRR23260644_1.fastq \
  $readsDir/SRR23260644_2.fastq
# Run FastQC quality control on the paired-end FASTQ files:
# -t 2  -> use 2 threads
# -o    -> write output reports to OutDir
# Inputs -> the two FASTQ files (read 1 and read 2)


 



