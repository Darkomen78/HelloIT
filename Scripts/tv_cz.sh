#!/bin/bash
# Version 1.0 by Sylvain La Gravière
# Twitter : @darkomen78
# Mail : darkomen@me.com

if [ "$1" == "title" ]; then
  echo "hitp-enabled: YES"
  echo "hitp-title: Activer la télémaintenance"
  echo "hitp-state: none"
fi

if [ "$1" == "run" ]; then
  osascript -e 'display notification "Ouverture de la télémaintenance" with title "Cliczone"'
  # Generate random string
  RANDFOLDER=$(date |md5 | head -c8; echo)
  TVCZARC="/tmp/$RANDFOLDER/tvcz.zip"
  # TeamViewer custom Cliczone source URL
  TVCZSRC="https://download.teamviewer.com/custom/mac/v_11/QS/lng_fr/idc_ss4dtnj"
  mkdir /tmp/$RANDFOLDER
  curl -L $TVCZSRC -o $TVCZARC && unzip -q -o $TVCZARC -d /tmp/$RANDFOLDER
  mv "/tmp/$RANDFOLDER/TeamViewerQS.app" /tmp/$RANDFOLDER/Telemaintenance.app
  open /tmp/$RANDFOLDER/Telemaintenance.app
  echo "hitp-state: none"
fi
