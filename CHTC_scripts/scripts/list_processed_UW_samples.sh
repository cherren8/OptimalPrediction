#!/bin/bash

for file in /mnt/gluster/amlinz/NTL-MO/UW-processed/*joined.fastq.gz; do
	sample=$(basename $file .fastq.gz);
	echo $sample;
	done > processed_uwbc_samples.txt
