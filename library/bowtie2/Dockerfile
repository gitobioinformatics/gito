FROM alpine:3.8

ARG PKG_REPOSITORY 
ARG PKG_PUBKEY_URL 

LABEL name="bowtie2"
LABEL version="2.3.4.3"
LABEL homepage="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"

RUN wget ${PKG_PUBKEY_URL} -P /etc/apk/keys \
    && apk add --no-cache --repository ${PKG_REPOSITORY} bowtie2

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

