FROM alpine:3.8

ARG PKG_REPOSITORY="http://gitobld-apk-server.local/packages/ports"
ARG PKG_PUBKEY_URL="http://gitobld-apk-server.local/packager_key.rsa.pub"

RUN echo ${PKG_REPOSITORY} >> /etc/apk/repositories \
    && wget ${PKG_PUBKEY_URL} -P /etc/apk/keys

