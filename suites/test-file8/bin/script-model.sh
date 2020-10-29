#!/bin/sh

touch a.txt

GREETING=${GREETING:-Goodbye}
echo "$GREETING World! from $0"
