#!/bin/bash

# Create input grid namelist file
cat > $INPUT_DATA_NML << EOF
&input_data
  filename = '$INPUT_DATA_NC',
  varname = '$VAR_VARNAME',
  varname_xios = '$VAR_VARNAME_XIOS',
/
EOF
