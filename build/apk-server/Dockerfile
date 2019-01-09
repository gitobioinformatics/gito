FROM nginx:1.15-alpine

ENV HTTP_SERVER_ROOT=/app/apk_server

COPY web ${HTTP_SERVER_ROOT}
COPY nginx.conf /etc/nginx/

