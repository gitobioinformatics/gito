#!/bin/sh

set -e

if [ "$(id -u)" -eq 0 ]; then
    chown -R abuild ./packages

    if [ "$1" = 'apk-build' ]; then
        apk update
        exec su-exec abuild "$0" "$@"
    fi

    if [ "$1" = 'abuild' ]; then
        apk update
        exec su-exec builder "$0" "$@"
    fi

    if [ "$1" = 'abuild-keygen' ]; then
        exec su-exec abuild "$0" "$@"
    fi
fi

exec "$@"

