#!/bin/sh

# Create a file with random size. The size will be used to make a decision about the placement of the file in the next cycle.

touch ${VAR_DIR}/${VAR_A}.txt
echo "VAR_DIR=$VAR_DIR"

NUMBER=$(($RANDOM%1000))
echo "RANDOM-NUMBER=$NUMBER"

for i in $(seq 1 $NUMBER)
do
   echo "Welcome $i times" >> ${VAR_DIR}/${VAR_A}.txt
done
