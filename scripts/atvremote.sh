#!/bin/bash

SCRIPT_PATH=$(dirname $0)
LOGIN_ID=$(grep 'atv_login_id:' ${SCRIPT_PATH}/../secrets.yaml | awk '{print $2}')
ADDRESS=$(grep 'atv_ip:' ${SCRIPT_PATH}/../secrets.yaml | awk '{print $2}')
AIRPLAY_CREDENTIALS=$(grep 'atv_airplay_credentials:' ${SCRIPT_PATH}/../secrets.yaml | awk '{print $2}')

COMMAND="$1"

function atv() {
    atvremote --login_id "${LOGIN_ID}" --address "${ADDRESS}" --airplay_credentials "${AIRPLAY_CREDENTIALS}" $@
}

if [[ "${COMMAND}" == "menu" ]]; then
    atv top_menu
elif [[ "${COMMAND}" == "plex" ]]; then
    atv top_menu
    atv down left left left left up up up up up right select
elif [[ "${COMMAND}" == "youtube" ]]; then
    atv top_menu
    atv down left left left left up up up up up select
elif [[ "${COMMAND}" == "molotov" ]]; then
    atv top_menu
    atv down left left left left up up up up up right right select
elif [[ "${COMMAND}" == "twitch" ]]; then
    atv top_menu
    atv down left left left left up up up up up right right right select
fi
