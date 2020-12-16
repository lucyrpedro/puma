#!/bin/bash

# Script to run xios_test

# . init-script.sh

mkfs.esdm -g -l --create --remove --ignore-errors

if [[ $NUMENS -eq 0 ]] ; then
  MPIEXEC_ARG="$LAUNCH_MPI_MODEL $MODEL_EXEC"
else
  MPIEXEC_ARG=""
fi
ens=0
while [[ $ens -lt $NUMENS ]]; do
  if [[ $ens -gt 0 ]] ; then
    MPIEXEC_ARG="$MPIEXEC_ARG : "
  fi
  rm -f ${INPUT_DATA_NML}_mem$ens
  cp $INPUT_DATA_NML ${INPUT_DATA_NML}_mem$ens
  # Add extra environment variables to ENV_ENS
  ENV_ENS="env ENS_MEMBER=$ens"
  MPIEXEC_ARG="$MPIEXEC_ARG $LAUNCH_MPI_MODEL $ENV_ENS $MODEL_EXEC"
  ((ens=ens+1))
done
MPIEXEC_ARG="$MPIEXEC_ARG : $LAUNCH_MPI_XIOS $XIOS_EXEC"

echo "mpiexec $MPIEXEC_ARG"
mpiexec $MPIEXEC_ARG
