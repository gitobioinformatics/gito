FROM alpine:3.8

ARG PKG_REPOSITORY 
ARG PKG_PUBKEY_URL 

LABEL name="samtools"
LABEL version="1.9"
LABEL homepage="https://samtools.github.io"

RUN wget ${PKG_PUBKEY_URL} -P /etc/apk/keys \
    && apk add --no-cache --repository ${PKG_REPOSITORY} samtools

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

