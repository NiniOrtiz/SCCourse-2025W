#!/bin/bash
# Run this script with the bash shell.

#SBATCH --job-name=eggnogy
# SLURM job name shown in the queue.

#SBATCH --nodes=1
# Request 1 compute node.

#SBATCH --cpus-per-task=8
# Request 8 CPU cores for this job (matches emapper --cpu 8 below).

#SBATCH --mem=16G
# Request 16 GB RAM total for the job.
# (DIAMOND searches can use substantial RAM depending on database size and settings.)

#SBATCH --time=1:00:00
# Maximum wall-clock runtime (HH:MM:SS).

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/logs.%j.log
# Standard output (stdout) file. %j is replaced with the SLURM job ID.

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/logs.%j.err
# error logs

#SBATCH --mail-type=END,FAIL
# Email notification when the job ends successfully (END) or fails (FAIL).

#SBATCH --mail-user=niniortiz99@gmail.com
# Email address for notifications.

### ENVIRONMENT

module load eggnogmapper/2.1.13-foss-2024a
# Load eggNOG-mapper (emapper.py) module version 2.1.13 built with the foss-2024a toolchain.
# This should add emapper.py and required dependencies (e.g., DIAMOND) to your environment.

module list
# Print loaded modules into the log for reproducibility/debugging.

wd="/lisc/data/scratch/course/2025w300106/ortizvales/"
# Base working directory for the project.

input="${wd}/proteins.no_dots.fasta"
# Input FASTA file containing protein sequences to be functionally annotated.
# Your comment indicates this file was generated earlier and cleaned (e.g., headers without dots).

od="${wd}/results-eggnog/"
# Output directory where eggNOG-mapper will write all result files.

### Execution

echo "Started job at $(date)"
# Print a start timestamp into the log.

### -i is how you indicate the eggnog program how to take your input protein fasta file
### -output_dir is how you indicate eggnog in which directory it should release the resulting files
### cpu tells eggnog to use 8 cores
### itype proteins tells eggnog that it should use proteins in comparison
### -m diamond , uses diamond which is faster than BLAST but memory expensive
### evalue is the statistical parameter we use to filter the ortholog associations i think.
### I used override so i my sbatch script would delete previous version, since i did not want broken outputs

emapper.py \
  -i ${input} \
  # Input file (FASTA). Here: protein sequences to annotate.

  -o eggnog \
  # Output "prefix" / base name for produced result files.
  # Many output files will start with something like: eggnog.emapper.* (exact naming depends on version).

  --output_dir $od \
  # Directory where all output files will be written.

  --cpu 8 \
  # Use 8 CPU threads for the search/annotation steps (should match SLURM cpus-per-task).

  --itype proteins \
  # Declares that the input sequences are proteins (not nucleotide CDS/contigs).
  # This affects how eggNOG-mapper interprets sequences and which workflow is used.

  -m diamond \
  # Selects DIAMOND as the sequence search/alignment engine.
  # DIAMOND performs fast protein similarity searches (much faster than BLASTp),
  # typically at the cost of higher RAM use and slightly different sensitivity depending on settings.

  --evalue 1e-5 \
  # E-value cutoff for accepting hits in the similarity search step.
  # Lower (more stringent) values reduce weak/likely-spurious matches; higher values are more permissive.
  # 1e-5 is a common compromise for functional annotation.

  --go_evidence experimental \
  # Restricts Gene Ontology (GO) term assignments to those supported by "experimental" evidence codes
  # (i.e., higher-confidence GO annotations).
  # This usually reduces the number of GO terms reported, but increases reliability.

  --override
  # If outputs with the same prefix already exist in the output directory, overwrite them.
  # Useful when re-running after parameter changes to avoid mixing old and new result files.


