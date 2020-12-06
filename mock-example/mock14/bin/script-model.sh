#!/bin/sh

# touch a.txt
# touch ${VAR_A}.txt

cat > ${VAR_A}.txt << EOF
&input_data
  filename = '${FILE}',
  varname = 'u',
  varname_xios = 'u',
/
EOF

touch ${VAR_B}.txt

GREETING=${GREETING:-Goodbye}
echo "$GREETING World! from $0" > ${VAR_A}${VAR_B}-out.txt
