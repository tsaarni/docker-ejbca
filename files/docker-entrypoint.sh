#!/bin/bash

set -e

case "$1" in
    -h|--help|help)  cat /docker-entrypoint-help.txt >&2; exit 1 ;;
    server)          ;;
    *)               exec "$@";;
esac

$APPSRV_HOME/bin/standalone.sh -b 0.0.0.0



