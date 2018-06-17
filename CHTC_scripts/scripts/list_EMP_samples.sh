#!/bin/bash

#mkdir /mnt/gluster/amlinz/NTL-MO/UW-processed/
for file in /mnt/gluster/amlinz/NTL-MO/EMP/*.fastq.gz; do
	sample=$(basename $file .fastq.gz);
	echo $sample;
	done > emp_samples.txt
