FROM alpine:3.8

ARG GITO_REPOSITORY http://gitobld-apk-server.local/packages
ARG GITO_PUBKEY_URL http://gitobld-apk-server.local/packager_key.rsa.pub

RUN echo ${GITO_REPOSITORY} >> /etc/apk/repositories \
    && wget ${GITO_PUBKEY_URL} -P /etc/apk/keys

