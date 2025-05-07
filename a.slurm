#!/bin/bash
#SBATCH --job-name=trimmomatic_genome
#SBATCH --cpus-per-task=8
#SBATCH --mem=20gb
#SBATCH --time=01:00:00
#SBATCH --output=trimmomatic_genome_%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=<your_email>
#SBATCH --partition=short
#SBATCH --constraint=hpc

INPUT_DIR=/projects/mipt_dbmp_biotechnology/genome
ADAPTERS=$INPUT_DIR/adapters.fa
R1=$INPUT_DIR/illumina_reads_R1_001.fastq
R2=$INPUT_DIR/illumina_reads_R2_001.fastq

OUT_PREFIX=$HOME/hw/hw_10/genome/cleaned_

trimmomatic PE -phred33 \
  $R1 $R2 \
  ${OUT_PREFIX}R1_paired.fastq ${OUT_PREFIX}R1_unpaired.fastq \
  ${OUT_PREFIX}R2_paired.fastq ${OUT_PREFIX}R2_unpaired.fastq \
  ILLUMINACLIP:$ADAPTERS:2:30:10 \
  LEADING:20 TRAILING:20 \
  SLIDINGWINDOW:4:15 \
  MINLEN:36
