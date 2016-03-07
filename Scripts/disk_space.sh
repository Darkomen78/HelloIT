#!/bin/bash
# Version 1.0 by Sylvain La Gravière
# Twitter : @darkomen78
# Mail : darkomen@me.com

DISKUSE=`df / | awk '{print $5}' | grep %`
WARNSPACE=`df / | awk '{print $5}' | grep % |  sed 's/%//g'`
DISKSPACE=$((100 - WARNSPACE))

echo "hitp-enabled: YES"
echo "hitp-title: Stockage disponible : $DISKSPACE""%"

if [[ "$WARNSPACE" > 90 ]]; then
  echo "hitp-state: error"
  exit 0
elif [[ "$WARNSPACE" > 80 ]]; then
  echo "hitp-state: warning"
  exit 0
else
  echo "hitp-state: ok"
  exit 0
fi
