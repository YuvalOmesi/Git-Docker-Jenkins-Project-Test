FROM alpine:latest

WORKDIR /app

ARG TESTWORD
ENV TESTWORD=${TESTWORD}
COPY ${MY_FILE} /app
RUN apk update
RUN ls -la
RUN cat "${TESTWORD}"
CMD ["/bin/sh"]
