FROM gitobioinformatics/gito:3.8

LABEL name="Salmon"
LABEL version="0.11.3"
LABEL homepage="https://combine-lab.github.io/salmon"

RUN apk add --no-cache salmon=0.11.3-r0

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

