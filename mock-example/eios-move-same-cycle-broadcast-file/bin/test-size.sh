#!/bin/bash

# The initial file is always placed in the WORK directory

# BROADCAST=0 => the file is kept in the WORK directory
# BROADCAST=1 => the file is moved to the SHARE directory
		 # and deleted in the WORK directory

        BROADCAST=0

# Find the size of the file

	FILE=$CYLC_SUITE_WORK_DIR/$CYLC_TASK_CYCLE_POINT/model/a.txt
	SIZE=$(ls -l $FILE | cut -f5 -d " ")

# If the size is bigger than a THRESHOLD,
# set BROADCAST to 1 and send the file to SHARE

        THRESHOLD=5000

        if [[ $SIZE -gt $THRESHOLD ]]; then
                BROADCAST=1
        fi

	echo "SIZE=$SIZE"
        echo "BROADCAST=$BROADCAST"

        if [[ $BROADCAST == 1 ]]; then
            cylc broadcast -n 'broadcast-action' -F "${CYLC_SUITE_DEF_PATH}/broadcast.rc" -p "${CYLC_TASK_CYCLE_POINT}" "${CYLC_SUITE_NAME}"
#            cylc broadcast -n 'broadcast-action' -s "[environment]SCRIPT_NAME=move-file.sh" -p "${CYLC_TASK_CYCLE_POINT}" "${CYLC_SUITE_NAME}"
        fi
