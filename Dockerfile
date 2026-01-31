FROM alpine:latest

WORKDIR /app

ARG TESTWORD
ENV TESTWORD = ${TESTWORD}

RUN echo "test = ${TESTWORD}"

COPY ${MY_FILE} /app

RUN apk update

RUN ls -la

CMD ["/bin/sh"]
