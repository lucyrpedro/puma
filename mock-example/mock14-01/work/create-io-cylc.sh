#!/bin/bash
input="files.txt"
rm -rf io.cylc
rm -rf files-size.txt
# export total=0

cat >> io.cylc << EOF
[Task 1]
	[[inputs]]

		topography = "/pool/input/app/config/topography.dat"
		checkpoint = "[Task 1].checkpoint\$(CYCLE - 1)"
		init = "/pool/input/app/config/init.dat"

	[[outputs]]

EOF

while IFS= read -r line
do
  echo "$line"
#  echo "$total"
  ./add-file.sh $line
done < "$input"
