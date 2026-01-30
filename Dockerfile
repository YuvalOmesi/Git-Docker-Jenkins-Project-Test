FROM alpine:latest

WORKDIR .

RUN apk update

CMD ["/bin/sh"]
