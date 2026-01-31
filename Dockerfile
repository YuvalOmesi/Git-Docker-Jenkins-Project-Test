FROM alpine:latest

WORKDIR /app

ARG MY_FILE

COPY ${MY_FILE} /app

RUN apk update

RUN echo 'hello from docker file'

RUN echo "your choosen file is: ${MY_FILE}"

RUN ls -la


CMD ["/bin/sh"]
