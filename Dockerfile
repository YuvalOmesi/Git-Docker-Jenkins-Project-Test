FROM alpine:latest

WORKDIR /app

ARG MY_FILE

RUN apk update

COPY ${MY_FILE} /app

RUN echo 'hello from docker file'

RUN echo "your choosen file is: ${MY_FILE}"

RUN ls -la

RUN echo /app/MY_FILE

CMD ["/bin/sh"]
