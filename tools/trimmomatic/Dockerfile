FROM alpine:3.8

ARG PKG_REPOSITORY 
ARG PKG_PUBKEY_URL 
ARG PKG_PUBKEY 

RUN wget ${PKG_PUBKEY_URL} -O /etc/apk/keys/${PKG_PUBKEY} \
    && apk add --no-cache --repository ${PKG_REPOSITORY} trimmomatic \
    && rm /etc/apk/keys/${PKG_PUBKEY}

