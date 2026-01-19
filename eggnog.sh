#!/bin/bash

#SBATCH --job-name=eggnogy

#SBATCH --nodes=1

#SBATCH --cpus-per-task=8


#SBATCH --mem=16G


#SBATCH --time=1:00:00

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/logs.%j.log

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/logs.%j.err

#SBATCH --mail-type=END,FAIL

#SBATCH --mail-user=niniortiz99@gmail.com

### ENVIRONMENT

module load eggnogmapper/2.1.13-foss-2024a

module list
wd="/lisc/data/scratch/course/2025w300106/ortizvales/"
input="${wd}/proteins.no_dots.fasta" ### this is the protein file we generated before
od="${wd}/results-eggnog/"

### Execution
echo "Started job at $(date)"

### -i is how you indicate the eggnog program how to take your input protein fasta file
### -output_dir is how you indicate eggnog in which directory it should release the resulting giles
### cpu tells eggnog to use 8 cores
### itype proteins tells eggnog that it should use proteins in comparison
### -m diamond , uses diamond which is faster than BLAST but memory expensive
### evalue is the statistical parameter we use to filter the ortholog associations i think.
### I used override so i  my sbatch script would delete prvious version, since i did not want broken outputs
emapper.py -i ${input} -o eggnog --output_dir $od --cpu 8 --itype proteins -m diamond --evalue 1e-5 --go_evidence experimental --override


