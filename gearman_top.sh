#!/bin/bash

nc_cmd=$(which nc)

if [ "${nc_cmd}" == '' ] ; then
    nc_cmd=$(which netcat)
fi

if [ "${nc_cmd}" == '' ] ; then
    echo "nc or netcat are not installed"
    exit 1
fi

if [ "$1" == '' ] ;
then
        echo "run ./gearman_top.sh <IP>"
        exit 1
else
        DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
        watch -n 1 -d -t '(echo status ; sleep 0.1) | '${nc_cmd}' '$1' 4730 | awk -f '${DIR}'/column.awk'
fi
