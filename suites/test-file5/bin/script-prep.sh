#!/bin/sh

touch b.txt

GREETING=${GREETING:-Goodbye}
echo "$GREETING World! from $0"
