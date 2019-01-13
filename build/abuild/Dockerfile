FROM alpine:3.8

ENV ABUILD_HOME="/var/lib/abuild"

ENV PACKAGER_PRIVKEY="$ABUILD_HOME/keys/packager_key.rsa" 
ENV REPODEST="$ABUILD_HOME/packages"

RUN apk update \
    && apk add alpine-sdk su-exec

RUN mkdir -p /var/cache/distfiles \
	&& chgrp abuild /var/cache/distfiles \
	&& chmod g+w /var/cache/distfiles

RUN adduser -h $ABUILD_HOME -H -S -G abuild abuild \
    && echo "%abuild ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY apk-build /usr/local/bin

WORKDIR "$ABUILD_HOME"

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

