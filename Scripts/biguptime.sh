#!/bin/bash
# Version 1.0 by Sylvain La Gravière
# Twitter : @darkomen78
# Mail : darkomen@me.com

BIGUPTIME="$(uptime | grep days)"
if [ -z "$BIGUPTIME" -a "${BIGUPTIME+x}" = "x" ]; then
# Not a big uptime, less than one day
  echo "hitp-enabled: NO"
  echo "hitp-state: none"
else
  echo "hitp-enabled: YES"
  BIGUPTIME="$($BIGUPTIME | uptime | awk '{ print $3 }')"
  echo "hitp-title: Fonctionne depuis $BIGUPTIME jours"
  if (( "$BIGUPTIME" > "40" )); then
    echo "hitp-state: error"
    exit 0
  elif (( "$BIGUPTIME" > "25" )); then
    echo "hitp-state: warning"
    exit 0
  else
    echo "hitp-state: ok"
    exit 0
  fi
fi
