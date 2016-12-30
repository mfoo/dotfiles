FROM ubuntu:16.04
MAINTAINER martin@mfoot.com

RUN apt-get update && apt-get install -y emacs

# Expects my dotfiles repository to be mounted at /dotfiles
ENV HOME /dotfiles
ENTRYPOINT emacs --batch -l ~/.emacs
