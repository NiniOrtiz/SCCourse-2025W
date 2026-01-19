#!/bin/bash

#SBATCH --job-name=STAR

#SBATCH --nodes=1

#SBATCH --cpus-per-task=16


#SBATCH --mem=20G


#SBATCH --time=12:00:00

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/STAR.%j.log

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/STAR.%j.err

#SBATCH --mail-type=END,FAIL

#SBATCH --mail-user=niniortiz99@gmail.com

### ENVIRONMENT

module load STAR

module list

### Execution

STAR --genomeDir /lisc/data/scratch/course/2025w300106/ortizvales/jaNemVect_STAR --runThreadN 16 --readFilesIn /lisc/data/scratch/course/2025w300106/ortizvales/SRR23260644_1.fastq /lisc/data/scratch/course/2025w300106/ortizvales/SRR23260644_2.fastq --outFileNamePrefix /lisc/data/scratch/course/2025w300106/ortizvales/results/map/SRR23260644_jaNemVect_ --outSAMstrandField intronMotif --outSAMtype BAM SortedByCoordinate




