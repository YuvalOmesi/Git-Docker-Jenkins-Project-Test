FROM alpine:latest

WORKDIR /app

ARG TESTWORD
ENV TESTWORD=${TESTWORD}

RUN ls -la
RUN cat "${TESTWORD}"

COPY ${MY_FILE} /app

RUN apk update

RUN ls -la

CMD ["/bin/sh"]
