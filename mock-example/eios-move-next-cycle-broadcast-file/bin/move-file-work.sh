#!/bin/bash

        NEXT_CYCLE=$(cylc cycle-point --offset-years=1)
        echo "NEXT_CYCLE = $NEXT_CYCLE"

#	cylc broadcast -n 'model' -p ${NEXT_CYCLE} -s "[environment]VAR_DIR=$CYLC_SUITE_WORK_DIR/$NEXT_CYCLE/model" "${CYLC_SUITE_NAME}"
	cylc broadcast -n 'model' -p ${NEXT_CYCLE} -F "${CYLC_SUITE_DEF_PATH}/broadcast-work.rc" "${CYLC_SUITE_NAME}"
