#!/bin/sh

cat > ${VAR_A}.txt << EOF
&input_data
  filename = '${FILE}',
  varname = 'u',
  varname_xios = 'u',
/
EOF

touch ${VAR_DIR}/${VAR_B}.txt
echo "DIR=$VAR_DIR"

NUMBER=$(($RANDOM%1000))
echo "RANDOM-NUMBER=$NUMBER"

for i in $(seq 1 $NUMBER)
do
   echo "Welcome $i times" >> ${VAR_DIR}/${VAR_B}.txt

done

GREETING=${GREETING:-Goodbye}

echo "$GREETING World! from $0" > ${VAR_A}${VAR_B}-out.txt
