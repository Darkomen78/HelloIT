#!/bin/bash
# Version 1.1 by Sylvain La Gravière
# Github : Darkomen78

BIGUPTIME=$(uptime | grep days | awk '{ print $3 }')
if [ -z "$BIGUPTIME" -a "${BIGUPTIME+x}" = "x" ]; then
# Not a big uptime, less than one day
  echo "hitp-enabled: NO"
  echo "hitp-state: none"
  echo "hitp-hidden: YES"
else
  echo "hitp-enabled: YES"
  if (( "$BIGUPTIME" > "30" )); then
    echo "hitp-title: Dernier démarrage il y a plus d'un mois"
		echo "hitp-notification: L'ordinateur n'a pas été redémarré depuis plus d'un mois"
    echo "hitp-state: error"
    exit 0
  elif (( "$BIGUPTIME" > "20" )); then
    echo "hitp-title: Dernier démarrage il y a $BIGUPTIME jours"
		echo "hitp-notification: L'ordinateur n'a pas été redémarré depuis plus de $BIGUPTIME jours"
    echo "hitp-state: warning"
    exit 0
  else
    echo "hitp-title: Dernier démarrage il y a $BIGUPTIME jours"
    echo "hitp-state: ok"
    exit 0
  fi
fi
