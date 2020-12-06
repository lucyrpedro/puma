#!/bin/bash

# $1 file

FILENAME=$1

ls -l $FILENAME > $FILENAME-data.txt

# size=$(ls -l $FILENAME | cut -f5 -d " " > $FILENAME-data.txt)

size=$(ls -l $FILENAME | cut -f5 -d " ")

echo $size

# Create ESDM io.cylc file

cat > io.cylc << EOF
[Task 1]
	[[inputs]]
		topography = "/pool/input/app/config/topography.dat"
		checkpoint = "[Task 1].checkpoint\$(CYCLE - 1)"
		init = "/pool/input/app/config/init.dat"

	[[outputs]]
		[[[$FILENAME]]] # This is the name of the file
			pattern = 1 day
			lifetime = 5 years
			type = product
			datatype = float
			size = $size
			precision.absolute_tolerance = 0.1

		[[[checkpoint]]]
			pattern = \$(CYCLE)
			lifetime = 7 days
			type = checkpoint
			datatype = float
			dimension = (100,100,100,50)

		[[[log]]]
			type = logfile
			datatype = text
			size = small
EOF
