#!/bin/bash

touch trim_uwbc.txt
touch trim_emp.txt

while read line; do
	mkdir /mnt/gluster/amlinz/NTL-MO/trimmed_"$line";
	while read bit; do
		echo $bit+$line;
	done < processed_uwbc_samples.txt >> trim_uwbc.txt
	while read emp; do
		echo $emp+$line;
	done < emp_samples.txt >> trim_emp.txt 
done < trim_lengths.txt
