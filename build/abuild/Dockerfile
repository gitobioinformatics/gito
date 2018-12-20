ARG ALPINE_VERSION=3.8
FROM alpine:${ALPINE_VERSION}

ENV ABUILD_HOME="/var/lib/abuild"

ENV PACKAGER_PRIVKEY="$ABUILD_HOME/keys/packager_key.rsa" 
ENV REPODEST="${ABUILD_HOME}/packages"

RUN apk update \
    && apk add su-exec alpine-sdk

RUN mkdir -p /var/cache/distfiles \
	&& chgrp abuild /var/cache/distfiles \
	&& chmod g+w /var/cache/distfiles

COPY apk-build /usr/local/bin

WORKDIR "$ABUILD_HOME"

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

