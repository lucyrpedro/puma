#!/bin/bash

# $1 file

FILENAME=$1

if [[ $FILENAME == *".sh"* || $FILENAME == *"files"* || $FILENAME == *"io.cylc"* || $FILENAME == *"service"* || $FILENAME == *"log"* || $FILENAME == *"suite"* || $FILENAME == *"post"* ]]
then
	echo "FILENAME = $FILENAME"
	exit 1
fi
	
cat >> io.cylc << EOF
		[[[$FILENAME]]]
			pattern = xxxxxxxx
			lifetime = xxxxxxx
			type = xxxxxxxxxxx
			datatype = xxxxxxx
			size = $size
			precision.absolute_tolerance = xxx
EOF
