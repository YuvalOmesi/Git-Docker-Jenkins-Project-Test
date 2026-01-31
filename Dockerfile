FROM alpine:latest

WORKDIR /app

ENV TESTWORD

RUN echo "test = ${TESTWORD}"

COPY ${MY_FILE} /app

RUN apk update

RUN ls -la

CMD ["/bin/sh"]
