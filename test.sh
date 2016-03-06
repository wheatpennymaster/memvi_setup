#!/bin/bash

NOTHING=``
OUTPUT=`ls d/`
while [ "$NOTHING" == "$OUTPUT" ]
do
        echo "not connected..."
        sleep 5
done
