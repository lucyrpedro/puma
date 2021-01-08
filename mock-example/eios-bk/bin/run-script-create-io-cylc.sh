#!/bin/bash

cd $CYLC_SUITE_RUN_DIR/post

. list_files.sh
. create-io-cylc.sh
. calc-mean.sh
