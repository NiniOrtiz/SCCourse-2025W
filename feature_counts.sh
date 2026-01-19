#!/bin/bash

#SBATCH --job-name=counts

#SBATCH --nodes=1

#SBATCH --cpus-per-task=16


#SBATCH --mem=20G


#SBATCH --time=12:00:00

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/featurecounts.%j.log

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/featurecounts.%j.err

#SBATCH --mail-type=END,FAIL

#SBATCH --mail-user=niniortiz99@gmail.com

### ENVIRONMENT

module load Subread

module list

### Execution


# i want to use -p forpaired ends and only count 1 read per template
# i want to count only primary alignments
#I believe this is a reverse stranded library
featureCounts -p --countReadPairs -C -T 4 -s 2 --primary -a  /lisc/data/scratch/course/2025w300106/ortizvales/exos/GCF_000003025.6_Sscrofa11.1_genomic.gtf  -o Exo.counts.tsv /lisc/data/scratch/course/2025w300106/ortizvales/exos/results/STAR_output/exo_filtered.bam 



