#!/bin/bash

#SBATCH --job-name=trimmmomatic

#SBATCH --nodes=1

#SBATCH --cpus-per-task=4


#SBATCH --mem=12G


#SBATCH --time=1:00:00

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/trimommatic-exos.%j.log

#SBATCH --output=/lisc/data/scratch/course/2025w300106/ortizvales/logs/trimmomatic-exos.%j.err

#SBATCH --mail-type=END,FAIL

#SBATCH --mail-user=niniortiz99@gmail.com

### ENVIRONMENT

module load Trimmomatic

module list

wd="/lisc/data/scratch/course/2025w300106/ortizvales/exos"
outDir="$wd/results/trimmomatic"
mkdir -p $outDir

### Execution
echo "Started job at $(date)"
trimmomatic PE -threads 4 -summary $outDir/Exos_summary_txt  $wd/Exos_R1.fastq.gz $wd/Exos_R2.fastq.gz -baseout $outDir/Exos_ ILLUMINACLIP:/lisc/opt/sw/software/Trimmomatic/0.40-Java-17/adapters/TruSeq3-PE.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:50


