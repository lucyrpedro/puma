#!/bin/bash

#file=${CYLC_SUITE_DEF_PATH}/next-cycle.txt 
#NEXT_CYCLE=$(cat "$file")

NEXT_CYCLE=$(cylc cycle-point --offset-years=1)

# Create broadcast.rc file
cat > ${CYLC_SUITE_DEF_PATH}/broadcast-share.rc << EOF
[environment]
        VAR_DIR=$CYLC_SUITE_WORK_DIR/${NEXT_CYCLE}/model
EOF
