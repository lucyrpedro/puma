#!/bin/sh

touch c.txt

GREETING=${GREETING:-Goodbye}
echo "$GREETING World! from $0"
