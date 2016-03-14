#!/bin/bash
# Version 1.0 by Sylvain La Gravière
# Twitter : @darkomen78
# Mail : darkomen@me.com
AIRINT=$(networksetup -listallhardwareports | grep -A1 -i 'wi-fi\|airport' | grep en | grep -o "[^ ]*$")
IP_AIR=`ipconfig getifaddr $AIRINT`

if [ -z $AIRINT ]; then
  echo "hitp-enabled: NO"
  echo "hitp-hidden: YES"
  echo "hitp-title: Aucun matériel Wifi"
  echo "hitp-state: unavailable"
  exit 0
fi

if [ ! -z $IP_AIR ]; then
  echo "hitp-enabled: YES"
  echo "hitp-hidden: NO"
  echo "hitp-title: IP Wifi : $IP_AIR"
  echo "hitp-state: ok"
else
  echo "hitp-enabled: YES"
  echo "hitp-hidden: NO"
  echo "hitp-title: Aucune adresse Wifi"
  echo "hitp-state: warning"
fi
