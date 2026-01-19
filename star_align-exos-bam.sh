#!/bin/bash

#SBATCH --job-name=STAR

#SBATCH --nodes=1

#SBATCH --cpus-per-task=16


#SBATCH --mem=40G


#SBATCH --time=12:00:00

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/STAR.%j.log

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/STAR.%j.err

#SBATCH --mail-type=END,FAIL

#SBATCH --mail-user=niniortiz99@gmail.com

### ENVIRONMENT

module load STAR

module list

### Execution

STAR --genomeDir /lisc/data/scratch/course/2025w300106/ortizvales/exos/pig_STAR_index \
--runThreadN 16 \
--readFilesIn /lisc/data/scratch/course/2025w300106/ortizvales/exos/Exos_R1.fastq.gz /lisc/data/scratch/course/2025w300106/ortizvales/exos/Exos_R2.fastq.gz \
--readFilesCommand zcat \
--outFileNamePrefix /lisc/data/scratch/course/2025w300106/ortizvales/exos/results/Exos_pig_ \
--outSAMtype BAM SortedByCoordinate
