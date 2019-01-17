FROM gitobioinformatics/gito:3.8

LABEL name="FastQC"
LABEL version="0.11.7"
LABEL homepage="http://www.bioinformatics.babraham.ac.uk/projects/fastqc"

RUN apk add --no-cache fastqc=0.11.7-r0

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

