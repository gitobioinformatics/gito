FROM alpine:3.8

ENV ABUILD_HOME="/app"

ENV PACKAGER_PRIVKEY="$ABUILD_HOME/keys/packager_key.rsa" 
ENV REPODEST="$ABUILD_HOME/packages"

RUN adduser -h $ABUILD_HOME -H -S -G abuild abuild \
    && echo "%abuild ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN apk update \
    && apk add alpine-sdk su-exec

RUN DISTFILES=/var/chache/distfiles \
    && mkdir -p $REPODEST $DISTFILES \
    && chown abuild:abuild $REPODEST \
    && chgrp abuild $DISTFILES \
    && chmod g+w $REPODEST $DISTFILES

COPY apk-build /usr/local/bin

WORKDIR "$ABUILD_HOME"

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

