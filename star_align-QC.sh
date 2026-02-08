#!/bin/bash
# Run this script with the bash shell.

#SBATCH --job-name=STAR
# SLURM job name shown in the queue.
# Notey note: despite the name "STAR", this script actually runs FastQC (see below).

#SBATCH --nodes=1
# Request 1 compute node.

#SBATCH --cpus-per-task=2
# Request 2 CPU cores for the job (matches FastQC -t 2 below).

#SBATCH --mem=1G
# Request 1 GB RAM total for the job.
# (FastQC is usually light on memory; 1G is often sufficient, but depends on FASTQ size.)

#SBATCH --time=12:00:00
# Max wall-clock runtime (HH:MM:SS).
# maybe i overdid the time here?.

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/STAR.%j.log
# Standard output (stdout) log file. %j is replaced with the SLURM job ID.
# we will run FastQC is run, i forgot to change the name.

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/STAR.%j.err
# error log
#SBATCH --mail-type=END,FAIL
# Email notification when the job ends (END) or fails (FAIL).

#SBATCH --mail-user=niniortiz99@gmail.com
# Email address for notifications.

### ENVIRONMENT

module load FASTQC
# Load FastQC from the cluster module system so the fastqc command is available.

module list
# Print loaded modules to the log for reproducibility/debugging.

OutDir="/lisc/data/scratch/course/2025w300106/ortizvales/results/map/QC"
# Output directory where FastQC reports (HTML + ZIP files) will be written.

readsDir="/lisc/data/scratch/course/2025w300106/ortizvales"
# Directory containing the input FASTQ files.

### Execution

fastqc -t 2 -o $OutDir \
  $readsDir/SRR23260644_1.fastq \
  $readsDir/SRR23260644_2.fastq
# Run FastQC quality control on the paired-end FASTQ files:
# -t 2  -> use 2 threads
# -o    -> write output reports to OutDir
# Inputs -> the two FASTQ files (read 1 and read 2)


 



