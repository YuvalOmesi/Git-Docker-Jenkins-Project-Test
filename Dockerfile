FROM alpine:latest

WORKDIR /app

ENV MY_FILE

RUN echo "test = ${MY_FILE}"

COPY ${MY_FILE} /app

RUN apk update

RUN ls -la

CMD ["/bin/sh"]
