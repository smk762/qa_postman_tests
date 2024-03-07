#!/usr/bin/env bash
set -x

trap 'komodo-cli -ac_name=QATEST stop'  SIGHUP SIGINT SIGTERM

# Running KMD daemon

if ! [ -f /home/komodian/.komodo/QATEST/debug.log ]; then
    echo "" > /home/komodian/.komodo/QATEST/debug.log
fi

# TODO: We might need to add some antara params here to be able to test specific rpc methods.
# https://komodo-docs-revamp-2023.pages.dev/en/docs/antara/api/

CONF_PATH="/home/komodian/.komodo/QATEST"

exec komodod -ac_name=QATEST -port=$P2P_PORT -minrelaytxfee=0.000035 -opretmintxfee=0.004 "$@" &
sleep 5
tail -f "${CONF_PATH}/debug.log" & wait

set +x
