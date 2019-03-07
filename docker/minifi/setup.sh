#!/bin/sh

NIFI_SERVER=${NIFI_SERVER:-nifi}
NIFI_SERVER_PORT=${NIFI_SERVER_PORT:-8080}
FILE_TO_APPEND=${FILE_TO_APPEND:-/tmp/tail.txt}
INPUT_PORT=${INPUT_PORT:-1234}
CONF_DIR=${MINIFI_HOME}/conf

mv config.yml ${CONF_DIR}

cd ${CONF_DIR}

cp config.yml config.yml.orig
sed -i 's!NIFI_SERVER_PORT!'${NIFI_SERVER_PORT}'!g' config.yml
sed -i 's!NIFI_SERVER!'${NIFI_SERVER}'!g' config.yml
sed -i 's!FILE_TO_APPEND!'${FILE_TO_APPEND}'!g' config.yml

