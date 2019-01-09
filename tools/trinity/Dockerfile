FROM alpine:3.8

ARG PKG_REPOSITORY 
ARG PKG_PUBKEY_URL 

RUN wget ${PKG_PUBKEY_URL} -P /etc/apk/keys \
    && apk add --no-cache --repository ${PKG_REPOSITORY} trinity

