FROM gitobioinformatics/gito:3.8

LABEL name="Samtools"
LABEL version="1.9"
LABEL homepage="https://samtools.github.io"

RUN apk add --no-cache samtools=1.9-r0

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

