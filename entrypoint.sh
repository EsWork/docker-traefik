#!/bin/sh
set -e

update-ca-certificates

if [ "${1#-}" != "$1" ]; then
    set -- traefik "$@"
fi

if traefik "$1" --help 2>&1 >/dev/null | grep "help requested" > /dev/null 2>&1; then
    set -- traefik "$@"
fi

exec "$@"
