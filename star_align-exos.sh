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

STAR --runThreadN 16 \
--genomeDir /lisc/data/scratch/course/2025w300106/ortizvales/exos/pig_STAR_index \
--readFilesIn /lisc/data/scratch/course/2025w300106/ortizvales/exos/results/trimmomatic/Exos__1P \
              /lisc/data/scratch/course/2025w300106/ortizvales/exos/results/trimmomatic/Exos__2P \
--outFileNamePrefix /lisc/data/scratch/course/2025w300106/ortizvales/exos/results/STAR_output/Exos_ \
--outSAMtype BAM SortedByCoordinate


