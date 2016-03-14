#!/bin/bash
# Version 1.0 by Sylvain La Gravière
# Twitter : @darkomen78
# Mail : darkomen@me.com

# Determine interface number
# for all ethernet interface
for i in $(networksetup -listallhardwareports | grep -A1 -i 'ethernet' | grep en | grep -o "[^ ]*$")
do
if [ "`ifconfig $i | grep \"status: active\"`" != "" ]; then
ETHINT=$i
fi
done

if [ -z $ETHINT ]; then
  echo "hitp-enabled: NO"
  echo "hitp-hidden: YES"
  echo "hitp-title: Aucun matériel Ethernet"
  echo "hitp-state: unavailable"
  exit 0
fi

IP_ETH=`ipconfig getifaddr $ETHINT`

if  [ ! -z $IP_ETH ]; then
echo "hitp-enabled: YES"
echo "hitp-hidden: NO"
echo "hitp-title: IP Ethernet : $IP_ETH"
echo "hitp-state: ok"
else
  echo "hitp-enabled: YES"
  echo "hitp-hidden: NO"
  echo "hitp-title: Aucune adresse Ethernet"
  echo "hitp-state: warning"
fi
