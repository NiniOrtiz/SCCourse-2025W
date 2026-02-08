#!/bin/bash
# Use bash shell to run this script.

#SBATCH --job-name=STAR
# Job name shown in the queue (squeue).

#SBATCH --nodes=1
# Request 1 compute node.

#SBATCH --cpus-per-task=16
# Request 16 CPU cores for this single task, this matches  the STAR threading we selected below.

#SBATCH --mem=20G
# Request 20 GB of RAM total for the job.

#SBATCH --time=12:00:00
# Max wall-clock time (HH:MM:SS). Job is killed if it exceeds this.

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/STAR.%j.log
# Standard output (stdout) file. %j is replaced with the SLURM job ID.

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/STAR.%j.err
#   #SBATCH --error=/.../STAR.%j.err

#SBATCH --mail-type=END,FAIL
# Emails me to my personal mail when the job ends normally (END) or fails (FAIL).

#SBATCH --mail-user=niniortiz99@gmail.com
# Where to send email notifications.

### ENVIRONMENT

module load STAR
# Load the STAR module from the cluster's environment modules system.

module list
# Print loaded modules to stdout (useful for reproducibility/debugging).

### Execution

STAR \
  --genomeDir /lisc/data/scratch/course/2025w300106/ortizvales/jaNemVect_STAR \
  # Path to the STAR genome index directory (built beforehand with STAR --runMode genomeGenerate).

  --runThreadN 16 \
  # Use 16 threads (should match --cpus-per-task).

  --readFilesIn \
    /lisc/data/scratch/course/2025w300106/ortizvales/SRR23260644_1.fastq \
    /lisc/data/scratch/course/2025w300106/ortizvales/SRR23260644_2.fastq \
  # Input paired-end FASTQ files: mate 1 and mate 2.

  --outFileNamePrefix /lisc/data/scratch/course/2025w300106/ortizvales/results/map/SRR23260644_jaNemVect_ \
  # Prefix for all STAR output files (STAR appends names like Aligned.sortedByCoord.out.bam).

  --outSAMstrandField intronMotif \
  # Adds XS strand tag for spliced alignments (useful for some downstream tools).

  --outSAMtype BAM SortedByCoordinate
  # Output alignments as BAM and sort by genomic coordinate.



