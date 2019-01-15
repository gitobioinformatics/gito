FROM alpine:3.8

ARG PKG_REPOSITORY 
ARG PKG_PUBKEY_URL 

LABEL name="trimmomatic"
LABEL version="0.38"
LABEL homepage=""http://www.usadellab.org/cms/?page"

RUN wget ${PKG_PUBKEY_URL} -P /etc/apk/keys \
    && apk add --no-cache --repository ${PKG_REPOSITORY} trimmomatic

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

