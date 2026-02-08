#!/bin/bash
# Run this script with the bash shell.

#SBATCH --job-name=counts
# SLURM job name shown in the queue. Here it indicates this job produces read counts.

#SBATCH --nodes=1
# Request 1 compute node.

#SBATCH --cpus-per-task=16
# Request 16 CPU cores from SLURM.

#SBATCH --mem=20G
# Request 20 GB RAM total for the job.

#SBATCH --time=12:00:00
# Max wall-clock time (HH:MM:SS).

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/featurecounts.%j.log
# Standard output (stdout) log file. %j is replaced with the SLURM job ID.

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/featurecounts.%j.err
# error logs
#SBATCH --mail-type=END,FAIL
# Email notification when the job ends (END) or fails (FAIL).

#SBATCH --mail-user=niniortiz99@gmail.com
# Email address for notifications.

### ENVIRONMENT

module load Subread
# Load the Subread suite, which includes the featureCounts program.

module list
# Print loaded modules (useful for reproducibility/debugging).

### Execution

# i want to use -p forpaired ends and only count 1 read per template
# i want to count only primary alignments
# I believe this is a reverse stranded library
featureCounts -p --countReadPairs -C -T 16 -s 2 --primary \
  -a /lisc/data/scratch/course/2025w300106/ortizvales/exos/GCF_000003025.6_Sscrofa11.1_genomic.gtf \
  -o Exo.counts.tsv \
  /lisc/data/scratch/course/2025w300106/ortizvales/exos/results/STAR_output/exo_filtered.bam
# Run featureCounts to assign aligned reads to annotated genomic features (typically genes)
# and produce a gene-by-sample count table for downstream expression analysis.
