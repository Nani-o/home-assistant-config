#!/bin/bash

SCRIPT_PATH=$(dirname $0)

if [[ "$1" == "on" ]]
then
    PC_MAC=$(grep 'pc_mac:' ${SCRIPT_PATH}/../secrets.yaml | awk '{print $2}')
    wakeonlan "$PC_MAC"
elif [[ "$1" == "off" ]]
then
    PC_IP=$(grep 'pc_ip:' ${SCRIPT_PATH}/../secrets.yaml | awk '{print $2}')
    ssh nani@$PC_IP "shutdown /s /t 0"
fi
