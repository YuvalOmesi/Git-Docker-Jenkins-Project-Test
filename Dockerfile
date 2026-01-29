FROM alpine:latest

WORKDIR /project

RUN apk update

CMD ["bash"]
