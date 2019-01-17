FROM gitobioinformatics/gito:3.8

LABEL name="Trinity"
LABEL version="2.8.4"
LABEL homepage="https://github.com/trinityrnaseq/trinityrnaseq/wiki"

RUN apk add --no-cache trinity=2.8.4-r0

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

