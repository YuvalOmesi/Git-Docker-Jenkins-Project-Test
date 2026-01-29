FROM alpine:latest

WORKDIR /project

RUN apk update && apk add --no-cache git curl coreutils

CMD ["bash"]
