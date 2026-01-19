#!/bin/bash

#SBATCH --job-name=STAR

#SBATCH --nodes=1

#SBATCH --cpus-per-task=2


#SBATCH --mem=1G


#SBATCH --time=12:00:00

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/STAR.%j.log

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/STAR.%j.err

#SBATCH --mail-type=END,FAIL

#SBATCH --mail-user=niniortiz99@gmail.com

### ENVIRONMENT

module load FASTQC

module list

OutDir="/lisc/data/scratch/course/2025w300106/ortizvales/results/map/QC"
readsDir="/lisc/data/scratch/course/2025w300106/ortizvales"
### Execution

fastqc -t 2 -o $OutDir $readsDir/SRR23260644_1.fastq  $readsDir/SRR23260644_2.fastq  


 



