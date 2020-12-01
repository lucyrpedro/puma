#!/bin/bash
input="files.txt"
rm io.cylc.part
output="io.cylc.part"

while IFS= read -r line
do
  echo "$line"
  ls -l "$line" >> "$output"
done < "$input"
