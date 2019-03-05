FROM gitobioinformatics/gito:3.8

LABEL name="SPAdes"
LABEL version="3.13.0"
LABEL homepage="http://cab.spbu.ru/software/spades"

RUN apk add --no-cache spades=3.13.0-r0

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

