FROM gitobioinformatics/gito:3.8

LABEL name="Jellyfish"
LABEL version="2.2.10"
LABEL homepage="http://www.genome.umd.edu/jellyfish.html"

RUN apk add --no-cache jellyfish=2.2.10-r0

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

