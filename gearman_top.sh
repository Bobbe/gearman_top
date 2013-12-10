#!/bin/bash

# Absolute path to this script, e.g. /home/user/bin/foo.sh

SCRIPT=$(readlink -f "$0")

# Absolute path this script is in, thus /home/user/bin

SCRIPTPATH=$(dirname "$SCRIPT")
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
        watch -n 1 -d -t '(echo status ; sleep 0.1) | '${nc_cmd}' '$1' 4730 | awk -f '$SCRIPTPATH'column.awk'
fi
