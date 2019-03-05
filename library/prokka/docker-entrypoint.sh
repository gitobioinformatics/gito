#!/bin/sh

if [ $(id -u) = 0 ]; then
	cat <<-EOL 
		Don't run this image as root.

		Consider adding '--user \$(id -u):\$(id -g)' to docker run arguments

	EOL

	sleep 5
fi

if [ "$#" -eq 0 ]; then
    set -- prokka --help
fi

if [ "${1#-}" != "$1" ] || [ -f "$1" ]; then
    set -- prokka $@
fi

exec $@

