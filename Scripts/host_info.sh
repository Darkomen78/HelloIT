#!/bin/bash
# Version 1.0 by Sylvain La Gravière
# Twitter : @darkomen78
# Mail : darkomen@me.com

# Bonjour (zero-conf) name
BJRNAME=`scutil --get LocalHostName`
SERIAL=`system_profiler SPHardwareDataType | grep Serial | awk '{print $4}'`
echo "hitp-enabled: YES"
echo "hitp-title: $BJRNAME   —   $SERIAL"
echo "hitp-state: none"
