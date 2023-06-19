#!/bin/bash
# Version 2.0 by Sylvain La Gravière
# Github : Darkomen78

darwin_vers=$(echo $OSTYPE | cut -d . -f 1 | sed 's/[^0-9]*//g')

if [[ "$darwin_vers" -gt 18 ]]; then
  DISKCAP=$(df -H /System/Volumes/Data/ | awk 'NR==2 {print $2}')
  DISKUSE=$(df -H /System/Volumes/Data/ | awk 'NR==2 {print $3}')
  PERCENTUSE=$(df /System/Volumes/Data/ | awk '{print $5}' | grep % | sed 's/%//g')
else
  DISKCAP=$(df -H / | awk 'NR==2 {print $2}')
  DISKUSE=$(df -H / | awk 'NR==2 {print $3}')
  PERCENTUSE=$(df / | awk '{print $5}' | grep % | sed 's/%//g')
fi
PERCENTFREE=$((100 - $PERCENTUSE))
ERRORSIZE=90
WARNSIZE=80

echo "hitp-enabled: YES"
echo "hitp-title: Stockage : "$PERCENTFREE"% disponible ("$DISKUSE"o/"$DISKCAP"o)"

if (( "$PERCENTUSE" > "$ERRORSIZE" )); then
  echo "hitp-state: error"
  exit 0
elif (( "$PERCENTUSE" > "$WARNSIZE" )); then
  echo "hitp-state: warning"
  exit 0
else
  echo "hitp-state: ok"
  exit 0
fi
exit 0
