#!/bin/bash

cp $CYLC_SUITE_DEF_PATH/bin/init-script.sh $CYLC_SUITE_SHARE_DIR/
cp $CYLC_SUITE_DEF_PATH/bin/run-xios-test.sh $CYLC_SUITE_SHARE_DIR/

cp $CYLC_SUITE_DEF_PATH/bin/add-file.sh $CYLC_SUITE_WORK_DIR/
cp $CYLC_SUITE_DEF_PATH/bin/calc-mean.sh $CYLC_SUITE_WORK_DIR/
cp $CYLC_SUITE_DEF_PATH/bin/create-io-cylc.sh $CYLC_SUITE_WORK_DIR/
cp $CYLC_SUITE_DEF_PATH/bin/list_files.sh $CYLC_SUITE_WORK_DIR/
