#!/bin/bash	  
echo Hello World!
export BROADCAST="true"
if [[ $BROADCAST == "true" ]]; then
	echo broadcast is true: $BROADCAST
else
	echo broadcast is false: $BROADCAST
fi
