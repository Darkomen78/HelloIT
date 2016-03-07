#!/bin/bash
# Version 1.0 by Sylvain La Gravière
# Twitter : @darkomen78
# Mail : darkomen@me.com

# Bonjour (zero-conf) name
BJRNAME=`scutil --get LocalHostName`
echo "hitp-enabled: YES"
echo "hitp-title: Nom : $BJRNAME"
echo "hitp-state: none"
