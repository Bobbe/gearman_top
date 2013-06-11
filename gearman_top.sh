#!/bin/bash
if [ "$1" == '' ] ;
then
        echo "run ./gearman-top.sh <IP> <N>, where N - numer of cycles"
        exit 1
else
        watch -n 1 -d '(echo status ; sleep 0.1) | netcat '$1' 4730 | awk -f column.awk'
fi
