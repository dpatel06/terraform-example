#!/bin/bash

for i in $(seq 1 30)
do
    if sudo netstat -tpln | grep 3000 > /dev/null 2>&1 \
        && [[ "$(curl http://localhost:3000/health-check >/dev/null 2>&1)" -eq "OK" ]]
    then
        exit 0
    else
        sleep 10
    fi
done

echo "Port is unavailable"
exit -1
