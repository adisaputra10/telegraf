#!/bin/bash

set -m
CONFIG_TEMPLATE="/telegraf.template.conf"
CONFIG_FILE="/etc/telegraf/telegraf.conf"

sed -e "s/\${HOST_NAME}/grafanatest/" \
 -e "s!\${INFLUXDB_HOST}!34.213.67.217!" \
 -e "s/\${INFLUXDB_PORT}/8086/" \
 -e "s/\${DATABASE}/telegraf/" \
 $CONFIG_TEMPLATE > $CONFIG_FILE

echo "=> Starting Telegraf ..."

exec telegraf -config /etc/telegraf/telegraf.conf
