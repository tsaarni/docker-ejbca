#!/bin/bash

set -e

case "$1" in
    help|--help|-h)  man /docker-entrypoint.man; exit 1 ;;
    server)          ;;
    *)               exec "$@";;
esac

$APPSRV_HOME/bin/standalone.sh -b 0.0.0.0



