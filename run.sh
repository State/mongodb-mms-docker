#!/bin/bash

: ${MMS_AGENT:=monitoring}

if [[ -n ${MMS_API_KEY} ]]; then
  sed -e "s/mmsApiKey=/mmsApiKey=${MMS_API_KEY}/" \
    -i /etc/mongodb-mms/backup-agent.config \
    -i /etc/mongodb-mms/monitoring-agent.config
else
  echo 'MMS_API_KEY must be set. Exiting..'
  exit 1
fi

# Where is consistency!?
if [[ ${MMS_AGENT} == 'monitoring' ]]; then
  conf_flag='-conf'
else
  conf_flag='-c'
fi


if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
  exec /usr/bin/mongodb-mms-${MMS_AGENT}-agent ${conf_flag} /etc/mongodb-mms/${MMS_AGENT}-agent.config "$@"
fi

exec "$@"

