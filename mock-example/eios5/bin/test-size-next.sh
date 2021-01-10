#!/bin/bash

# The first file is placed in the WORK directory

# BROADCAST=0 => the same file in the next cycle is placed in the WORK directory
# BROADCAST=1 => the same file in the next cycle is placed in the SHARE directory
        BROADCAST=0

# The location of the previous file is unknown: WORK or SHARE (exactly one) 
# This location may be saved as a environment variable, if necessary.

# Test if previous file is in the WORK directory and save its size


        FILE=$CYLC_SUITE_WORK_DIR/$CYLC_TASK_CYCLE_POINT/model/b.txt
	echo "FILE=$FILE"

        if test -f "$FILE"; then
                SIZE=$(ls -l $FILE | cut -f5 -d " ")
		echo "SIZE=$SIZE"
        fi

# Test if previous file is in the SHARE directory and save its size

        FILE=$CYLC_SUITE_SHARE_DIR/$CYLC_TASK_CYCLE_POINT/model/b.txt
	echo "FILE=$FILE"

        if test -f "$FILE"; then
                SIZE=$(ls -l $FILE | cut -f5 -d " ")
		echo "SIZE=$SIZE"
        fi

# If the size is bigger than a THRESHOLD,
# set BROADCAST to 1 and send the next file to SHARE

        THRESHOLD=5000

        if [[ $SIZE -gt $THRESHOLD ]]; then
                BROADCAST=1
        fi

	echo "SIZE=$SIZE"
        echo "BROADCAST=$BROADCAST"

#        NEXT_CYCLE=$(cylc cycle-point --offset-years=1)
#        echo "NEXT_CYCLE = $NEXT_CYCLE"

        if [[ $BROADCAST == 1 ]]; then
		cylc broadcast -n 'broadcast-action' -s "[environment]SCRIPT_NAME=move-file-share.sh" "${CYLC_SUITE_NAME}"
        else
		cylc broadcast -n 'broadcast-action' -s "[environment]SCRIPT_NAME=move-file-work.sh" "${CYLC_SUITE_NAME}"
        fi

# Here we don't need to specify the cycle because 
# the conditional is updated in every cycle

