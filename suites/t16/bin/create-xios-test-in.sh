#!/bin/bash

# Create input namelist file
cat > xios_test.in << EOF
&input
  do_regrid = .FALSE.,
  do_ens = .TRUE.,
  infile_data_base = '$INPUT_DATA_NML',
  verbose = 1,
  write_output = .FALSE.,
  nprocx = $NPROCX,
  nprocy = $NPROCY,
  nt = $NTIMES,
  ncopies = 20
/

&input_ens
  num_ens = $NUMENS
/
EOF