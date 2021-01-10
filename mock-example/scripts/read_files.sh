#!/bin/bash
input="files.txt"
output="files_size.txt"
rm -rf output
while IFS= read -r line
do
  echo "$line"
  ls -s "$line" >> "$output"
done < "$input"
