#!/bin/bash

source /root/miniconda3/bin/activate secretflow

if [ $# -lt 1 ]; then
    connection_file=/tmp/connection-file.json
else
    connection_file=$1
fi

cat $connection_file
cp $connection_file /tmp/tmp-connection-file.json

# Modify the damn connection file to use proper IP address now
sed -i 's;127.0.0.1;0.0.0.0;' /tmp/tmp-connection-file.json

python -m ipykernel_launcher --ip=0.0.0.0 -f /tmp/tmp-connection-file.json
