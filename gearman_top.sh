#!/bin/bash
if [ "$1" == '' ] ;
then
        echo "run ./gearman_top.sh <IP>"
        exit 1
else
        watch -n 1 -d '(echo status ; sleep 0.1) | netcat '$1' 4730 | awk -f column.awk'
fi
