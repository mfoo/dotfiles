## -*- docker-image-name: "mfoo/dotfiles" -*-

# Dockerfile purpose: testing my emacs configuration under TI
FROM alpine:3.16
MAINTAINER martin@mfoot.com

RUN apk update
RUN apk update ca-certificates
RUN apk add emacs

COPY . /root

RUN emacs --batch -l ~/.emacs

ENTRYPOINT emacs
