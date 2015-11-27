#!/bin/bash

set -e

case "$1" in
    help|--help|-h)  man /docker-entrypoint.man; exit 1 ;;
    server)          ;;
    *)               exec "$@";;
esac

rm -rf $APPSRV_HOME/standalone/configuration/standalone_xml_history/current

$APPSRV_HOME/bin/standalone.sh -b 0.0.0.0



