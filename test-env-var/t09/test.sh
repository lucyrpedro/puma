#!/bin/bash	  
echo Hello World!
echo $NUM
BROADCAST=$(($NUM % 2))
if [[ $BROADCAST == 0 ]]; then
	echo broadcast is 0: $BROADCAST
else
	echo broadcast is 1: $BROADCAST
fi
