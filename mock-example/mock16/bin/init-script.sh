#!/bin/bash

export SPACK_ROOT=/home/users/kunkel/spack
. $SPACK_ROOT/share/spack/setup-env.sh
spack load jansson glib gcc/aafm73y gettext/3bilnvc cmake autoconf/7qjzal7 automake/b7g5fr6 perl-uri

export MODULEPATH=$MODULEPATH:/home/users/kunkel/install/modules
module load kunkel/openmpi/3.1
module load kunkel/hdf5/1.10.6

export PATH=/home/users/jcole/esdm/install/bin:$PATH
export LIBRARY_PATH=/home/users/jcole/esdm/install/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=/home/users/jcole/esdm/install/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=/home/users/jcole/esdm/install/lib:$LD_RUN_PATH
export CPATH=/home/users/jcole/esdm/install/include:$CPATH
module list
