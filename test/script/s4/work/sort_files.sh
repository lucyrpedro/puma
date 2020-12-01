#!/bin/bash
input="files_size.txt"
output="files_sorted.txt"
sort -n "$input" > "$output"
