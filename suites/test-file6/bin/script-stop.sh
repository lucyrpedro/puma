#!/bin/sh

touch d.txt

GREETING=${GREETING:-Goodbye}
echo "$GREETING World! from $0"
