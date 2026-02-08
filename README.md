# SCCourse-2025W
A collection of scripts for the 1st part of the single cell data analysis course
# Content of repository

| **File**    |**Description** |
| -------- | ------- |
|star-align.sh | This is a SLURM job script that runs the STAR RNA-seq aligner on the cluster of Uni Wien. It requests 1 node, 16 CPU threads, 20 GB RAM, and up to 12 hours to align paired-end FASTQ reads (SRR23260644_1.fastq and SRR23260644_2.fastq)  against a pre-built STAR genome index. It outputs a coordinate-sorted BAM file (alignment) and writes logs/errors to the specified logs/ directory, with email notifications on job end/fail. This SLURM batch script performs RNA-seq read alignment by taking raw paired-end FASTQ files and mapping them to a reference genome with the STAR aligner using a pre-built STAR genome index specified by --genomeDir (index generation is not performed in this script). The job requests one node with 16 CPU threads, 20 GB of memory, and a 12-hour time limit, and it produces a coordinate-sorted BAM alignment file along with STAR log and summary outputs. The resulting alignment files are used as input for downstream analyses such as alignment quality assessment, gene-level read quantification for expression analysis, splice junction detection and alternative splicing analysis, and visualization of read coverage in genome browsers.  |
| February | $80     |
| March    | $420    |
