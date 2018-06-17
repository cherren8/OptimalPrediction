#!/bin/bash
# Set up programs and copy data from gluster
tar xvzf qiime1.tar.gz
echo $1 > variables.txt
sample=$(awk -F'+' '{print $1}' variables.txt)
trim=$(awk -F'+' '{print $2}' variables.txt)
cp /mnt/gluster/amlinz/NTL-MO/UW-processed/$sample.fastq.gz .
gzip -d *.gz

export PATH=$(pwd)/python/bin:$(pwd)/home/bin/:$PATH

echo $1
echo $sample
echo $trim
cat variables.txt

#Convert fastq to fasta qual
python ./python/bin/convert_fastaqual_fastq.py -f $sample.fastq -o . -c fastq_to_fastaqual

# Trim sequences
python ./python/bin/truncate_fasta_qual_files.py -f $sample.fna -q $sample.qual -b $trim
 

# Convert truncated fasta and qual files back to fastq
python ./python/bin/convert_fastaqual_fastq.py -f "$sample"_filtered.fasta -q "$sample"_filtered.qual -o .

# gzip output, change name of output file to NOT seqs.fna and move back to gluster
gzip "$sample"_filtered.fastq
cp "$sample"_filtered.fastq.gz /mnt/gluster/amlinz/NTL-MO/trimmed_"$trim"

# Clean up
rm *fasta
rm *fastq
rm *tar
rm *fna
rm *qual
rm -rf python
rm *gz
rm *txt
