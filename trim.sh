#!/bin/bash

#SBATCH --job-name=trimmmomatic

#SBATCH --nodes=1

#SBATCH --cpus-per-task=2


#SBATCH --mem=2G


#SBATCH --time=1:00:00

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/trimommatic.%j.log

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/trimmomatic.%j.err

#SBATCH --mail-type=END,FAIL

#SBATCH --mail-user=niniortiz99@gmail.com

### ENVIRONMENT

module load Trimmomatic

module list

OutDir="/lisc/data/scratch/course/2025w300106/ortizvales/results/QC"
readsDir="/lisc/data/scratch/course/2025w300106/ortizvales"
### Execution
echo "Started job at $(date)"

fastqc -t 2 -o $OutDir $readsDir/SRR23260644_1.fastq  $readsDir/SRR23260644_2.fastq  
