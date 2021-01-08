#!/bin/bash
input="files-size.txt"

n=0
t=0

while IFS= read -r value
do
#  echo "$value"
  n=$(($n+1))
  t=$(($t+$value))
#  echo "$n"
#  echo "$t"
done < "$input"

m=$(($t/$n))
# echo 'Mean equals' $m
echo $m

cat > mean.txt << EOF
$m
EOF

# export MEAN=$m
