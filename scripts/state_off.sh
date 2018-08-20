#!/bin/bash

SCRIPT_PATH=$(dirname $0)
HASS_PASSWORD=$(grep 'http_password:' ${SCRIPT_PATH}/../secrets.yaml | awk '{print $2}')

curl -H "x-ha-access: ${HASS_PASSWORD}" -X POST -d '{"state": "OFF"}' http://127.0.0.1:8123/api/states/$1
