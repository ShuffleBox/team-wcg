#!/bin/sh
set -e

cd /var/lib/boinc

if [ ! -f client_state.xml ]; then
  echo "Attaching to World Community Grid..."
  exec /usr/bin/boinc \
    --allow_remote_gui_rpc \
    --attach_project https://www.worldcommunitygrid.org "$WCG_ACCOUNT_KEY"
else
  echo "BOINC already attached, starting client..."
  exec /usr/bin/boinc --allow_remote_gui_rpc
fi
