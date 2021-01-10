#!/bin/sh

touch ${VAR_DIR}/${VAR_A}.txt
echo "VAR_DIR=$VAR_DIR"

NUMBER=$(($RANDOM%1000))
echo "RANDOM-NUMBER=$NUMBER"

for i in $(seq 1 $NUMBER)
do
   echo "Welcome $i times" >> ${VAR_DIR}/${VAR_A}.txt

done
