#!/bin/sh

set -e

if [ -z $USERID ]; then
    echo "Environment variable 'USERID' not set, add '-e USERID=\$\(id -u\)\' to run options."
    return 1
fi

add_builder_user() {
    if id -u ${USERID} > /dev/null 2>&1; then
        return
    fi

    adduser -h $ABUILD_HOME -H -u "$USERID" -D builder
	addgroup builder abuild

	echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
}

if [ $(id -u) -eq 0 ]; then
    add_builder_user

    chown -R "builder" .

    if [ -f "$PACKAGER_PRIVKEY" ]; then
        chmod g+r $PACKAGER_PRIVKEY
        chgrp -R abuild $PACKAGER_PRIVKEY
    fi

    if [ "$1" = 'apk-build' ]; then
        apk update
        exec su-exec builder "$0" "$@"
    fi

    if [ "$1" = 'abuild' ]; then
        apk update
        exec su-exec builder "$0" "$@"
    fi

    if [ "$1" = 'abuild-keygen' ]; then
        exec su-exec builder "$0" "$@"
    fi
fi

exec "$@"

