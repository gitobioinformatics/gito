FROM gitobioinformatics/gito:3.8

LABEL name="Bowtie2"
LABEL version="2.3.4.3"
LABEL homepage="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"

RUN apk add --no-cache bowtie2=2.3.4.3-r0

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

