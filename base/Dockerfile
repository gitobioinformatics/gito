FROM alpine:3.8

ARG REPOSITORY="http://gitobld-apk-server.local/packages/ports"
ARG PUBKEY_URL="http://gitobld-apk-server.local/packager_key.rsa.pub"

RUN echo ${REPOSITORY} >> /etc/apk/repositories \
    && wget ${PUBKEY_URL} -P /etc/apk/keys

