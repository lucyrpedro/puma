#!/bin/bash

mkdir $CYLC_SUITE_RUN_DIR/post

cp $CYLC_SUITE_DEF_PATH/bin/add-file.sh $CYLC_SUITE_RUN_DIR/post
cp $CYLC_SUITE_DEF_PATH/bin/calc-mean.sh $CYLC_SUITE_RUN_DIR/post
cp $CYLC_SUITE_DEF_PATH/bin/create-io-cylc.sh $CYLC_SUITE_RUN_DIR/post
cp $CYLC_SUITE_DEF_PATH/bin/list_files.sh $CYLC_SUITE_RUN_DIR/post
