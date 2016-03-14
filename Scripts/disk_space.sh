#!/bin/bash
# Version 1.0 by Sylvain La Gravière
# Twitter : @darkomen78
# Mail : darkomen@me.com

DISKCAP=`df -H / | awk 'NR==2''{print $2}'`
DISKUSE=`df -H / | awk 'NR==2''{print $3}'  |  sed 's/G//g'`
WARNSPACE=`df / | awk '{print $5}' | grep % |  sed 's/%//g'`
DISKSPACE=$((100 - $WARNSPACE))
ERRORSIZE=90
WARNSIZE=80



echo "hitp-enabled: YES"
echo "hitp-title: Stockage : $DISKSPACE% disponible ($DISKUSE/"$DISKCAP"o)"

if (( "$WARNSPACE" > "$ERRORSIZE" )); then
  echo "hitp-state: error"
  exit 0
elif (( "$WARNSPACE" > "$WARNSIZE" )); then
  echo "hitp-state: warning"
  exit 0
else
  echo "hitp-state: ok"
  exit 0
fi
