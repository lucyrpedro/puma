#!/bin/bash

# BROADCAST=0 => the file is placed in the WORK directory
# BROADCAST=1 => the file is placed in the SHARE directory
        BROADCAST=0
# Test if the file is in the WORK directory and save its size
        FILE=$CYLC_SUITE_WORK_DIR/$CYLC_TASK_CYCLE_POINT/model/b.txt
        if test -f "$FILE"; then
                SIZE=$(ls -l $FILE | cut -f5 -d " ")
        echo "WORK: FILE=$FILE SIZE=$SIZE"
        fi
# Test if the file is in the SHARE directory and save its size
        FILE=$CYLC_SUITE_SHARE_DIR/$CYLC_TASK_CYCLE_POINT/model/b.txt
        if test -f "$FILE"; then
                SIZE=$(ls -l $FILE | cut -f5 -d " ")
        echo "SHARE: FILE=$FILE SIZE=$SIZE"
        fi
# If the size is less than equal to the threshold,
# set BROADCAST to 1 and send the NEXT FILE to SHARE
        echo "SIZE=$SIZE"
        THRESHOLD=9000
        if [[ $SIZE -lt $THRESHOLD ]]; then
                BROADCAST=1
        fi
        echo "BROADCAST=$BROADCAST"
        NEXT_CYCLE=$(cylc cycle-point --offset-years=1)
        if [[ $BROADCAST == 1 ]]; then
                cylc broadcast -n 'model' -s "[environment]VAR_DIR=$CYLC_SUITE_SHARE_DIR/$NEXT_CYCLE/model" "${CYLC_SUITE_NAME}"
        else
                cylc broadcast -n 'model' -s "[environment]VAR_DIR=$CYLC_SUITE_WORK_DIR/$NEXT_CYCLE/model" "${CYLC_SUITE_NAME}"
        fi
