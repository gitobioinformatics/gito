#!/bin/sh

if [ $(id -u) = 0 ]; then
	cat <<-EOL 
		Don't run this image as root.
		
		Consider adding '--user \$(id -u):\$(id -g)' to docker run arguments

	EOL

	sleep 5
fi

if [ "$#" -eq 0 ]; then
	set -- jellyfish
fi

if [ "${1#-}" != "$1" ]; then
	set -- jellyfish $@
fi

if [ -n "$1" ] && jellyfish "$1" --help > /dev/null 2>&1; then
    set -- jellyfish $@
fi

exec $@

