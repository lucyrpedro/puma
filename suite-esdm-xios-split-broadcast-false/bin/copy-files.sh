#!/bin/bash

cp $CYLC_TASK_WORK_DIR/* $CYLC_SUITE_SHARE_DIR/
echo "copying files from $CYLC_TASK_WORK_DIR to $CYLC_SUITE_SHARE_DIR"
