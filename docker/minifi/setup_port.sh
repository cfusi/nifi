#!/bin/sh

NIFI_PORT_ID=$1
CONF_DIR=${MINIFI_HOME}/conf

cd ${CONF_DIR}

sed -i 's!NIFI_PORT_ID!'${NIFI_PORT_ID}'!g' config.yml
