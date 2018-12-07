FROM alpine:3.8

ARG GITO_URL="http://aports.local"
ARG GITO_REPOSITORY="${GITO_URL}/packages/testing"
ARG GITO_PUBKEY="packager_key.rsa.pub"

ARG GITO_PKG=""

RUN wget ${GITO_URL}/keys/${GITO_PUBKEY} -O /etc/apk/keys/${GITO_PUBKEY} \
    && apk add --no-cache --repository ${GITO_REPOSITORY} ${GITO_PKG} \
    && rm /etc/apk/keys/${GITO_PUBKEY}

