FROM gitobioinformatics/gito:3.8

LABEL name="Prokka"
LABEL version="1.13"
LABEL homepage="http://vicbioinformatics.com/software.prokka.shtml"

RUN apk add --no-cache prokka=1.13-r0

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

