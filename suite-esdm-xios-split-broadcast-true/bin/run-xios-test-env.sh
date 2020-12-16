#!/bin/bash

cp $CYLC_SUITE_DEF_PATH/bin/init-script.sh $CYLC_SUITE_SHARE_DIR/
cp $CYLC_SUITE_DEF_PATH/bin/run-xios-test.sh $CYLC_SUITE_SHARE_DIR/

cd $CYLC_SUITE_SHARE_DIR/

. init-script.sh
#. create-xios-test-in.sh;
#. create-input-data.sh;
#. create-xios-xml.sh;
#. create-esdm-conf.sh;
. run-xios-test.sh;
