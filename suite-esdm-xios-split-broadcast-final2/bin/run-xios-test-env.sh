#!/bin/bash

cp $CYLC_SUITE_DEF_PATH/bin/init-script.sh $CYLC_SUITE_SHARE_DIR/$CYLC_TASK_CYCLE_POINT
cp $CYLC_SUITE_DEF_PATH/bin/run-xios-test.sh $CYLC_SUITE_SHARE_DIR/$CYLC_TASK_CYCLE_POINT

cd $CYLC_SUITE_SHARE_DIR/$CYLC_TASK_CYCLE_POINT/

. init-script.sh
#. create-xios-test-in.sh;
#. create-input-data.sh;
#. create-xios-xml.sh;
#. create-esdm-conf.sh;
. run-xios-test.sh;
