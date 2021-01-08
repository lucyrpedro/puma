#!/bin/bash

# $1 file

FILENAME=$1

if [[ $FILENAME == *".sh"* || $FILENAME == *"files"* || $FILENAME == *"io.cylc"* || $FILENAME == *"service"* || $FILENAME == *"log"* || $FILENAME == *"suite"* || $FILENAME == *"post"* ]]
then
	echo "FILENAME = $FILENAME"
	exit 1
fi
	
ls -l $FILENAME > $FILENAME-data.txt

# size=$(ls -l $FILENAME | cut -f5 -d " " > $FILENAME-data.txt)

size=$(ls -l $FILENAME | cut -f5 -d " ")

rm $FILENAME-data.txt

# total=((total+size))

cat >> files-size.txt << EOF
$size
EOF

# export total=$(($total+$size))

# echo $size
# echo "total = $total"

# Create ESDM io.cylc file

cat >> io.cylc << EOF
		[[[$FILENAME]]]
			pattern = xxxxxxxx
			lifetime = xxxxxxx
			type = xxxxxxxxxxx
			datatype = xxxxxxx
			size = $size
			precision.absolute_tolerance = xxx
EOF
