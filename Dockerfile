FROM alpine:latest

WORKDIR /app

ARG MY_FILE

COPY ${MY_FILE} /app

RUN apk update

RUN ls -la

CMD ["/bin/sh"]
