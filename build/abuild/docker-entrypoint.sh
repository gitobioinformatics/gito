#!/bin/sh

set -e

if [ "$(id -u)" -eq 0 ]; then
    if [ "$1" = 'apk-build' ]; then
        apk update
        exec su-exec abuild "$0" "$@"
    fi

    if [ "$1" = 'abuild' ]; then
        apk update
        exec su-exec abuild "$0" "$@"
    fi
fi

exec "$@"

