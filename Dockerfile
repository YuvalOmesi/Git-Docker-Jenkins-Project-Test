FROM alpine:latest

WORKDIR .

RUN apk update && apk add --no-cache git curl coreutils

CMD ["bash"]
