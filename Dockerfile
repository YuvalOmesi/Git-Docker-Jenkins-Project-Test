FROM alpine:latest

WORKDIR /app

ARG MY_FILE

RUN apk update

COPY ${MY_FILE} /app

RUN echo 'hello from docker file'
RUN whoami
RUN pwd
RUN hostname

RUN ls -la

RUN echo /app/MY_FILE

CMD ["/bin/sh"]
