#!/bin/bash
input="files.txt"
mkdir output

while IFS= read -r line
do
  echo "$line"
  output="$line.io.cylc"
  ls -s "$line" >> "$output"
  mv "$output" output/

done < "$input"
