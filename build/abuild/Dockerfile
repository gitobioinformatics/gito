FROM alpine:3.8

ENV ABUILD_HOME="/app"

ENV APORTSDIR="$ABUILD_HOME/aports"
ENV REPODEST="$ABUILD_HOME/packages"

ENV PACKAGER_PRIVKEY="$ABUILD_HOME/keys/packager_key.rsa"

RUN adduser -h $ABUILD_HOME -H -S -G abuild abuild \
    && echo "%abuild ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN DISTFILES=/var/chache/distfiles \
    && mkdir -p $REPODEST $DISTFILES \
    && chown abuild:abuild $REPODEST \
    && chgrp abuild $DISTFILES \
    && chmod 640 $REPODEST $DISTFILES

RUN apk update \
    && apk add alpine-sdk su-exec

COPY apk-build /usr/local/bin

WORKDIR "$ABUILD_HOME"

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

