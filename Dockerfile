FROM alpine:latest

WORKDIR .

ARG MY_FILE = ${MY_FILE} 

RUN apk update

COPY MY_FILE

RUN echo MY_FILE

CMD ["/bin/sh"]
