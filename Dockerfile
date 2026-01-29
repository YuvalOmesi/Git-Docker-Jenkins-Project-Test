FROM alpine:latest

WORKDIR .

RUN apk update

CMD ["bash"]
