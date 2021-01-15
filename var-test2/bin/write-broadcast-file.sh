#!/bin/bash

file=${CYLC_SUITE_DEF_PATH}/next-cycle.txt 
NEXT_CYCLE=$(cat "$file")

# Create broadcast.rc file
cat > ${CYLC_SUITE_DEF_PATH}/broadcast.rc << EOF
[environment]
        VAR_DIR=$CYLC_SUITE_WORK_DIR/${NEXT_CYCLE}
EOF
