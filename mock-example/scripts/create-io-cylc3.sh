#!/bin/bash

# $1 file

FILENAME=$1

ls -l $FILENAME > $FILENAME-data.txt

# size=$(ls -l $FILENAME | cut -f5 -d " " > $FILENAME-data.txt)

size=$(ls -l $FILENAME | cut -f5 -d " ")

# echo $size

# Create ESDM io.cylc file

cat >> io.cylc.part << EOF
		[[[$FILENAME]]]
			pattern = 1 day
			lifetime = 5 years
			type = product
			datatype = float
			size = $size
			precision.absolute_tolerance = 0.1
EOF
