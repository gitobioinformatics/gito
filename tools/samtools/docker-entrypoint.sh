#!/bin/sh

if [ $(id -u) = 0 ]; then
	cat <<-EOL 
		Don't run this image as root.
		
		Consider adding '--user \$(id -u):\$(id -g)' to docker run arguments

	EOL

	sleep 5
fi

if [ "$#" -eq 0 ]; then
	set -- samtools
fi

if [ "${1#-}" != "$1" ]; then
	set -- samtools $@
fi

if [ "$1" = 'help' ]; then
    set -- samtools $@
fi

if [ -n "$1" ] && [ "$(samtools help "$1" 2>&1)" != "[main] unrecognized command '$1'" ]; then
    set -- samtools $@
fi

exec $@

