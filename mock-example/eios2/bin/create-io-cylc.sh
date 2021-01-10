#!/bin/bash
input="files.txt"
rm -rf io.cylc
rm -rf files-size.txt
# export total=0

cat >> io.cylc << EOF
[Task 1]
	[[inputs]]

		topography = "xxxxxxxxx"
		checkpoint = "xxxxxxxxx"
		init = "xxxxxxxxxxxxxxx"

	[[outputs]]

EOF

while IFS= read -r line
do
  echo "$line"
#  echo "$total"
  ./add-file.sh $line
done
