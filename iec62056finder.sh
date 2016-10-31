#!/bin/bash

# to start sening request messages to ttyUSB5 starting with address 100
# ./iec62056finder.sh /dev/ttyUSB5 100

if [[ $# -lt 1 ]]; then
    dev=/dev/stdout
else 
    dev=$1
fi

if [[ $# -lt 2 ]]; then
    count=0
else 
    count=$2
fi

printf '/?!\015\012' >> ${dev} # get vendor id, all devices usually answer. Indicates that serial settings OK

attempts=2
att_ctr=1
while [ 1 ]
do     
    printf '/?'"${count}"'!\015\012' >> ${dev}
    if [[ ${att_ctr} -eq  ${attempts} ]]; then
        count=$((count+1)) 
        att_ctr=1
    fi
    att_ctr=$((att_ctr+1))
    sleep 2 
done
