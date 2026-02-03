FROM alpine:latest

WORKDIR /app

ARG TESTWORD
ENV TESTWORD=${TESTWORD}

RUN echo "${TESTWORD}"

COPY ${MY_FILE} /app

RUN apk update

RUN ls -la

CMD ["/bin/sh"]
