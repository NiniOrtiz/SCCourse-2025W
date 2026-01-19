#!/bin/bash

#SBATCH --job-name=fastqc

#SBATCH --nodes=1

#SBATCH --cpus-per-task=2


#SBATCH --mem=2G


#SBATCH --time=1:00:00

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/fastqc.%j.log

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/fastqc.%j.err

#SBATCH --mail-type=END,FAIL

#SBATCH --mail-user=niniortiz99@gmail.com

### ENVIRONMENT

module load FASTQC

module list

OutDir="/lisc/data/scratch/course/2025w300106/ortizvales/results/QC"
readsDir="/lisc/data/scratch/course/2025w300106/ortizvales"
### Execution
echo "Started job at $(date)"

fastqc -t 2 -o $OutDir $readsDir/SRR23260644_1.fastq  $readsDir/SRR23260644_2.fastq  


 



