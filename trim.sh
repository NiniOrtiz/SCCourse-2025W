#!/bin/bash
# Use bash shell to run this script.

#SBATCH --job-name=trimmmomatic
# Job name shown in the queue (note: "trimmmomatic" has extra m's).

#SBATCH --nodes=1
# Request 1 compute node.

#SBATCH --cpus-per-task=2
# Request 2 CPU cores for the job (matches -t 2 below).

#SBATCH --mem=2G
# Request 2 GB RAM total for the job.

#SBATCH --time=1:00:00
# Max wall-clock time (HH:MM:SS).

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/trimommatic.%j.log
# Standard output (stdout) log file. %j is replaced with the SLURM job ID.

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/trimmomatic.%j.err

#SBATCH --mail-type=END,FAIL
# Email notification when the job ends (END) or fails (FAIL).

#SBATCH --mail-user=niniortiz99@gmail.com
# Email address to send notifications to.

### ENVIRONMENT

module load Trimmomatic
# Load the Trimmomatic module (note: this script does not actually run trimmomatic below).

module list
# Print loaded modules for reproducibility/debugging.

OutDir="/lisc/data/scratch/course/2025w300106/ortizvales/results/QC"
# Output directory where FastQC reports will be written.

readsDir="/lisc/data/scratch/course/2025w300106/ortizvales"
# Directory containing input FASTQ files.

### Execution

echo "Started job at $(date)"
# Print start time into the log.

fastqc -t 2 -o $OutDir \
  $readsDir/SRR23260644_1.fastq \
  $readsDir/SRR23260644_2.fastq
# Run FastQC quality control on the paired-end FASTQ files:
# -t 2 uses 2 threads
# -o $OutDir writes FastQC HTML/ZIP outputs to the QC results directory
