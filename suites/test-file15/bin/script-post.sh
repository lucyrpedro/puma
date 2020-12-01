#!/bin/sh

cat > ${VAR_C}.txt << EOF
&input_data
  filename = '${FILE}',
  varname = 'u',
  varname_xios = 'u',
/
EOF

touch ${VAR_D}.txt

GREETING=${GREETING:-Goodbye}
echo "$GREETING World! from $0" > ${VAR_C}${VAR_D}-out.txt
