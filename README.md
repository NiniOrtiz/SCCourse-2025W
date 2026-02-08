# SCCourse-2025W
A collection of scripts for the 1st part of the single cell data analysis course
# Content of repository

| **File**    |**Description** |
| -------- | ------- |
|star-align.sh | This is a SLURM job script that runs the STAR RNA-seq aligner on the cluster of Uni Wien. It requests 1 node, 16 CPU threads, 20 GB RAM, and up to 12 hours to align paired-end FASTQ reads (SRR23260644_1.fastq and SRR23260644_2.fastq)  against a pre-built STAR genome index. It outputs a coordinate-sorted BAM file (alignment) and writes logs/errors to the specified logs/ directory, with email notifications on job end/fail.   |
| February | $80     |
| March    | $420    |
