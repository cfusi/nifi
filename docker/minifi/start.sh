#!/bin/sh

tail -F "${MINIFI_HOME}/logs/minifi-app.log" &
"${MINIFI_HOME}/bin/minifi.sh" run &
minifi_pid="$!"

while [ true ]
do
   sleep 1000
done
