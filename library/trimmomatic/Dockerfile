FROM gitobioinformatics/gito:3.8

LABEL name="Trimmomatic"
LABEL version="0.38"
LABEL homepage="http://www.usadellab.org/cms/?page=trimmomatic"

RUN apk add --no-cache trimmomatic=0.38-r0

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

